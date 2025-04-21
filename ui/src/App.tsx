import { useEffect, useState } from "react";
import { fetchInsights } from "./api";
import { Insight } from "./types";
import InsightModal from "./components/InsightModal";
import InsightTable from "./components/InsightTable";
import StatusChart from "./components/StatusChart";

export default function App() {
  const [data, setData]   = useState<Insight[]>([]);
  const [sel,  setSel]    = useState<Insight | null>(null);
  const [err,  setErr]    = useState<string>("");

  useEffect(() => {
    let mounted = true;
    const poll = async () => {
      try {
        const d = await fetchInsights();
        if (mounted) setData(d);
      } catch (e: any) {
        setErr(e.message);
      }
      if (mounted) setTimeout(poll, 10_000);
    };
    poll();
    return () => { mounted = false; };
  }, []);

  return (
    <div className="max-w-5xl mx-auto p-6 space-y-6">
      <h1 className="text-2xl font-semibold">Reverse‑Proxy Debugger</h1>

      {err && <div className="text-red-600">{err}</div>}

      <InsightTable data={data} onSelect={setSel} />

      <h2 className="text-lg font-medium mt-8">Volume by Status</h2>
      <StatusChart data={data} />

      <InsightModal insight={sel} onClose={() => setSel(null)} />
    </div>
  );
}
