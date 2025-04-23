import { Prism as Syntax } from "react-syntax-highlighter";
import { vscDarkPlus } from "react-syntax-highlighter/dist/esm/styles/prism";

export default function LogSection({
  title,
  content,
}: {
  title: string;
  content: string;
}) {
  // rudimentary “is this JSON?” check
  const looksJson = content.trim().startsWith("{") || content.trim().startsWith("[");
  return (
    <div className="flex flex-col gap-2">
      <h3 className="text-xs font-bold text-cyan-400">{title}</h3>
      {looksJson ? (
        <Syntax language="json" style={vscDarkPlus} customStyle={{ fontSize: "11px" }}>
          {content}
        </Syntax>
      ) : (
        <pre className="text-[11px] whitespace-pre-wrap break-all bg-[#141e33] p-2 rounded">
          {content}
        </pre>
      )}
    </div>
  );
}
