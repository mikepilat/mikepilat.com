import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://mikepilat.com',
  output: 'static',
  vite: {
    build: {
      // Keep imported assets as fingerprinted files for immutable caching.
      assetsInlineLimit: 0,
    },
  },
});
