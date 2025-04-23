import { useEffect, useMemo, useState, Fragment } from "react";
import {
  useReactTable,
  getCoreRowModel,
  flexRender,
  ColumnDef,
} from "@tanstack/react-table";
import { ChevronRight, ChevronDown } from "lucide-react";
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

/* ─ helpers ─────────────────────────────────────────────── */
const fmtDate = (s: number) =>
  new Date(s * 1000).toLocaleString(undefined, { hour12: false });

const headersToString = (h?: Record<string, string>): string =>
  h ? Object.entries(h).map(([k, v]) => `${k}: ${v}`).join("\n") : "—";
/* ───────────────────────────────────────────────────────── */

export default function App() {
  const [data, setData] = useState<Insight[]>([]);
  const [since, setSince] = useState("3600");
  const [loading, setLoading] = useState(false);
  const [expanded, setExpanded] = useState<number | null>(null);
  const [error, setError] = useState<string | null>(null);

  const apiBase = import.meta.env.VITE_API_BASE || "http://localhost:5001";

  const fetchData = async () => {
    setLoading(true);
    setError(null);
    try {
      // send plain seconds (server accepts both “3600” and “2 hours”)
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
    const id = setInterval(fetchData, 15_000);
    return () => clearInterval(id);
  }, [since]);

  /* ─ columns ────────────────────────────────────────────── */
  const columns = useMemo<ColumnDef<Insight>[]>(
    () => [
      { header: "#", accessorKey: "id" },
      {
        header: "Method",
        accessorKey: "method",
        cell: ({ getValue }) => (
          <span className="font-bold text-blue-400">{getValue<string>()}</span>
        ),
      },
      {
        header: "Path",
        accessorKey: "path",
        cell: ({ getValue }) => (
          <span
            className="truncate max-w-[240px] inline-block"
            title={getValue<string>()}
          >
            {getValue<string>()}
          </span>
        ),
      },
      {
        header: "Status",
        accessorKey: "status",
        cell: ({ getValue }) => {
          const code = getValue<number>();
          const color =
            code >= 500
              ? "bg-red-600"
              : code >= 400
              ? "bg-yellow-600"
              : "bg-green-600";
          return (
            <span
              className={`px-2 py-0.5 rounded text-xs text-white ${color}`}
            >
              {code}
            </span>
          );
        },
      },
    ],
    []
  );

  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
  });

  /* ─ render ─────────────────────────────────────────────── */
  return (
    <div className="min-h-screen bg-[#0a0a0a] text-gray-200 px-6 py-8 font-sans">
      <h1 className="text-3xl font-extrabold text-white mb-6">
        Reverse-Proxy Debugger
      </h1>

      {/* meta bar */}
      <div className="flex flex-wrap gap-x-10 gap-y-2 text-sm mb-8">
        <Meta label="Proxy URL">localhost:8080</Meta>
        <Meta label="API Base">api.open-meteo.com</Meta>
        <Meta label="Worker poll">15 s</Meta>
        <Meta label="AIP model">GPT-4o turbo</Meta>
      </div>

      {/* filters */}
      <div className="flex items-center gap-4 mb-4">
        <label className="text-xs opacity-80">History:</label>
        <select
          value={since}
          onChange={(e) => setSince(e.target.value)}
          className="bg-[#1a2338] border border-blue-500 rounded px-3 py-1 text-xs outline-none"
        >
          <option value="3600">1 h</option>
          <option value="86400">24 h</option>
          <option value="604800">7 d</option>
        </select>
        <button
          onClick={fetchData}
          className="ml-auto bg-blue-600 hover:bg-blue-500 px-4 py-1.5 rounded text-sm"
        >
          Refresh
        </button>
      </div>

      {error && (
        <div className="bg-red-800/60 border border-red-600 p-3 rounded mb-4">
          Error: {error}
        </div>
      )}

      {/* table */}
      <div className="border border-[#1f2c42] rounded-lg overflow-hidden">
        <table className="min-w-full text-sm">
          <thead className="bg-[#0f1b2e] text-xs uppercase tracking-wider text-blue-400">
            {table.getHeaderGroups().map((hg) => (
              <tr key={hg.id}>
                <th className="w-10"></th>
                {hg.headers.map((h) => (
                  <th key={h.id} className="px-3 py-2 text-left">
                    {flexRender(h.column.columnDef.header, h.getContext())}
                  </th>
                ))}
                <th className="px-3 py-2 text-left">Timestamp</th>
              </tr>
            ))}
          </thead>

          <tbody className="divide-y divide-[#1f2c42] bg-[#0b1323]">
            {loading ? (
              <tr>
                <td colSpan={columns.length + 2} className="p-6 text-center">
                  Loading…
                </td>
              </tr>
            ) : data.length === 0 ? (
              <tr>
                <td colSpan={columns.length + 2} className="p-6 text-center">
                  No rows in this time-range
                </td>
              </tr>
            ) : (
              table.getRowModel().rows.map((row) => {
                const open = expanded === row.original.id;
                return (
                  <Fragment key={row.id}>
                    {/* summary row */}
                    <tr className="group">
                      <td
                        className="px-3 py-2 cursor-pointer"
                        onClick={() =>
                          setExpanded(open ? null : row.original.id)
                        }
                      >
                        {open ? (
                          <ChevronDown className="w-4 h-4 text-blue-400" />
                        ) : (
                          <ChevronRight className="w-4 h-4 text-blue-400" />
                        )}
                      </td>
                      {row.getVisibleCells().map((cell) => (
                        <td key={cell.id} className="px-3 py-2">
                          {flexRender(
                            cell.column.columnDef.cell,
                            cell.getContext()
                          )}
                        </td>
                      ))}
                      <td className="px-3 py-2 opacity-80 whitespace-nowrap">
                        {fmtDate(row.original.ts)}
                      </td>
                    </tr>

                    {/* detail row */}
                    {open && (
                      <tr className="bg-[#101726]">
                        <td
                          colSpan={columns.length + 2}
                          className="px-6 py-4"
                        >
                          <div className="grid md:grid-cols-2 gap-6 text-xs">
                            <LogSection
                              title="Request Body"
                              content={row.original.req_body || "—"}
                            />
                            <LogSection
                              title="Request Headers"
                              content={headersToString(
                                row.original.req_headers
                              )}
                            />
                            <LogSection
                              title="Response Body"
                              content={row.original.res_body || "—"}
                            />
                            <LogSection
                              title="Response Headers"
                              content={headersToString(
                                row.original.res_headers
                              )}
                            />
                            <div className="md:col-span-2 flex flex-col gap-1 mt-2">
                              <h3 className="text-xs font-bold text-blue-400">
                                AI Insight
                              </h3>
                              <p>
                                <span className="font-semibold">
                                  Root cause:
                                </span>{" "}
                                {row.original.root_cause}
                              </p>
                              <p>
                                <span className="font-semibold">
                                  Suggestion:
                                </span>{" "}
                                {row.original.suggestion}
                              </p>
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
  );
}
