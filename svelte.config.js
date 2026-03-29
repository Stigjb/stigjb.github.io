import adapter from '@sveltejs/adapter-static';
import { sveltePreprocess } from 'svelte-preprocess';
import { mdsvex } from 'mdsvex';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

/** @type {import('@sveltejs/kit').Config} */
const config = {
  // Consult https://github.com/sveltejs/svelte-preprocess
  // for more information about preprocessors
  kit: {
    adapter: adapter({
      fallback: 'ikke-funnet.html',
    }),
    paths: {
      base: '',
      relative: false,
    },
  },
  extensions: ['.svelte', '.md'],
  preprocess: [
    sveltePreprocess(),
    mdsvex({
      extensions: ['.md'],
      layout: {
        _: join(__dirname, './src/routes/post.svelte'),
      },
    }),
  ],
};

export default config;
