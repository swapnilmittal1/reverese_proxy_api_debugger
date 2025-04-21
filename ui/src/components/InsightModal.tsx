import { Insight } from "../types";

interface Props {
  insight: Insight | null;
  onClose: () => void;
}

export default function InsightModal({ insight, onClose }: Props) {
  if (!insight) return null;
  return (
    <div className="fixed inset-0 bg-black/40 flex items-center justify-center">
      <div className="bg-white max-w-lg w-full rounded-xl p-6 space-y-4 shadow-xl">
        <h2 className="text-xl font-semibold">AI Root‑Cause Analysis</h2>

        <p><span className="font-medium">Cause:</span> {insight.root_cause}</p>

        <p><span className="font-medium">Confidence:</span>{" "}
           {(insight.confidence * 100).toFixed(0)}%</p>

        <p className="font-medium">Suggested fix (s):</p>
        <ul className="list-disc list-inside">
          {insight.suggestion
             .split(/\n|•|- /)
             .filter(Boolean)
             .map((s, i) => <li key={i}>{s}</li>)}
        </ul>

        <button onClick={onClose}
                className="mt-3 px-4 py-1.5 rounded bg-indigo-600
                           text-white hover:bg-indigo-700">
          Close
        </button>
      </div>
    </div>
  );
}
