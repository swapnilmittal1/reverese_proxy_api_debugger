export interface Insight {
    id: number;
    ts: string;                 // ISO
    method: string;
    path: string;
    status: number;
    root_cause: string;
    suggestion: string;
    confidence: number;
  }
  