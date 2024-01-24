<footer class="footer">
	<div class="footer-inner">
		<div class="footer-nav">
			<a href="/">Forside</a>
			<a href="/kolofon">Kolofon</a>
		</div>
		<div class="footer-some">
			<a href="https://github.com/stigjb">Github</a>
			<a href="https://twitter.com/stigjohan">Twitter</a>
			<a href="https://x.com/stigjohan">X</a>
			<a rel="me" href="https://snabelen.no/@stig">Mastodon</a>
		</div>
	</div>
</footer>

<style>
	.footer {
		width: 100%;
		padding: 1rem 0.5rem;
		border-top: solid 5px var(--green);
		margin-top: 2rem;
		background: linear-gradient(to right, var(--gray-200) 60%, var(--green));
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
