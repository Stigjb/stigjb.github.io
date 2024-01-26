<script>
	import Article from '$lib/components/Article.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
	import '$lib/styles/style.css';
</script>

<Header />

<main><Article><slot /></Article></main>

<Footer />

<style>
	main {
		padding: 0 0.5rem;
		max-width: var(--content-width);
		margin: auto;
	}
</style>
