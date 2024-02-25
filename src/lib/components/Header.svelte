<script>
	import { base } from '$app/paths';
	import { page } from '$app/stores';

	const title = $page.data.title;
	const taglines = [
		// 'det skal godt gjøres å spise bare Stig',
		'et konsept fra Stig',
		'et lite stykke Stig',
		'har du Stig har du lov',
		'ikke alle kan kalle seg det samme som Stig',
		'Stig gir deg vinger',
		'Stig kurerer gruff',
		'Stig til folket',
		'tiden går, Stig består',
		'vi gir oss aldri på Stig',
		// { l: 'en', t: 'just Stig it' },
		{ l: 'en', t: 'because you’re worth Stig' },
		{ l: 'en', t: 'have it Stig’s way' },
		{ l: 'en', t: 'you’re not Stig when you’re hungry' },
		{ l: 'en', t: 'the best a Stig can get' }
	];
	const subtitle = taglines[Math.floor(Math.random() * taglines.length)];
</script>

<header>
	<div>
		<h1><a href="{base}/">{title ? `${title} | ` : ''}Stig Johan</a></h1>
		{#if typeof subtitle === 'object' && 'l' in subtitle}
			<p lang={subtitle.l}>{subtitle.t}</p>
		{:else}
			<p>{subtitle}</p>
		{/if}
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
		flex-grow: 0;
		flex-shrink: 0;
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
