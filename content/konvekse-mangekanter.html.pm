#lang pollen

◊h1{Konvekse mangekanter}

◊alert["warning"]{Siden er under skriving}

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

◊figure["konveks-og-ikke-konveks.svg"]{Konveks og ikke-konveks mangekant}

◊h2{Typer}

La oss lage en type for todimensjonale punkter.

◊code-block["rust"]{
  pub struct Point(f64, f64);
  
  impl Point {
    fn new(x: f64, y: f64) -> Self {
      Self(x, y)
    }
  }
}

For hver kant langs omkretsen av mangekanten kan vi tenke oss at vi strekker
kanten ut i det uendelige i begge retninger, slik at hele planet deles i to.
Vi ser da at hele mangekanten er på venstre siden av denne linjen. Dermed vet
vi også at ethvert punkt på den høyre siden av linjen må være på utsiden av
mangekanten.

◊figure["splitt-planet.svg"]{En linje gjennom en av mangekantens kanter deler
planet i to}

Gitt tre punkter A, B og C, hvordan kan vi sjekke om C er til høyre for
linjen definert av AB? Vi kan begynne med å definere to vektorer ◊${{\bf t} =
B - A} og ◊${{\bf d} = C - A}.

Så definerer vi en ny vektor som er lik ◊${\bf t} rotert 90 grader mot klokka.

◊$${
  \bf{t'} = 
  \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix} \bf{t} =
  \begin{bmatrix} -{\bf t}_y \\ {\bf t}_x \end{bmatrix}
}

Prikkproduktet ◊${{\bf d}\cdot{\bf t'}} vil være negativt hvis C er på høyre
side av ◊${\bf t}. Dette produktet kan vi regne ut som et uttrykk av d og t.

◊$${
  {\bf d}\cdot{\bf t'} = {\bf d}_x{\bf t'}_x + {\bf d}_y{\bf t'}_y =
  -{\bf d}_x{\bf t}_y + {\bf d}_y{\bf t}_x
}

En annen måte å forstå denne utregningen er å anta at T og D er
tredimensjonale vektorer med z-komponent lik 0, regne ut kryssproduktet deres
og sjekke fortegnet på den resulterende vektoren.
◊link["https://math.stackexchange.com/q/1232773"]{Jamfør dette spørsmålet på
Mathematics Stack Exchange (engelsk)}


◊link["point.rs"]{Her er filen}
