<script>
  import { base } from '$app/paths';
</script>

<footer>
  <div class="footer-inner">
    <div class="footer-nav">
      <a href="{base}/">Forside</a>
      <a href="{base}/kolofon">Kolofon</a>
      <a href="{base}/bloggrull">Bloggrull</a>
    </div>
    <div class="footer-some">
      <a href="https://github.com/stigjb">Github</a>
      <a href="https://codeberg.org/stigjohan">Codeberg</a>
      <a href="https://bsky.app/profile/hjullaster.bsky.social">Bluesky</a>
      <a rel="me" href="https://snabelen.no/@stig">Mastodon</a>
    </div>
  </div>
</footer>

<style lang="scss">
  footer {
    width: 100%;
    padding: 1rem 0.5rem;
    margin-top: 2rem;
    background: var(--color-secondary-1-0);
    color: var(--color-secondary-1-1);
    border-top: solid 5px var(--color-secondary-1-2);
    flex-grow: 0;
    flex-shrink: 0;

    --text-contrast: var(--color-secondary-1-1);
    --bg-contrast: var(--color-secondary-1-3);
    .footer-inner {
      max-width: var(--content-width);
      margin: auto;
      padding: 0.5rem;
      border-radius: 0.25rem;
      display: flex;
      justify-content: space-between;
      align-items: start;
      flex-wrap: wrap;

      .footer-nav,
      .footer-some {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 0;
        a[href] {
          text-decoration: none;
          padding: 0.25em 1em;
          &:hover {
            text-decoration: underline;
          }
        }
      }
    }
  }
</style>
