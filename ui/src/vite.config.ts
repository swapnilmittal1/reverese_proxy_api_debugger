// ui/vite.config.ts
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/insights': {
        target: 'http://localhost:5001',
        changeOrigin: true,
      },
    },
  },
});
