<script lang="ts">
	export let tag: string;
</script>

<label for={tag} class="margin-toggle sidenote-number" />
<input type="checkbox" id={tag} class="margin-toggle" />
<span class="sidenote"><slot /></span>

<style>
	span {
		float: right;
		clear: right;
		margin-right: calc(-1 * var(--margin-width));
		width: calc(var(--margin-width) - 2rem);
		margin-top: 0.3rem;
		margin-bottom: 0;
		font-size: var(--small-font-size);
		line-height: calc(1rem * 1.5);
		vertical-align: baseline;
		position: relative;
	}

	label {
		counter-increment: sidenote-counter;
	}

	label:after,
	span:before {
		position: relative;
		vertical-align: baseline;
		font-size: 0.8em;
		top: -0.4rem;
		left: 0rem;
	}

	label:after {
		content: counter(sidenote-counter);
	}

	span:before {
		content: counter(sidenote-counter) ' ';
	}

	@supports (font-variant-position: super) {
		label:after {
			font-size: inherit;
			margin-left: -0.1em;
			font-variant-position: super;
			position: static;
		}

		span:before {
			font-variant-position: super;
			position: static;
			font-size: inherit;
		}
	}

	input {
		display: none;
	}

	label.sidenote-number {
		display: inline;
	}

	label.margin-toggle:not(.sidenote-number) {
		display: none;
	}

	@media all and (max-width: 720px) {
		.sidenote {
			display: none;
		}

		.margin-toggle:checked ~ .sidenote {
			color: #111;
			font-size: 0.8rem;
			display: block;
			float: left;
			left: 0rem;
			clear: both;
			width: 85%;
			margin: 1rem 7.5%;
			vertical-align: baseline;
			position: relative;
		}

		label {
			cursor: pointer;
		}
	}
</style>
