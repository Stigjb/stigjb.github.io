<script>
	import { page } from '$app/stores';
	const title = $page.data.title;
</script>

<header>
	<div>
		<h1>{title ? `${title} | ` : ''}Stig Johan</h1>
		<p>Stig Johan Berggren</p>
	</div>
</header>

<style>
	header {
		width: 100%;
		padding: 1rem 0.5rem;
		margin-bottom: 2rem;
		background: var(--color-secondary-1-3);
		color: var(--color-secondary-1-1);
		border-bottom: solid 5px var(--color-secondary-1-2);
	}
	header div {
		max-width: var(--content-width);
		margin: auto;
		padding: 0.5rem;
		border-radius: 0.25rem;
	}
	header div p:last-child {
		margin-bottom: 0;
	}
</style>
