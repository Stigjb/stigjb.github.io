#lang pollen

◊h1{Konvekse mangekanter}

◊alert["warning"]{Siden er under skriving}

◊alert["primary"]{
  Denne artikkelen beskriver en framgangsmåte jeg har kommet fram til selv,
  og er sannsynligvis ikke optimal.
}

◊h2{Hvem artikkelen er for}

Denne artikkelen er skrevet for deg som liker geometri og
programmeringsspråket Rust.

◊h2{Hva er oppgaven vår}

Se for deg at du jobber i et selskap som leier ut elmopeder. Du vil ikke at
kundene skal kjøre utenfor byen, så du har markert utleieområdet i et kart.
Mopedene har GPS-mottaker, og du trenger å sjekke at posisjonen til hver
moped er innenfor utleieområdet.

Det er viktig at programmet kjører lynraskt, men du kvier deg for å skrive
C eller C++ fordi du er lei av å få segmenteringsfeil eller minnelekkasjer.
Du har derfor valgt å skrive koden i ◊link["https://rust-lang.org"]{Rust}.

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

For hver kant langs omkretsen av mangekanten kan vi tenke oss at vi strekker
kanten ut i det uendelige i begge retninger, slik at hele planet deles i to.
Her er det nyttig å gi linjen en retning. Vi velger å gi kantene retning som
svarer til å gå rundt omkretsen av mangekanten mot klokka. Vi ser da at
hele mangekanten er på venstre siden av denne linjen. Dermed vet vi også at
ethvert punkt på den høyre siden av linjen må være på utsiden av mangekanten.

◊figure["splitt-planet.svg"]{
  En linje gjennom en av mangekantens kanter deler planet i to
}

Gitt tre punkter ◊${A, B, C}, hvordan kan vi sjekke om C er til høyre for
linjen definert av AB? Vi kan forenkle bildet ved å fokusere på vektorene
mellom punktene, og glemme hvor på planet de er.

◊${\mathbf{t} = B - A} og ◊${\mathbf{d} = C - A}.

At vektor ◊${\mathbf{d}} er til høyre for ◊${\mathbf{t}} er det samme som
at vinkelen ◊${\theta_{\mathbf{dt}}} er mellom 180 og 360 grader.

Hva slags operasjoner kan vi gjøre med to vektorer? Vi kan ta prikkproduktet
deres, men det gir oss ikke helt det vi trenger. En av faktorene i
prikkproduktet er cosinus av vinkelen mellom vektorene, men cosinus ser
forskjell på foran og bak, ikke høyre og venstre. Vi definerer derfor en ny
vektor som er lik ◊${\mathbf{t}} rotert 90 grader mot klokka.

◊$${
  \bf{t'} = 
  \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix} \bf{t} =
  \begin{bmatrix} -\mathbf{t}_2 \\ \mathbf{t}_1 \end{bmatrix}
}

Prikkproduktet ◊${\mathbf{d}\cdot\mathbf{t'}} vil være negativt hvis C er på
høyre side av ◊${\mathbf{t}}. Prikkproduktet mellom to vektorer har samme
fortegn som cosinus av vinkelen mellom dem, og det er akkurat det vi ønsker.
Dette prikkproduktet kan vi regne ut som et uttrykk av d og t.

◊$${
  \mathbf{d}\cdot\mathbf{t'} =
  \left\Vert\mathbf{d}\right\Vert \left\Vert\mathbf{t'}\right\Vert \cos{\theta_{\mathbf{dt'}}} =
  \mathbf{d}_1\mathbf{t'}_1 + \mathbf{d}_2\mathbf{t'}_2 =
  -\mathbf{d}_1\mathbf{t}_2 + \mathbf{d}_2\mathbf{t}_1
}

En annen måte å forstå denne utregningen er å anta at T og D er
tredimensjonale vektorer med z-komponent lik 0, regne ut kryssproduktet deres
og sjekke fortegnet på den resulterende vektoren.
◊link["https://math.stackexchange.com/q/1232773"]{Jamfør dette spørsmålet på
Mathematics Stack Exchange (engelsk)}

◊h2{Typer}

Vi trenger to typer for punkter og vektorer, og metoder for å konvertere mellom dem.

◊code-block["rust"]{
#[derive(Copy, Clone)]
pub struct Point(f64, f64);

impl Point {
    fn new(x: f64, y: f64) -> Self {
        Self(x, y)
    }
}

impl std::ops::Sub<Point> for Point {
    type Output = Vector;

    fn sub(self, other: Point) -> Self::Output {
        Vector::new(self.0 - other.0, self.1 - other.1)
    }
}

#[derive(Copy, Clone)]
pub struct Vector(f64, f64);

impl Vector {
    fn new(x: f64, y: f64) -> Self {
        Self(x, y)
    }

    fn dot(&self, other: &Self) -> f64 {
        self.0 * other.0 + self.1 * other.1
    }

    fn right_of(&self, other: &Self) -> bool {
        let t = Self(-other.1, other.0);
        self.dot(&t) < 0.
    }
}
}

Typene ◊code{Point} og ◊code{Vector} har samme struktur, men forskjellige metoder.

◊link["point.rs"]{Her er filen}
