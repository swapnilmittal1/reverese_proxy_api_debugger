// proxy/src/main.cpp
// ─────────────────────────────────────────────────────────────────────────────
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

#include <Poco/Data/PostgreSQL/Connector.h>
#include <Poco/Data/Session.h>
#include <Poco/Data/Statement.h>
#include <Poco/Data/Binding.h>

#include <Poco/Environment.h>
#include <Poco/Timestamp.h>
#include <Poco/Util/ServerApplication.h>
#include <sstream>

using namespace Poco;
using namespace Poco::Net;
using namespace Poco::Data::Keywords;

// ───────────────────────── constants ────────────────────────────────────────
static constexpr const char* UPSTREAM_HOST = "api.open-meteo.com";
static constexpr unsigned    UPSTREAM_PORT = 443;

// ───────────────────────── TLS helper (accept‑all) ──────────────────────────
static Context::Ptr makeTLSctx()
{
    Context::Ptr ctx = new Context(Context::CLIENT_USE,
                                   "", "", "", Context::VERIFY_NONE,
                                   9, true, "ALL");

    SharedPtr<InvalidCertificateHandler> acceptAll(
        new AcceptCertificateHandler(false));

    SSLManager::instance().initializeClient(nullptr, acceptAll, ctx);
    return ctx;
}

// ───────────────────────── ProxyHandler ─────────────────────────────────────
class ProxyHandler : public HTTPRequestHandler
{
    void logToPostgres(const HTTPServerRequest& in,
                       const HTTPResponse&      upResp,
                       const std::string&      reqBody,
                       const std::string&      resBody)
    {
        static const std::string dsn = Environment::get(
            "PG_DSN",
            "host=127.0.0.1 port=5432 dbname=postgres "
            "user=postgres password=apidebugger");

        static Data::Session db("PostgreSQL", dsn);

        Timestamp::TimeVal ts = Timestamp().epochMicroseconds();
        std::string  method = in.getMethod();
        std::string  path   = in.getURI();
        int          status = static_cast<int>(upResp.getStatus());

        // Combine request and response data
        std::string body = "REQUEST:\n" + reqBody + "\n\nRESPONSE:\n" + resBody;

        Data::Statement st(db);
        st  << "INSERT INTO proxy_log(\"timestamp\",method,path,status,body) "
               "VALUES ($1,$2,$3,$4,$5)",
               use(ts)      ,   // $1
               use(method)  ,   // $2
               use(path)    ,   // $3
               use(status)  ,   // $4
               use(body);       // $5
        st.execute();
        db.commit();   // ← important!

        Util::Application::instance().logger().debug(
            "logged %s %s → %d", method, path, status);
    }

    void forwardAndReply(HTTPServerRequest&  in,
                         HTTPServerResponse& out)
    {
        static Context::Ptr tlsCtx = makeTLSctx();
        HTTPSClientSession upstream(UPSTREAM_HOST, UPSTREAM_PORT, tlsCtx);

        // Capture request body
        std::string reqBody;
        if (in.getContentLength64() > 0) {
            std::ostringstream reqBuf;
            StreamCopier::copyStream(in.stream(), reqBuf);
            reqBody = reqBuf.str();
        }

        // Add request headers to body
        std::ostringstream reqHeaders;
        reqHeaders << "Headers:\n";
        for (const auto& header : in) {
            reqHeaders << header.first << ": " << header.second << "\n";
        }
        reqBody = reqHeaders.str() + "\nBody:\n" + reqBody;

        HTTPRequest upReq(in.getMethod(), in.getURI(), HTTPMessage::HTTP_1_1);
        upReq.setHost(UPSTREAM_HOST);
        if (!reqBody.empty()) {
            upReq.setContentLength64(reqBody.size());
            upstream.sendRequest(upReq) << reqBody;
        } else {
            upstream.sendRequest(upReq);
        }

        HTTPResponse  upResp;
        std::istream& rs = upstream.receiveResponse(upResp);

        // Capture response headers
        std::ostringstream resHeaders;
        resHeaders << "Headers:\n";
        for (const auto& header : upResp) {
            resHeaders << header.first << ": " << header.second << "\n";
        }

        // Capture response body
        std::ostringstream resBuf;
        StreamCopier::copyStream(rs, resBuf);
        std::string resBody = resHeaders.str() + "\nBody:\n" + resBuf.str();

        out.setStatus(upResp.getStatus());
        out.setReason(upResp.getReason());
        out.setContentType(upResp.getContentType());
        out.setContentLength64(resBuf.str().size());
        out.send() << resBuf.str();

        logToPostgres(in, upResp, reqBody, resBody);
    }

public:
    void handleRequest(HTTPServerRequest&  in,
                       HTTPServerResponse& out) override
    {
        try { forwardAndReply(in, out); }
        catch (const Exception& ex)
        {
            Util::Application::instance().logger().error(
                "Proxy error: %s", ex.displayText());

            out.setStatusAndReason(HTTPResponse::HTTP_BAD_GATEWAY);
            out.setContentType("application/json");
            std::string errBody = R"({"error":")" + ex.displayText() + R"("})";
            out.send() << errBody;

            /* ❶ still write a DB row so the worker can see the failure */
            HTTPResponse synthetic;
            synthetic.setStatus(HTTPResponse::HTTP_BAD_GATEWAY);   // 502
            logToPostgres(in, synthetic, "", "");
        }
    }
};

// ───────────────────────── boiler‑plate ─────────────────────────────────────
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
