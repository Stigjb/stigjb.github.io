<script>
  import { base } from '$app/paths';
</script>

<div class="white">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>

<div class="primary">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>
<div class="secondary-1">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>
<div class="secondary-2">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>

<div class="primary-light">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>
<div class="secondary-1-light">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>
<div class="secondary-2-light">
  <h3>Overskrift</h3>
  <p>Tekst med en <a href="{base}/">link</a></p>
</div>

<style lang="scss">
  div {
    padding: 0.5rem 1rem;
  }
  .white {
    background: white;
    color: var(--color-secondary-2-4);
    --text-contrast: var(--color-secondary-2-3);
    --bg-contrast: var(--color-secondary-2-1);
  }
  .primary {
    background: var(--color-primary-0);
    color: var(--color-primary-1);
    --text-contrast: var(--color-secondary-2-1);
    --bg-contrast: var(--color-primary-3);
  }
  .secondary-1 {
    background: var(--color-secondary-1-0);
    color: var(--color-secondary-1-1);
    --text-contrast: var(--color-primary-1);
    --bg-contrast: var(--color-secondary-1-3);
  }
  .secondary-2 {
    background: var(--color-secondary-2-0);
    color: var(--color-secondary-2-1);
    --text-contrast: var(--color-primary-1);
    --bg-contrast: var(--color-secondary-2-3);
  }
  .primary-light {
    background: var(--color-primary-1);
    color: var(--color-primary-3);
    --text-contrast: var(--color-secondary-2-3);
    --bg-contrast: var(--color-primary-2);
  }
  .secondary-1-light {
    background: var(--color-secondary-1-1);
    color: var(--color-secondary-1-3);
    --text-contrast: var(--color-primary-3);
    --bg-contrast: var(--color-secondary-1-2);
  }
  .secondary-2-light {
    background: var(--color-secondary-2-1);
    color: var(--color-secondary-2-3);
    --text-contrast: var(--color-primary-3);
    --bg-contrast: var(--color-secondary-2-2);
  }
</style>
