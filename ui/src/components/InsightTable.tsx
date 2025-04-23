import { useEffect, useState } from 'react';
import { getInsights }       from '../../../api/insights.ts';

export default function InsightTable() {
  const [rows, setRows]   = useState([]);
  const [error, setError] = useState<string>();

  useEffect(() => {
    getInsights(6)
      .then(setRows)
      .catch(e => setError(e.message));
  }, []);

  if (error) return <p className="text-red-600">{error}</p>;

  return (
    <table className="border-collapse w-full text-sm">
      <thead>
        <tr className="bg-slate-100">
          <th className="p-2">ts</th>
          <th className="p-2">status</th>
          <th className="p-2">root cause</th>
          <th className="p-2">suggestion</th>
        </tr>
      </thead>
      <tbody>
        {rows.map(r => (
          <tr key={r.id} className="border-t">
            <td className="p-2">{new Date(+r.ts / 1000).toLocaleString()}</td>
            <td className="p-2">{r.status}</td>
            <td className="p-2">{r.root_cause}</td>
            <td className="p-2">{r.suggestion}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
