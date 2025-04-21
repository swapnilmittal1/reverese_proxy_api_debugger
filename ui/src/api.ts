import { Insight } from "./types";

const base = import.meta.env.VITE_API_BASE;

export async function fetchInsights(since = 86400): Promise<Insight[]> {
  const r = await fetch(`${base}/api/v1/insights?since=${since}`);
  if (!r.ok) throw new Error(`API ${r.status}`);
  return (await r.json()) as Insight[];
}
