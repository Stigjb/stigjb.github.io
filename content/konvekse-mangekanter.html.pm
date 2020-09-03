#lang pollen

◊h1{Konvekse mangekanter}

◊h2{Hvem artikkelen er for}

Denne artikkelen er skrevet for deg som liker geometri og
programmeringsspråket Rust.

◊h2{Hva er oppgaven vår}

Se for deg at du jobber i et selskap som leier ut elmopeder. Du vil ikke at
kundene skal kjøre utenfor byen, så du har markert utleieområdet i et kart.
Mopedene har GPS-mottaker, og du trenger å sjekke at posisjonen til hver
moped er innenfor utleieområdet.

◊h2{Konvekse mangekanter}

Denne oppgaven blir lettere hvis vi begrenser oss til konvekse polygoner i
første omgang. Alle mangekanter, konvekse eller ei, kan deles i flere mindre
mangekanter som er konvekse.

Et polygon, eller en mangekant, har ingen hjørner som går innover. En mer
formell definisjon er at hvis du velger to vikårlige punkter på innsiden av
mangekanten, vil alle punktene på den rette linjen mellom punktene også være
på innsiden av mangekanten. Figuren til høyre viser at dette ikke er tilfelle
i en mangekant som ikke er konveks.

◊figure[#:class "figure"]{
  ◊img[#:class "figure-img img-fluid rounded" #:src "konveks.svg"]
  ◊figcaption[#:class "figure-caption"]{
    Konveks og ikke-konveks mangekant
  }
}

◊h2{Typer}

La oss lage en type for todimensjonale punkter.

◊pre{◊code[#:class "rust"]{
  pub struct Point(f64, f64);
  
  impl Point {
    fn new(x: f64, y: f64) -> Self {
      Self(x, y)
    }
  }
}}

◊a[#:href "point.rs"]{Her er filen}

◊table[#:class "table table-hover"]{
  ◊thead{
    ◊tr{
      ◊th[#:scope "col"]{#}
      ◊th[#:scope "col"]{First}
      ◊th[#:scope "col"]{Last}
      ◊th[#:scope "col"]{Handle}
    }
  }
  ◊tbody{
    ◊tr{
      ◊th[#:scope "row"]{1}
      ◊td{Mark}
      ◊td{Otto}
      ◊td{@mdo}
    }
    ◊tr{
      ◊th[#:scope "row"]{2}
      ◊td{Jacob}
      ◊td{Thornton}
      ◊td{@fat}
    }
    ◊tr{
      ◊th[#:scope "row"]{3}
      ◊td[#:colspan "2"]{Larry the Bird}
      ◊td{@twitter}
    }
  }
}
