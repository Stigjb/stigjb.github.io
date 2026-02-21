<script lang="ts">
  let { lang, children } = $props();
</script>

<i {lang}>{@render children?.()}</i>
