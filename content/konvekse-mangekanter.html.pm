#lang pollen

◊h1{Konvekse mangekanter}

◊h2{Hvem artikkelen er for}

◊p{
Denne artikkelen er skrevet for deg som liker geometri og
programmeringsspråket Rust.
}

◊h2{Hva er oppgaven vår}

◊p{
Se for deg at du jobber i et selskap som leier ut elmopeder. Du vil ikke at
kundene skal kjøre utenfor byen, så du har markert utleieområdet i et kart.
Mopedene har GPS-mottaker, og du trenger å sjekke at posisjonen til hver
moped er innenfor utleieområdet.
}

◊h2{Konvekse mangekanter}

◊p{
Denne oppgaven blir lettere hvis vi begrenser oss til konvekse polygoner i
første omgang. Alle mangekanter, konvekse eller ei, kan deles i flere mindre
mangekanter som er konvekse.
}

◊p{
Et polygon, eller en mangekant, har ingen hjørner som går innover. En mer
formell definisjon er at hvis du velger to vikårlige punkter på innsiden av
mangekanten, vil alle punktene på den rette linjen mellom punktene også være
på innsiden av mangekanten. Figuren til høyre viser at dette ikke er tilfelle
i en mangekant som ikke er konveks.
}

◊figure[#:class "figure"]{
  ◊img[#:class "figure-img img-fluid rounded" #:src "konveks.svg"]
  ◊figcaption[#:class "figure-caption"]{
    Konveks og ikke-konveks mangekant
  }
}

◊h2{Typer}

◊p{
La oss lage en type for todimensjonale punkter.
}

◊pre{◊code[#:class "rust"]{
  pub struct Point(f64, f64);
  
  impl Point {
    fn new(x: f64, y: f64) -> Self {
      Self(x, y)
    }
  }
}}

◊a[#:href "point.rs"]{Her er filen}
