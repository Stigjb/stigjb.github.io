<script>
	import Article from '$lib/components/Article.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
</script>

<Header />

<main><Article><slot /></Article></main>

<Footer />

<style>
	main {
		padding: 0 0.5rem;
	}
</style>
