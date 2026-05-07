---
title: Hva er Norges lengste stedsnavn?
date: '2026-05-03'
description: 'Hva er det lengste stedsnavnet i Norge, og er det flere av dem? Jeg fant svaret i et datasett fra Kartverket.'
---

Det er lett å svare på. Jeg bare laster ned et zip-arkiv fra Kartverket
med navn på alle de 1 059 425 stedene i Norge, trekker ut navnene og ser
hvilket av dem som er lengst. Skal vi se:

- Dragvoll og Charlottenlund helse- og velferdssenter, Charlottenlund

... det var ikke helt det jeg så for meg. Her må jeg finne på noe
lurere.

## Noe lurere

Inni all dataen fra Kartverket er det mer informasjon enn kun
stedsnavnet. Det står også blant annet om koordinater og alternative
skrivemåter, og stedene er plassert under visse kategorier. Helse- og velferdssenteret
over er kategorisert som både *institusjoner* og *helseinstitusjon*, og
dette er kategorier jeg tenker vi kan diskvalifisere fra konkurransen.

Blant øvrige kategorier jeg har valgt å luke ut, har vi også
*fritidsanlegg*, *geologiskStruktur*, *kultur* og *bolighus*.
Navnekandidatene som står igjen nå tilhører stort sett ukontroversielle
kategorier.

Før jeg kårer vinnerne vil jeg gjerne trekke fram en artig undersjanger
av norske stedsnavn: Lange substantivfraser. Der finner vi disse:

- Der bikkja beit mannen
- Grovi som kjem ut or fjellet
- Åsen der godfar skaut bjørnen
- Åkeren nedenat dei gamle løon
- Den lange haugen austmed vatnet
- Kårtekjerret på det slette fjøddet

De virker spesielt glade i sånne stedsnavn på Sørlandet. Men nå kommer kåringen!

## Norges lengste stedsnavn

Flest ord (6):

- Grovi som kjem ut or fjellet

Flest bokstaver (33):

- Larvik bøkeskog landskapsvernområde

... kanskje ikke alle vil godta dette. Kanskje heller ikke de neste på
lista, med 32 bokstaver:

- Torkelsbraaten eller Tørnbybraaten
- Hillesøya med Kalholmen og Verholmen

Men på 31 bokstaver har vi noe som selv den mest kresne navnekjenner må
akseptere:

- Heimste Storstyggesvånådalstjørn

Flest bokstaver uten mellomrom (30):

- Fjellsetervatnet(Bøysetervatnet)

Paranteser er juks, sier du? Greit. Flest bokstaver uten mellomrom
eller parantes (27):

- Sofe-Jonádjáládjojeakkejogaš
- Gaskevaeriengiedtienjaevrie
- Boaressiidasajjigávvagieddi

Og nå godtar jeg ingen protester. Hva sa du? Du kan ikke samisk? Ikke
jeg heller, men jeg kan fortsatt verdsette noen lange navn. Men greit,
greit, de lengste norske navnene uten mellomrom eller skilletegn har 24
bokstaver og er som følger:

- Øvraørnefjeddstakkslåttå
- Kallerudhaugplasstjernet
- Vestgardsseterdalstjønna
- Reingjerdskogtrollvatnet
- Islandsmåssåstakkslettet
- Sandsvarttjønndalsbekken

## Tekniske detaljer

Zip-arkivet fra Kartverket er på 310 MiB, og det inneholder en XML-fil
på 6,5 GiB ukomprimert. Dette hadde jeg ikke lyst til å pakke ut til
disken, så jeg skrev et program for å gjennomgå alt innholdet uten å
pakke ut alt på en gang. Jeg brukte programmeringsspråket
[Rust](https://rust-lang.org/), og de eksterne pakkene
[zip](https://crates.io/crates/zip) og
[quick-xml](https://crates.io/crates/quick-xml) for å håndtere zip-filer
og XML-parsing.

Noen steder har flere navn, fordi det er alternative stavemåter
(tjernet/tjennet, for eksempel) eller navn på både norsk og samisk. Jeg
har passet på å ta med alle variantene for å ikke gå glipp av den
lengste.

Hvordan måler man lengden til et navn? Den mest naive koden man kan
skrive i Rust vil fortelle deg at Ålgård er lengre enn Sandnes:
`"Ålgård".len() > "Sandnes".len()`. Det er fordi
`.len()`-funksjonen teller byter, og UTF-8-kodingen bruker to byter
for hver Å, men bare én for alle de andre bokstavene. Løsningen er å
bruke en tellemetode som forstår Unicode: `"Ålgård".chars().count()
< "Sandnes".chars().count()`.

For å telle bokstaver uten mellomrom og skilletegn, var det bare å
stikke inn et ekstra filter: `name.chars().filter(|c|
c.is_alphabetic()).count()`.

Koden som er brukt i analysen ligger på Codeberg:
<https://codeberg.org/stigjohan/stedsnavn>
