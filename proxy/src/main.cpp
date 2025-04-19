// proxy/src/main.cpp
// ─────────────────────────────────────────────────────────────────────────────
// Build‑time deps:
//
//   • POCO (Net, NetSSL, Util, Data, DataPostgreSQL, Foundation)
//   • libpq (PostgreSQL client library)
//
// Tested with POCO‑1.14.1 and libpq‑17 on Apple‑silicon (arm64).

// ── POCO HTTP(S) ────────────────────────────────────────────────────────────
#include <Poco/Net/HTTPServer.h>
#include <Poco/Net/HTTPRequestHandler.h>
#include <Poco/Net/HTTPRequestHandlerFactory.h>
#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>
#include <Poco/Net/HTTPSClientSession.h>
#include <Poco/Net/Context.h>
#include <Poco/Net/SSLManager.h>
#include <Poco/Net/AcceptCertificateHandler.h>
#include <Poco/Net/InvalidCertificateHandler.h>
#include <Poco/Net/HTTPRequest.h>
#include <Poco/Net/HTTPResponse.h>
#include <Poco/StreamCopier.h>

// ── POCO Data / PostgreSQL ──────────────────────────────────────────────────
#include <Poco/Data/PostgreSQL/Connector.h>
#include <Poco/Data/Session.h>
#include <Poco/Data/Statement.h>
#include <Poco/Data/Binding.h>

// ── Utilities ───────────────────────────────────────────────────────────────
#include <Poco/Environment.h>
#include <Poco/Timestamp.h>
#include <Poco/Util/ServerApplication.h>
#include <sstream>

using namespace Poco;
using namespace Poco::Net;
using namespace Poco::Data::Keywords;   // use(), into(), …

/* ─────────────────────────── Config ─────────────────────────────────────── */
static constexpr const char* UPSTREAM_HOST = "api.open-meteo.com";
static constexpr unsigned    UPSTREAM_PORT = 443;

/* ─────────────────────────── Helper: permissive TLS ─────────────────────── */
static Context::Ptr makePermissiveTLSContext()
{
    // TLS 1.3+, no CA bundle, accept ANY certificate (for demo only!)
    Context::Ptr ctx = new Context(Context::CLIENT_USE,
                                   /*privateKeyFile*/ "",
                                   /*certificateFile*/ "",
                                   /*caLocation*/ "",
                                   Context::VERIFY_NONE,
                                   /*sessionCacheSize*/ 9,
                                   /*autoReload*/ true,
                                   /*cipherList*/ "ALL");

    SharedPtr<InvalidCertificateHandler> acceptAll(
        new AcceptCertificateHandler(false)); // non‑interactive

    SSLManager::instance().initializeClient(nullptr, acceptAll, ctx);
    return ctx;
}

/* ─────────────────────────── ProxyHandler ───────────────────────────────── */
class ProxyHandler : public HTTPRequestHandler
{
    /* forward request → copy response → log to Postgres */
    void forwardAndReply(HTTPServerRequest&  in,
                         HTTPServerResponse& out)
    {
        static Context::Ptr tlsCtx = makePermissiveTLSContext();
        HTTPSClientSession upstream(UPSTREAM_HOST, UPSTREAM_PORT, tlsCtx);

        HTTPRequest upReq(in.getMethod(), in.getURI(), HTTPMessage::HTTP_1_1);
        upReq.setHost(UPSTREAM_HOST);
        upstream.sendRequest(upReq);

        HTTPResponse  upResp;
        std::istream& rs = upstream.receiveResponse(upResp);

        std::ostringstream body;
        StreamCopier::copyStream(rs, body);                // full body

        out.setStatus(upResp.getStatus());
        out.setReason(upResp.getReason());
        out.setContentType(upResp.getContentType());
        out.setContentLength64(body.str().size());
        std::ostream& ostr = out.send();
        ostr << body.str();
        ostr.flush();

        logToPostgres(in, upResp);
    }

    /* write single row (timestamp, method, path, status) */
    void logToPostgres(const HTTPServerRequest& in,
                       const HTTPResponse&      upResp)
    {
        using DataSession   = Poco::Data::Session;
        using DataStatement = Poco::Data::Statement;

        static const std::string dsn = Environment::get(
            "PROXY_PG_DSN",
            "host=localhost port=5434 dbname=postgres "
            "user=postgres password=apidebugger");

        static DataSession db("PostgreSQL", dsn);

        Timestamp::TimeVal ts = Timestamp().epochMicroseconds();
        std::string        method = in.getMethod();
        std::string        path   = in.getURI();
        int                status = static_cast<int>(upResp.getStatus());

        DataStatement insert(db);
        insert << "INSERT INTO proxy_log (timestamp,method,path,status) "
                  "VALUES (?,?,?,?)",
                  use(ts), use(method), use(path), use(status);
        insert.execute();
    }

public:
    void handleRequest(HTTPServerRequest&  in,
                       HTTPServerResponse& out) override
    {
        try
        {
            forwardAndReply(in, out);
        }
        catch (const Exception& ex)
        {
            Util::Application::instance().logger().error(
                "Proxy error: %s", ex.displayText());

            out.setStatusAndReason(HTTPResponse::HTTP_BAD_GATEWAY);
            out.setContentType("application/json");
            std::ostream& ostr = out.send();
            ostr << R"({"error":")" << ex.displayText() << R"("})";
        }
    }
};

/* ─────────────────────────── Factory & App ──────────────────────────────── */
class Router : public HTTPRequestHandlerFactory
{
    HTTPRequestHandler* createRequestHandler(const HTTPServerRequest&) override
    { return new ProxyHandler; }
};

class ProxyApp : public Util::ServerApplication
{
    int main(const std::vector<std::string>&) override
    {
        Net::initializeSSL();
        Data::PostgreSQL::Connector::registerConnector();

        HTTPServer srv(new Router, ServerSocket(8080), new HTTPServerParams);
        srv.start();
        logger().information(
            "Proxy listening on :8080  →  https://api.open‑meteo.com");
        waitForTerminationRequest();
        srv.stop();

        Data::PostgreSQL::Connector::unregisterConnector();
        Net::uninitializeSSL();
        return Application::EXIT_OK;
    }
};

POCO_SERVER_MAIN(ProxyApp)
