import type { Post } from '$lib/types';
import { json } from '@sveltejs/kit';
import type { Pathname } from '$app/types';

async function getPosts() {
  let posts: Post[] = [];

  const paths = import.meta.glob('/src/routes/p/**/*.md', { eager: true });

  for (const path in paths) {
    const file = paths[path];
    const slugmatch = path.match(/\/src\/routes(.+)\/\+page.md/);
    const slug = slugmatch?.[1] as Pathname;

    if (!slug) {
      continue;
    }

    if (file && typeof file === 'object' && 'metadata' in file && slug) {
      const metadata = file.metadata as Omit<Post, 'slug'>;
      const post = { ...metadata, slug } satisfies Post;
      posts.push(post);
    }
  }

  posts = posts.sort(
    (first, second) => new Date(second.date).getTime() - new Date(first.date).getTime(),
  );
  return posts;
}

export async function GET() {
  const posts = await getPosts();
  return json(posts);
}
