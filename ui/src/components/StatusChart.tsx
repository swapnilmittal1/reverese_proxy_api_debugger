import { Insight } from "../types";
import {
  BarChart, Bar, XAxis, YAxis, Tooltip, Line, CartesianGrid, ResponsiveContainer,
} from "recharts";

export default function StatusChart({ data }: { data: Insight[] }) {
  const agg = Object.values(
    data.reduce<Record<number, { status: number; cnt: number }>>((m, r) => {
      m[r.status] ??= { status: r.status, cnt: 0 };
      m[r.status].cnt++;
      return m;
    }, {})
  );

  return (
    <ResponsiveContainer width="100%" height={240}>
      <BarChart data={agg}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="status" />
        <YAxis allowDecimals={false} />
        <Tooltip />
        <Bar dataKey="cnt" fill="#6366f1" />
        <Line type="monotone" dataKey="cnt" stroke="#1e3a8a" />
      </BarChart>
    </ResponsiveContainer>
  );
}
