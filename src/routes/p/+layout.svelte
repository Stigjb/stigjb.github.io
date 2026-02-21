<script lang="ts">
  import Article from '$lib/components/Article.svelte';
  import '$lib/styles/style.css';
  interface Props {
    children?: import('svelte').Snippet;
  }

  let { children }: Props = $props();
</script>

<Article>{@render children?.()}</Article>
