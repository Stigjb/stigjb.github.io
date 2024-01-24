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
		border-bottom: solid 5px var(--green);
		margin-bottom: 2rem;
		background: linear-gradient(to right, var(--green), var(--gray-200) 60%);
	}
	header div {
		background: var(--white);
		max-width: var(--content-width);
		margin: auto;
		padding: 0.5rem;
		border-radius: 0.25rem;
	}
	header div p:last-child {
		margin-bottom: 0;
	}
</style>
