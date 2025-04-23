// src/pages/Proxy.tsx
import React, {
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import { useParams } from "react-router-dom";
import {
  ColumnDef,
  flexRender,
  getCoreRowModel,
  useReactTable,
} from "@tanstack/react-table";

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import clsx from "clsx";

/* ------------------------------------------------------------------ */
/* 🗄️  Types */
/* ------------------------------------------------------------------ */

type LogRow = {
  id: number;
  ts: number;
  method: string;
  path: string;
  status: number;
};

type Analysis = {
  cause: string;
  suggestion: string;
  confidence: number;
};

/* ------------------------------------------------------------------ */
/* 🔧  Helpers */
/* ------------------------------------------------------------------ */

const formatTS = (ts: number) =>
  new Date(Number(String(ts).slice(0, 13))).toLocaleString();

/* ------------------------------------------------------------------ */
/* 💫  Component */
/* ------------------------------------------------------------------ */

export default function ProxyPage() {
  const { proxyId } = useParams<{ proxyId: string }>();

  /* ---------------- state ---------------- */
  const [rows, setRows] = useState<LogRow[]>([]);
  const [loading, setLoading] = useState(true);

  const [selected, setSelected] = useState<LogRow | null>(null);
  const [analysis, setAnalysis] = useState<Analysis | null>(null);
  const [analysing, setAnalysing] = useState(false);

  /* ---------------- WebSocket ---------------- */
  const wsRef = useRef<WebSocket | null>(null);
  const connectWS = useCallback(() => {
    if (!proxyId) return;
    const url = import.meta.env.VITE_WS_BASE
      ? `${import.meta.env.VITE_WS_BASE}/ws/${proxyId}`
      : `ws://${location.hostname}:8080/ws/${proxyId}`;

    const ws = new WebSocket(url);
    ws.onmessage = (ev) => {
      const data: LogRow = JSON.parse(ev.data);
      setRows((prev) => [data, ...prev].slice(0, 500)); // keep last 500
    };
    ws.onopen = () => console.info("[ws] connected");
    ws.onclose = () => {
      console.warn("[ws] closed, retry in 3 s");
      setTimeout(connectWS, 3000);
    };
    ws.onerror = console.error;
    wsRef.current = ws;
  }, [proxyId]);

  /* ---------------- initial fetch ---------------- */
  useEffect(() => {
    if (!proxyId) return;
    (async () => {
      try {
        const res = await fetch(
          `${import.meta.env.VITE_API_BASE}/api/v1/insights?proxy=${proxyId}`
        );
        const data = await res.json();
        setRows(data);
      } finally {
        setLoading(false);
      }
    })();
    connectWS();
    return () => wsRef.current?.close();
  }, [proxyId, connectWS]);

  /* ---------------- analyse ---------------- */
  const runAnalysis = async (row: LogRow) => {
    setAnalysing(true);
    try {
      const res = await fetch(
        `${import.meta.env.VITE_API_BASE}/api/v1/log/${row.id}/analyze`,
        { method: "POST" }
      );
      setAnalysis(await res.json());
    } catch (e) {
      console.error(e);
    } finally {
      setAnalysing(false);
    }
  };

  /* ---------------- react‑table ---------------- */
  const columns = useMemo<ColumnDef<LogRow>[]>(
    () => [
      {
        header: "Time",
        accessorFn: (r) => formatTS(r.ts),
      },
      { header: "Method", accessorKey: "method" },
      { header: "Path", accessorKey: "path" },
      {
        header: "Status",
        accessorKey: "status",
        cell: ({ getValue }) => {
          const v = getValue<number>();
          const color =
            v >= 500
              ? "text-red-400"
              : v >= 400
              ? "text-yellow-400"
              : "text-green-400";
          return <span className={clsx(color, "font-mono")}>{v}</span>;
        },
      },
      {
        id: "actions",
        header: "",
        cell: ({ row }) => (
          <Button
            size="sm"
            variant="secondary"
            onClick={() => {
              setSelected(row.original);
              runAnalysis(row.original);
            }}
          >
            Analyse
          </Button>
        ),
      },
    ],
    []
  );

  const table = useReactTable({
    data: rows,
    columns,
    getCoreRowModel: getCoreRowModel(),
  });

  /* ------------------------------------------------------------------ */
  /* 🖼️  UI */
  /* ------------------------------------------------------------------ */

  return (
    <div className="p-6 space-y-4">
      <h1 className="text-3xl font-semibold tracking-tight">
        Proxy&nbsp;
        <span className="font-mono text-sky-400">{proxyId}</span>
      </h1>

      <Card className="bg-gradient-to-br from-indigo-950/40 to-slate-900/40 backdrop-blur-sm border-slate-700">
        <CardContent className="overflow-x-auto p-0">
          {loading ? (
            <Skeleton className="w-full h-64" />
          ) : (
            <table className="min-w-full text-sm">
              <thead className="bg-slate-800/50">
                {table.getHeaderGroups().map((hg) => (
                  <tr key={hg.id}>
                    {hg.headers.map((h) => (
                      <th
                        key={h.id}
                        className="px-4 py-2 text-left font-medium tracking-wide"
                      >
                        {flexRender(h.column.columnDef.header, h.getContext())}
                      </th>
                    ))}
                  </tr>
                ))}
              </thead>
              <tbody>
                {table.getRowModel().rows.map((r) => (
                  <tr
                    key={r.id}
                    className="border-b border-slate-800/40 hover:bg-slate-800/20"
                  >
                    {r.getVisibleCells().map((c) => (
                      <td key={c.id} className="px-4 py-1">
                        {flexRender(c.column.columnDef.cell, c.getContext())}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </CardContent>
      </Card>

      {/* ───────── Analysis dialog ───────── */}
      <Dialog open={!!selected} onOpenChange={() => setSelected(null)}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle className="font-mono">
              {selected?.method} {selected?.path}
            </DialogTitle>
            <DialogDescription>
              {analysing && "Analysing…"}
              {!analysing && analysis && (
                <div className="space-y-3 pt-4">
                  <p>
                    <span className="font-semibold">Root&nbsp;cause:</span>{" "}
                    {analysis.cause}
                  </p>
                  <p>
                    <span className="font-semibold">Suggestion:</span>{" "}
                    {analysis.suggestion}
                  </p>
                  <p className="text-xs opacity-70">
                    confidence {Math.round(analysis.confidence * 100)}%
                  </p>
                </div>
              )}
            </DialogDescription>
          </DialogHeader>
        </DialogContent>
      </Dialog>
    </div>
  );
}
