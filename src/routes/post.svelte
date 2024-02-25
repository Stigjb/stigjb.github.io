<script>
	export let title;
	export let date;
</script>

<article>
	<h1>{title}</h1>

	<p>Publisert: {date}</p>

	<slot />
</article>
