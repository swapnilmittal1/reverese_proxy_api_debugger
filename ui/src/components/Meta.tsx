import { ReactNode } from "react";

interface Option {
  value: number;
  label: string;
}

interface MetaProps {
  label: string;
  children: ReactNode;
  options?: Option[];
  value?: number;
  onChange?: (value: number) => void;
}

export default function Meta({
  label,
  children,
  options,
  value,
  onChange,
}: MetaProps) {
  return (
    <div className="flex flex-col">
      <span className="text-[10px] uppercase tracking-wider text-fuchsia-400">
        {label}
      </span>
      {options ? (
        <select
          value={value}
          onChange={(e) => onChange?.(Number(e.target.value))}
          className="text-sm font-medium text-gray-300 bg-transparent border-none cursor-pointer hover:text-white focus:outline-none focus:ring-0"
        >
          {options.map((option) => (
            <option key={option.value} value={option.value} className="bg-gray-900">
              {option.label}
            </option>
          ))}
        </select>
      ) : (
        <span className="text-sm font-medium text-gray-300">{children}</span>
      )}
    </div>
  );
}
