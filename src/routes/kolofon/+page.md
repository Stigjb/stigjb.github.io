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

Denne nettsiden er laget med [Svelte]. Kildekoden til nettsiden er åpen og
ligger på [Github]. Innholdet genereres av en Github Action ved nye commits til
hovedgreinen, og serveres fra Github Pages.
[Svelte]: <https://svelte.dev/>
[Github]: <https://github.com/Stigjb/stigjb.github.io>

Nettsiden er satt i skrifttypene [IBM Plex Serif] og [Fira Mono], begge publisert
under den åpne lisensen _[SIL Open Font License]_, versjon 1.1.
[IBM Plex Serif]: <https://github.com/IBM/plex>
[Fira Mono]: <https://github.com/mozilla/Fira>
[SIL Open Font License]: <https://scripts.sil.org/cms/scripts/page.php?id=OFL>

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
