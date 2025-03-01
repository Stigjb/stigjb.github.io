<script>
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
	import '$lib/styles/style.css';
</script>

<div>
	<Header />

	<main><slot /></main>

	<Footer />
</div>

<style lang="scss">
	div {
		min-height: 100dvh;
		display: flex;
		flex-flow: column nowrap;
		main {
			padding: 0 0.5rem;
			max-width: var(--content-width);
			margin: auto;
			flex-grow: 1;
		}
	}
</style>
