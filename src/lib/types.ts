import type { Pathname } from '$app/types';

export type Post = {
  title: string;
  slug: Pathname;
  description: string;
  date: string;
  published: boolean;
};
