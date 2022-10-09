<script>
	import Article from 'src/lib/components/Article.svelte';
</script>

<header class="header">
	<div class="header-inner">
		<h1>here-title</h1>
		<p>Stig Johan Berggren</p>
		<!-- ◊p{
    Stig Johan Berggren
    ◊when/splice[here-date]{ – ◊here-date}
    ◊when/splice[here-revised]{ – ◊here-revised}}}} -->
	</div>
</header>

<main><Article><slot /></Article></main>

<footer class="footer">
	<div class="footer-inner">
		<div class="footer-nav">
			<a href="/">Forside</a>
			<a href="/kolofon.html">Kolofon</a>
		</div>
		<div class="footer-some">
			<a href="https://github.com/stigjb">Github</a>
			<a href="https://twitter.com/stigjohan">Twitter</a>
			<a href="https://snabelen.no/@stig">Mastodon</a>
		</div>
	</div>
</footer>

<style>
	.header {
		width: 100%;
		padding: 1rem 0.5rem;
		border-bottom: solid 5px var(--green);
		margin-bottom: 2rem;
		background: linear-gradient(to right, var(--green), var(--white) 60%);
	}
	.header-inner {
		background: var(--white);
		max-width: var(--content-width);
		margin: auto;
		padding: 0.5rem;
		border-radius: 0.25rem;
	}
	.header-inner p:last-child {
		margin-bottom: 0;
	}
	.footer {
		width: 100%;
		padding: 1rem 0.5rem;
		border-top: solid 5px var(--green);
		margin-top: 2rem;
	}
	.footer-inner {
		background: var(--white);
		max-width: var(--content-width);
		margin: auto;
		padding: 0.5rem;
		border-radius: 0.25rem;
		display: flex;
		justify-content: space-between;
		align-items: start;
		flex-wrap: wrap;
	}
	.footer-nav,
	.footer-some {
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin: 0 -1em -1em 0;
	}
	.footer-nav a,
	.footer-some a {
		margin: 0 1em 1em 0;
	}
</style>
