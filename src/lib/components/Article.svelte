<article><slot /></article>

<style>
	article {
		max-width: var(--content-width);
		font-size: 1rem;
		line-height: 1.5;
		padding-right: var(--margin-width);
		margin: auto;
		counter-reset: sidenote-counter 0;
	}
	@media all and (max-width: 720px) {
		article {
			padding: 0;
		}
	}
</style>
