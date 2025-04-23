export async function getInsights(hours: number) {
    const url =
      `http://localhost:5001/api/v1/insights?since=${hours * 3600}`;
    const res = await fetch(url);
    if (!res.ok) throw new Error(await res.text());
    return res.json();
  }
  