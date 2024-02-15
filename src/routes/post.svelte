<script lang="ts">
	export let title: string;
	export let date: string;
</script>

<article>
	<h1>{title}</h1>

	<p>Publisert: {date}</p>

	<slot />
</article>
