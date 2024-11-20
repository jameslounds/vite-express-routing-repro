import { defineConfig } from "vite";
import { resolve } from "path";

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        index: resolve(__dirname, "index.html"),
        file: resolve(__dirname, "file.html"),
        dir: resolve(__dirname, "dir/index.html"),
      },
    },
  },
});
