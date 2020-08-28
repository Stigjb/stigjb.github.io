+++
title = "Er punktet inni mangekanten?"
author = "Stig Johan Berggren"
date = 2020-08-28
draft = false
+++

## Hvem artikkelen er for

Denne artikkelen er skrevet ◊for deg som liker geometri og
programmeringsspråket Rust.

## Hva er oppgaven vår

Se for deg at du jobber i et selskap som leier ut elmopeder. Du vil ikke at
kundene skal kjøre utenfor byen, så du har markert utleieområdet i et kart.
Mopedene har GPS-mottaker, og du trenger å sjekke at posisjonen til hver
moped er innenfor utleieområdet.

## Konvekse mangekanter

Denne oppgaven blir lettere hvis vi begrenser oss til konvekse polygoner i
første omgang. Alle mangekanter, konvekse eller ei, kan deles i flere mindre
mangekanter som er konvekse.

Et polygon, eller en mangekant, har ingen hjørner som går innover. En mer
formell definisjon er at hvis du velger to vikårlige punkter på innsiden av
mangekanten, vil alle punktene på den rette linjen mellom punktene også være
på innsiden av mangekanten. Figuren til høyre viser at dette ikke er tilfelle
i en mangekant som ikke er konveks.

{{< figure
  src="konveks.svg"
  caption="Konveks og ikke-konveks mangekant"
>}}

## Typer

La oss lage en type for todimensjonale punkter.

```rust
pub struct Point(f64, f64);

impl Point {
    fn new(x: f64, y: f64) -> Self {
        Self(x, y)
    }
}
```

[Her er filen](point.rs)
