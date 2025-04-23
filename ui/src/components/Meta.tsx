import { ReactNode } from "react";

export default function Meta({
  label,
  children,
}: {
  label: string;
  children: ReactNode;
}) {
  return (
    <div className="flex flex-col">
      <span className="text-[10px] uppercase tracking-wider text-fuchsia-400">
        {label}
      </span>
      <span className="text-sm font-medium text-gray-300">{children}</span>
    </div>
  );
}
