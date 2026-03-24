<script lang="ts">
  let { title, date, children } = $props();
  const dateFormatter = Intl.DateTimeFormat('nb', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });
</script>

<article>
  <h1>{title}</h1>
  {@render children?.()}
  <p>Publisert <time datetime={date}>{dateFormatter.format(new Date(date))}</time></p>
</article>

<style lang="css">
  p {
    margin-top: 2rem;
    font-size: 0.9em;
    color: var(--color-primary-3);
  }
</style>
