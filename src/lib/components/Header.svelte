<script>
	import { page } from '$app/stores';
	const title = $page.data.title;
	const taglines = [
		'et konsept fra Stig',
		'vi gir oss aldri på Stig',
		'ikke alle kan kalle seg det samme som Stig'
	];
	const subtitle = taglines[Math.floor(Math.random() * taglines.length)];
</script>

<header>
	<div>
		<h1><a href="/">{title ? `${title} | ` : ''}Stig Johan</a></h1>
		<p>{subtitle}</p>
	</div>
</header>

<style lang="scss">
	header {
		width: 100%;
		padding: 1rem 0.5rem;
		margin-bottom: 2rem;
		background: var(--color-primary-0);
		color: var(--color-primary-1);
		--bg-contrast: var(--color-primary-3);
		border-bottom: solid 5px var(--color-primary-2);
		div {
			max-width: var(--content-width);
			margin: auto;
			display: flex;
			flex-flow: column nowrap;
			align-items: center;
			padding: 0.5rem;
			border-radius: 0.25rem;
			h1 {
				font-size: 3rem;
				a[href] {
					color: inherit;
					text-decoration: none;
				}
			}
			p:last-child {
				font-style: italic;
				margin-bottom: 0;
			}
		}
	}
</style>
