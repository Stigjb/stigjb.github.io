<script lang="ts">
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
	import '$lib/styles/style.css';
	interface Props {
		children?: import('svelte').Snippet;
	}

	let { children }: Props = $props();
</script>

<div>
	<Header />

	<main>{@render children?.()}</main>

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
