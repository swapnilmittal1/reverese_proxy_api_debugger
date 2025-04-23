/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./index.html", "./src/**/*.{ts,tsx}"],
    theme: {
      extend: {
        fontFamily: { mono: ["'JetBrains Mono'", "monospace"] },
        colors: { brand: "#17cf97" }                     // bright sci‑fi accent
      },
    },
    darkMode: "class",
    plugins: [],
  };
  