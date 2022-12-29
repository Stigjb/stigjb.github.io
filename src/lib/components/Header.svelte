<script>
	import { page } from '$app/stores';
</script>

<header class="header">
	<div class="header-inner">
		<h1>{$page.data.title}</h1>
		<p>Stig Johan Berggren</p>
		<!-- ◊p{
    Stig Johan Berggren
    ◊when/splice[here-date]{ – ◊here-date}
    ◊when/splice[here-revised]{ – ◊here-revised}}}} -->
	</div>
</header>

<style>
	.header {
		width: 100%;
		padding: 1rem 0.5rem;
		border-bottom: solid 5px var(--green);
		margin-bottom: 2rem;
		background: linear-gradient(to right, var(--green), var(--white) 60%);
	}
	.header-inner {
		background: var(--white);
		max-width: var(--content-width);
		margin: auto;
		padding: 0.5rem;
		border-radius: 0.25rem;
	}
	.header-inner p:last-child {
		margin-bottom: 0;
	}
</style>
