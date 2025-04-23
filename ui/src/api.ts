const BASE = import.meta.env.VITE_API_BASE || 'http://localhost:5001';

export async function getInsights(hours = 1) {
  const res = await fetch(`${BASE}/insights?hours=${hours}`);
  if (!res.ok) throw new Error(`API ${res.status}`);
  return res.json();
}
