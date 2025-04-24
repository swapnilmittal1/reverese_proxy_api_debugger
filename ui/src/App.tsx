import { useEffect, useMemo, useState, Fragment } from "react";
import {
  useReactTable,
  getCoreRowModel,
  flexRender,
  ColumnDef,
} from "@tanstack/react-table";
import { ChevronRight, ChevronDown, Brain, RefreshCw } from "lucide-react";
import Meta from "./components/Meta";
import LogSection from "./components/LogSection";

interface Insight {
  id: number;
  ts: number; // epoch-seconds
  method: string;
  path: string;
  status: number;
  root_cause: string;
  suggestion: string;
  confidence: number;
  req_body?: string;
  req_headers?: Record<string, string>;
  res_body?: string;
  res_headers?: Record<string, string>;
}

const fmtDate = (s: number) => new Date(s * 1000).toLocaleString(undefined, { hour12: false });
const headersToString = (h?: Record<string, string>) =>
  h ? Object.entries(h).map(([k, v]) => `${k}: ${v}`).join("\n") : "—";

const pollTimeOptions = [
  { value: 5000, label: "5 s" },
  { value: 10000, label: "10 s" },
  { value: 15000, label: "15 s" },
  { value: 30000, label: "30 s" },
  { value: 60000, label: "60 s" },
];

// AIP Configuration
const AIP_CONFIG = {
  model: import.meta.env.VITE_PALANTIR_AIP_MODEL || "palantir-aip-v1",
  apiKey: import.meta.env.VITE_PALANTIR_AIP_KEY,
  endpoint: import.meta.env.VITE_PALANTIR_AIP_ENDPOINT,
};

// AIP client for analyzing API requests
const analyzeRequest = async (request: {
  method: string;
  path: string;
  status: number;
  req_body?: string;
  req_headers?: Record<string, string>;
  res_body?: string;
  res_headers?: Record<string, string>;
}) => {
  try {
    const response = await fetch(AIP_CONFIG.endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${AIP_CONFIG.apiKey}`,
      },
      body: JSON.stringify({
        model: AIP_CONFIG.model,
        messages: [
          {
            role: "system",
            content: "You are an API debugging assistant. Analyze the request and response to identify issues and suggest improvements."
          },
          {
            role: "user",
            content: JSON.stringify({
              method: request.method,
              path: request.path,
              status: request.status,
              request: {
                body: request.req_body,
                headers: request.req_headers
              },
              response: {
                body: request.res_body,
                headers: request.res_headers
              }
            }, null, 2)
          }
        ]
      })
    });

    if (!response.ok) {
      throw new Error(`AIP request failed: ${response.status}`);
    }

    const result = await response.json();
    
    // Parse the AIP response to extract root cause, suggestion, and confidence
    const analysis = {
      root_cause: result.choices[0]?.message?.content?.root_cause || "Unable to determine root cause",
      suggestion: result.choices[0]?.message?.content?.suggestion || "No suggestion available",
      confidence: result.choices[0]?.message?.content?.confidence || 0.5
    };

    return analysis;
  } catch (error) {
    console.error('AIP Analysis failed:', error);
    return {
      root_cause: "Analysis failed: " + (error as Error).message,
      suggestion: "Please try again or contact support if the issue persists",
      confidence: 0
    };
  }
};

export default function App() {
  const [data, setData] = useState<Insight[]>([]);
  const [pollTime, setPollTime] = useState(15000); // 15 seconds default
  const [since, setSince] = useState("3600");
  const [loading, setLoading] = useState(false);
  const [expanded, setExpanded] = useState<number | null>(null);
  const [showAiAnalysis, setShowAiAnalysis] = useState<Record<number, boolean>>({});
  const [analyzing, setAnalyzing] = useState<Record<number, boolean>>({});
  const [error, setError] = useState<string | null>(null);

  const apiBase = import.meta.env.VITE_API_BASE || "http://localhost:5001";

  /* ─ data fetch ─ */
  const fetchData = async () => {
    setLoading(true);
    setError(null);
    try {
      const r = await fetch(`${apiBase}/insights?since=${since}`);
      if (!r.ok) throw new Error(`${r.status}`);
      setData(await r.json());
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
    const id = setInterval(fetchData, pollTime);
    return () => clearInterval(id);
  }, [pollTime, since]);

  /* ─ columns ─ */
  const columns = useMemo<ColumnDef<Insight>[]>(
    () => [
      { header: "#", accessorKey: "id" },
      {
        header: "Method",
        accessorKey: "method",
        cell: ({ getValue }) => {
          const method = getValue<string>();
          const colors = {
            GET: "text-fuchsia-400",
            POST: "text-indigo-400",
            PUT: "text-purple-400",
            DELETE: "text-rose-400",
          };
          return (
            <span className={`font-medium uppercase tracking-wide ${colors[method as keyof typeof colors] || "text-white"}`}>
              {method}
            </span>
          );
        },
      },
      {
        header: "Path",
        accessorKey: "path",
        cell: ({ getValue }) => (
          <span className="truncate max-w-[260px] inline-block text-gray-300" title={getValue<string>()}>
            {getValue<string>()}
          </span>
        ),
      },
      {
        header: "Status",
        accessorKey: "status",
        cell: ({ getValue }) => {
          const code = getValue<number>();
          const colors = {
            success: "bg-fuchsia-500/20 text-fuchsia-400 border-fuchsia-500/50",
            warning: "bg-yellow-500/20 text-yellow-400 border-yellow-500/50",
            error: "bg-rose-500/20 text-rose-400 border-rose-500/50",
          };
          const style = code === 404 ? colors.warning : code >= 500 ? colors.error : colors.success;
          return (
            <span className={`px-2 py-0.5 rounded text-xs border ${style}`}>
              {code}
            </span>
          );
        },
      },
    ],
    []
  );

  const table = useReactTable({ data, columns, getCoreRowModel: getCoreRowModel() });

  const handleAnalysisClick = async (id: number) => {
    if (!showAiAnalysis[id]) {
      setAnalyzing(prev => ({ ...prev, [id]: true }));
      setShowAiAnalysis(prev => ({ ...prev, [id]: false }));
      
      try {
        const request = data.find(item => item.id === id);
        if (!request) throw new Error("Request not found");

        const analysis = await analyzeRequest(request);
        
        // Update the request data with AI analysis
        setData(prev => prev.map(item => 
          item.id === id 
            ? { 
                ...item, 
                root_cause: analysis.root_cause,
                suggestion: analysis.suggestion,
                confidence: analysis.confidence
              }
            : item
        ));

        setShowAiAnalysis(prev => ({ ...prev, [id]: true }));
      } catch (error) {
        console.error('Analysis failed:', error);
        setError(`Analysis failed: ${(error as Error).message}`);
      } finally {
        setAnalyzing(prev => ({ ...prev, [id]: false }));
      }
    } else {
      setShowAiAnalysis(prev => ({ ...prev, [id]: false }));
    }
  };

  /* ─ UI ─ */
  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-950 to-black text-gray-100 px-4 md:px-8 py-10 font-sans">
      <div className="max-w-6xl mx-auto w-full">
        <div className="flex items-center justify-between gap-4 mb-10">
          <h1 className="text-4xl md:text-5xl font-extrabold bg-clip-text text-transparent bg-gradient-to-r from-indigo-500 to-fuchsia-500">
            Reverse-Proxy Debugger
          </h1>
          <div className="hidden md:flex items-center gap-6 text-xs">
            <Meta label="PROXY URL">localhost:8080</Meta>
            <Meta label="API BASE">api.open-meteo.com</Meta>
            <Meta label="WORKER POLL" 
                  options={pollTimeOptions}
                  value={pollTime}
                  onChange={(value) => setPollTime(Number(value))}>
              {pollTimeOptions.find(opt => opt.value === pollTime)?.label}
            </Meta>
            <Meta label="AIP MODEL">GPT-4o turbo</Meta>
          </div>
        </div>

        {/* mobile meta */}
        <div className="md:hidden flex flex-wrap gap-4 text-xs mb-8">
          <Meta label="PROXY URL">localhost:8080</Meta>
          <Meta label="API BASE">api.open-meteo.com</Meta>
          <Meta label="WORKER POLL"
                options={pollTimeOptions}
                value={pollTime}
                onChange={(value) => setPollTime(Number(value))}>
            {pollTimeOptions.find(opt => opt.value === pollTime)?.label}
          </Meta>
          <Meta label="AIP MODEL">GPT-4o turbo</Meta>
        </div>

        {/* filters */}
        <div className="flex items-center gap-4 mb-6">
          <div className="flex items-center gap-3">
            <label className="text-xs text-gray-400">History</label>
            <div className="relative">
              <select
                value={since}
                onChange={(e) => setSince(e.target.value)}
                className="appearance-none bg-gray-900/50 backdrop-blur border border-gray-800 rounded-lg pl-4 pr-10 py-2 text-xs outline-none focus:border-fuchsia-500/50 transition-colors"
              >
                <option value="3600">Last hour</option>
                <option value="86400">Last 24 hours</option>
                <option value="604800">Last 7 days</option>
              </select>
              <ChevronDown className="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
            </div>
          </div>
          <button
            onClick={fetchData}
            disabled={loading}
            className="ml-auto inline-flex items-center gap-2 bg-indigo-500/10 hover:bg-indigo-500/20 border border-indigo-500/20 hover:border-indigo-500/30 text-indigo-400 px-4 py-2 rounded-lg text-sm font-medium transition-colors disabled:opacity-50"
          >
            <RefreshCw className={`w-4 h-4 ${loading ? "animate-spin" : ""}`} />
            Refresh
          </button>
        </div>

        {/* error */}
        {error && (
          <div className="bg-rose-500/10 border border-rose-500/20 p-4 rounded-lg mb-6 text-sm text-rose-400">
            Error: {error}
          </div>
        )}

        {/* table */}
        <div className="border border-gray-800/50 rounded-xl overflow-hidden shadow-2xl backdrop-blur-sm bg-gray-950/50">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-900/50 text-[0.7rem] uppercase tracking-wider text-gray-400">
              {table.getHeaderGroups().map((hg) => (
                <tr key={hg.id}>
                  <th className="w-10"></th>
                  {hg.headers.map((h) => (
                    <th key={h.id} className="px-4 py-3 text-left font-semibold">
                      {flexRender(h.column.columnDef.header, h.getContext())}
                    </th>
                  ))}
                  <th className="px-4 py-3 text-left font-semibold">Timestamp</th>
                </tr>
              ))}
            </thead>
            <tbody className="divide-y divide-gray-800/50">
              {loading && data.length === 0 ? (
                <tr>
                  <td colSpan={columns.length + 2} className="p-12 text-center text-gray-500">
                    <RefreshCw className="w-5 h-5 animate-spin mx-auto mb-3" />
                    Loading data...
                  </td>
                </tr>
              ) : data.length === 0 ? (
                <tr>
                  <td colSpan={columns.length + 2} className="p-12 text-center text-gray-500">
                    No requests in this time range
                  </td>
                </tr>
              ) : (
                table.getRowModel().rows.map((row) => {
                  const open = expanded === row.original.id;
                  const showAi = showAiAnalysis[row.original.id] || false;
                  return (
                    <Fragment key={row.id}>
                      <tr className={`group hover:bg-indigo-950/20 transition-colors ${open ? "bg-indigo-950/10" : ""}`}>
                        <td 
                          className="px-4 py-3 cursor-pointer" 
                          onClick={() => setExpanded(open ? null : row.original.id)}
                        >
                          {open ? (
                            <ChevronDown className="w-4 h-4 text-gray-400" />
                          ) : (
                            <ChevronRight className="w-4 h-4 text-gray-400 group-hover:translate-x-1 transition-transform" />
                          )}
                        </td>
                        {row.getVisibleCells().map((cell) => (
                          <td key={cell.id} className="px-4 py-3">
                            {flexRender(cell.column.columnDef.cell, cell.getContext())}
                          </td>
                        ))}
                        <td className="px-4 py-3 text-gray-400 whitespace-nowrap">
                          {fmtDate(row.original.ts)}
                        </td>
                      </tr>
                      {open && (
                        <tr className="bg-indigo-950/10">
                          <td colSpan={columns.length + 2} className="px-8 py-6">
                            <div className="grid md:grid-cols-2 gap-8 text-xs">
                              <LogSection title="Request Body" content={row.original.req_body || "—"} />
                              <LogSection title="Request Headers" content={headersToString(row.original.req_headers)} />
                              <LogSection title="Response Body" content={row.original.res_body || "—"} />
                              <LogSection title="Response Headers" content={headersToString(row.original.res_headers)} />
                              <div className="md:col-span-2">
                                <button
                                  onClick={() => handleAnalysisClick(row.original.id)}
                                  className="flex items-center gap-2 text-xs font-medium text-fuchsia-400 hover:text-fuchsia-300 transition-colors"
                                >
                                  <Brain className={`w-4 h-4 ${analyzing[row.original.id] ? 'animate-pulse' : ''}`} />
                                  {analyzing[row.original.id] 
                                    ? "Analyzing request..." 
                                    : showAiAnalysis[row.original.id] 
                                      ? "Hide AI Analysis" 
                                      : "Show AI Analysis"
                                  }
                                </button>
                                {analyzing[row.original.id] && (
                                  <div className="mt-4 space-y-3">
                                    <div className="h-6 bg-indigo-500/5 rounded animate-pulse" />
                                    <div className="h-6 bg-indigo-500/5 rounded animate-pulse" />
                                    <div className="flex items-center gap-2">
                                      <div className="h-4 w-16 bg-indigo-500/5 rounded animate-pulse" />
                                      <div className="flex-1 h-1 bg-gray-800 rounded-full overflow-hidden">
                                        <div 
                                          className="h-full bg-gradient-to-r from-indigo-500/20 to-fuchsia-500/20 animate-pulse" 
                                          style={{ width: "100%" }}
                                        />
                                      </div>
                                    </div>
                                  </div>
                                )}
                                {showAiAnalysis[row.original.id] && (
                                  <div className="flex flex-col gap-3 mt-4 bg-indigo-500/5 border border-indigo-500/10 p-4 rounded-lg animate-in fade-in slide-in-from-top-4 duration-500">
                                    <p>
                                      <span className="font-medium text-fuchsia-400">Root cause:</span>{" "}
                                      <span className="text-gray-300">{row.original.root_cause}</span>
                                    </p>
                                    <p>
                                      <span className="font-medium text-fuchsia-400">Suggestion:</span>{" "}
                                      <span className="text-gray-300">{row.original.suggestion}</span>
                                    </p>
                                    <div className="flex items-center gap-2 mt-1">
                                      <div className="text-[0.65rem] text-gray-500">Confidence</div>
                                      <div className="flex-1 h-1 bg-gray-800 rounded-full overflow-hidden">
                                        <div 
                                          className="h-full bg-gradient-to-r from-indigo-500/50 to-fuchsia-500/50 transition-all duration-1000" 
                                          style={{ width: `${row.original.confidence * 100}%` }}
                                        />
                                      </div>
                                      <div className="text-[0.65rem] text-gray-500">
                                        {(row.original.confidence * 100).toFixed(0)}%
                                      </div>
                                    </div>
                                  </div>
                                )}
                              </div>
                            </div>
                          </td>
                        </tr>
                      )}
                    </Fragment>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
