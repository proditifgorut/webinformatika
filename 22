import { resolve } from 'path';
import { defineConfig } from 'vite';

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        learning: resolve(__dirname, 'learning.html'),
        services: resolve(__dirname, 'services.html'),
      },
    },
  },
});
