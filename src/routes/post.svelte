<script lang="ts">
  let { title, date, children } = $props();
</script>

<article>
  <h1>{title}</h1>

  <p>Publisert: {date}</p>

  {@render children?.()}
</article>
