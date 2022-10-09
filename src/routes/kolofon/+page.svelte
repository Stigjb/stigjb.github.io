<blockquote cite="https://snl.no/kolofon">
	Kolofon, liten tekst med tekniske opplysninger og opplysninger om en bok, en avis, et tidsskrift
	eller et magasins utgivelse: copyright, trykkested og -år, papir og skrift, bokbinder, opplag,
	utgave, bidragsytere, og liknende.
	<footer>
		Rannem, Øyvin: <em>kolofon</em> i
		<cite title="Store norske leksikon">Store norske leksikon</cite> på snl.no. Hentet 23. september
		2020 fra https://snl.no/kolofon
	</footer>
</blockquote>

<p>
	Denne nettsiden er laget med <a href="https://svelte.dev/">Svelte</a>.Kildekoden til nettsiden er
	åpen og ligger på <a href="https://github.com/Stigjb/stigjb.github.io">Github</a>. Innholdet
	genereres av en Github Action ved nye commits til hovedgreinen, og serveres fra Github Pages.
</p>

<p>
	Nettsiden er satt i skrifttypene<a href="https://github.com/IBM/plex">IBM Plex Serif</a> og
	<a href="https://github.com/mozilla/Fira">Fira Mono</a>, begge publisert under den åpne lisensen
	<a href="https://scripts.sil.org/cms/scripts/page.php?id=OFL"><em>SIL Open Font License</em></a>,
	versjon 1.1.
</p>

<style>
	blockquote {
		font-size: var(--small-font-size);
		line-height: 1.3;
		padding-left: 1rem;
		border-left: solid 3px var(--yellow);
		margin-left: 0;
		margin-right: 0;
	}

	blockquote > footer {
		font-size: var(--small-font-size);
		color: var(--gray-600);
	}

	blockquote > footer::before {
		content: '\2014\00A0';
	}
</style>
