import { Prism as Syntax } from "react-syntax-highlighter";
import { vscDarkPlus } from "react-syntax-highlighter/dist/esm/styles/prism";

export default function LogSection({
  title,
  content,
}: {
  title: string;
  content: string;
}) {
  // rudimentary "is this JSON?" check
  const looksJson = content.trim().startsWith("{") || content.trim().startsWith("[");
  
  return (
    <div className="flex flex-col gap-2">
      <h3 className="text-xs font-medium text-fuchsia-400">{title}</h3>
      <div className="relative group">
        {looksJson ? (
          <Syntax 
            language="json" 
            style={vscDarkPlus} 
            customStyle={{ 
              fontSize: "11px",
              background: "rgba(79, 70, 229, 0.05)",
              border: "1px solid rgba(79, 70, 229, 0.1)",
              borderRadius: "0.5rem",
            }}
          >
            {content}
          </Syntax>
        ) : (
          <pre className="text-[11px] whitespace-pre-wrap break-all bg-indigo-500/5 border border-indigo-500/10 p-3 rounded-lg text-gray-300">
            {content}
          </pre>
        )}
        <div className="absolute inset-0 bg-gradient-to-r from-indigo-500/[0.02] to-fuchsia-500/[0.02] opacity-0 group-hover:opacity-100 transition-opacity rounded-lg pointer-events-none" />
      </div>
    </div>
  );
}
