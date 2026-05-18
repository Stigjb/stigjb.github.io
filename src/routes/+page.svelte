<script lang="ts">
  import { resolve } from '$app/paths';
  import type { RouteId } from '$app/types';

  let { data } = $props() as { data: { posts: { slug: RouteId; title: string }[] } };
</script>

<svelte:head>
  <title>Stig Johan</title>
</svelte:head>

<div class="layout">
  <div>
    <h2>Velkommen!</h2>

    <p>Du har funnet nettsiden min.</p>

    <h3>Fakta om meg</h3>

    <ul>
      <li>Jeg er et menneske.</li>
      <li>Jeg bor i Oslo.</li>
      <li>Jeg jobber i <a href="https://wrepit.net">Wrepit.</a></li>
      <li>Jeg er interessert i musikk, språk og teknologi.</li>
      <li>Jeg har studert musikkvitenskap og informatikk.</li>
    </ul>
  </div>
  <section id="recent-posts">
    <h3>Siste innlegg</h3>

    <ul>
      {#each data.posts as post}
        <li>
          <a href={resolve(post.slug)}>{post.title}</a>
        </li>
      {/each}
    </ul>
  </section>

  <div>
    <h3>Mine profiler på Internett</h3>

    <p>
      I bunnteksten er det linker til mine profiler på enkelte av de mest populære sosiale
      nettstedene. Du kan finne en mer utfyllende oversikt på
      <a href={resolve('/identiteter-internett')}>denne siden.</a>
    </p>

    <p>
      Besøk gjerne geografibloggen min på <a href="https://ekvinor.no">ekvinor.no</a>!
    </p>
  </div>
</div>

<style lang="css">
  .layout {
    display: flex;
    flex-flow: column nowrap;
    gap: 1rem;
    div h2,
    div h3 {
      margin-top: 0;
    }
  }
  #recent-posts {
    h3 {
      margin-top: 0;
    }
    /*margin: 1rem -2rem;*/
    padding: 1rem;
    background: var(--color-secondary-2-1);
    color: var(--color-secondary-2-3);
    --text-contrast: var(--color-primary-3);
    --bg-contrast: var(--color-secondary-2-2);
  }
  ul {
    padding-left: 1rem;
    list-style-type: '➟ ';
    list-style-position: inside;
    li::marker {
      padding-right: 1rem;
    }
  }
</style>
