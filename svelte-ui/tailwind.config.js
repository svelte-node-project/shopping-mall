/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{js,svelte}", "./node_modules/flowbite/**/*.js"],
  plugins: [require("@tailwindcss/typography"), require("daisyui"), require('flowbite/plugin')],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Kanit', 'ui-sans-serif', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', 'Noto Sans', 'sans-serif', 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'],
      },
    },
  },
}
