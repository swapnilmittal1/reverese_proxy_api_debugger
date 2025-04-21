import {
    useReactTable,
    getCoreRowModel,
    flexRender,
    ColumnDef,
  } from "@tanstack/react-table";
  import { Insight } from "../types";
  
  export interface Props {
    data: Insight[];
    onSelect: (row: Insight) => void;
  }
  
  export default function InsightTable({ data, onSelect }: Props) {
    const columns: ColumnDef<Insight>[] = [
      { header: "Time", accessorKey: "ts" },
      { header: "Method", accessorKey: "method" },
      { header: "Path", accessorKey: "path" },
      { header: "Status", accessorKey: "status" },
      {
        header: "AI",
        cell: ({ row }) =>
          row.original.confidence >= 0.5 && (
            <span className="text-xs bg-emerald-100 text-emerald-800 px-2 py-0.5 rounded">
              ✔
            </span>
          ),
      },
    ];
  
    const table = useReactTable({
      data,
      columns,
      getCoreRowModel: getCoreRowModel(),
    });
  
    return (
      <table className="w-full text-sm border
                        [&_td]:border-gray-200 [&_th]:border-gray-300
                        [&_td]:px-2 [&_td]:py-1">
        <thead className="bg-gray-50">
          {table.getHeaderGroups().map(hg => (
            <tr key={hg.id}>
              {hg.headers.map(h => (
                <th key={h.id} className="text-left font-medium">
                  {flexRender(h.column.columnDef.header, h.getContext())}
                </th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody>
          {table.getRowModel().rows.map(r => (
            <tr key={r.id}
                className="hover:bg-indigo-50 cursor-pointer"
                onClick={() => onSelect(r.original)}>
              {r.getVisibleCells().map(c => (
                <td key={c.id}>{flexRender(c.column.columnDef.cell, c.getContext())}</td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    );
  }
  