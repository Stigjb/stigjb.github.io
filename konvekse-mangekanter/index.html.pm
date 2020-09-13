#lang pollen

◊(define-meta title "Konvekse mangekanter")

◊(define (vec letter)
  ($ (format "\\mathbf{~a}" letter)))

◊(define (norm vec)
  (format "\\left\\Vert ~a\\right\\Vert" vec))

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

Vi går også ut fra at vi bare har _enkle_ mangekanter, hvor ingen kanter
krysser hverandre.

Et polygon, eller en mangekant, har ingen hjørner som går innover. En mer
formell definisjon er at hvis du velger to vikårlige punkter på innsiden av
mangekanten, vil alle punktene på den rette linjen mellom punktene også være på
innsiden av mangekanten. Figuren under viser at dette ikke er tilfelle i en
mangekant som ikke er konveks.

◊figure["konveks-og-ikke-konveks.svg"]{
  En konveks og en ikke-konveks mangekant.
}

Hver kant langs omkretsen av mangekanten kan strekkes ut i det uendelige i begge
retninger, slik at den blir en linje som deler planet i to. For å skille mellom
sidene av linjen trenger den en definert retning. Vi velger å gi kantene retning
som tilsvarer å gå rundt omkretsen av mangekanten mot klokka. Da er hele
mangekanten på venstre side av linjen. Da må også ethvert punkt på den høyre
siden av linjen må være på utsiden av mangekanten.

◊figure["splitt-planet.svg"]{
  En linje langs en av kantene deler planet i to. Pilen viser linjens
  retning.
}

◊h3{Trigonometri}

Gitt tre punkter ◊${A, B, C}, hvordan sjekker man om C er til høyre eller
venstre for linjen definert av AB? Det er det samme som at vinkelen ◊${\angle
{CAB}} er mellom 180 og 360 grader. Fordi vi kun er interessert i vinkelen
mellom dem, er det ikke relevant hvor på planet punktene befinner seg. Vi
definerer vektorene ◊vec{d} og ◊vec{t} slik at vinkelen ◊${\theta_{\mathbf{dt}}}
er lik ◊${\angle{CAB}}.

◊figure["punkter-og-vektorer.svg"]{
  Vektorene ◊vec{t} og ◊vec{d} er definert ut fra punktene A, B og C slik at
  ◊${\mathbf{t} = B - A} og ◊${\mathbf{d} = C - A}.
}

Vektoren ◊vec{d} er til venstre for ◊vec{t} hvis vinkelen mellom dem er i
intervallet (0°, 180°), og til høyre for den hvis vinkelen er i intervallet
(180°, 360°). Dette er også intervallene hvor sinus av en vinkel er henholds
positiv og negativ. Spørsmålet om ◊vec{d} er til høyre for ◊vec{t} er derfor det
samme som at ◊${\sin{\theta_{\mathbf{dt}}} < 0}.

◊h3{Prikkprodukt}

Definisjonen av prikkproduktet gir oss en måte å relatere koordinatene til
vektorer med deres størrelse og retning.

◊$${
  \mathbf{u}\cdot\mathbf{v}
= ◊norm{u} ◊norm{v} \cos{\theta_{\mathbf{uv}}}
= \mathbf{u}_1\mathbf{v}_1 + \mathbf{u}_2\mathbf{v}_2
}

Det ene uttrykket involverer cosinus, men vi har mer bruk for sinus. En
trigonometrisk identitet viser at sinus og kosinus er den samme funksjonen med
en faseforskyvning på 90°:

◊$${\sin{\theta} = \cos{(\theta - 90°)}}

Den eksakte verdien av sinus er ikke viktig, kun fortegnet — om verdien er
større enn eller mindre enn null. Derfor er lengden på vektorene irrelevant,
siden de kun påvirker absoluttverdien til prikkproduktet.

Hva slags operasjoner kan vi gjøre med to vektorer? Vi kan ta prikkproduktet
deres, og men det gir oss ikke helt det vi trenger. En av faktorene i
prikkproduktet er cosinus av vinkelen mellom vektorene, men cosinus ser
forskjell på foran og bak, ikke høyre og venstre. Vi definerer derfor en ny
vektor som er lik ◊vec{t} rotert 90 grader med klokka.

På grunn av den trigonometriske identiteten under, ser vi at dette produktet
hjelper oss å finne vinkelen mellom vektoren og en hypotetisk vektor som er
90° rotert i forhold til den.

◊$${
  \sin{\theta_{\mathbf{dt}}}
= \cos{\theta_{\mathbf{dt'}}}
= \cos{(\theta_{\mathbf{dt}} - 90°)}
} 

◊$${
  \bf{t'} = 
  \begin{bmatrix} 0 & 1 \\ -1 & 0 \end{bmatrix} \bf{t} =
  \begin{bmatrix} \mathbf{t}_2 \\ -\mathbf{t}_1 \end{bmatrix}
}

◊figure["t-og-t-prime.svg"]{
  Vektor ◊vec{t'} og dens relasjon til ◊vec{t} og ◊vec{d}.
}

Prikkproduktet ◊${\mathbf{d}\cdot\mathbf{t'}} vil være positivt hvis og bare
hvis C er på høyre side av ◊vec{t}. Prikkproduktet mellom to vektorer har samme
fortegn som cosinus av vinkelen mellom dem, og det er akkurat det vi ønsker.
Dette prikkproduktet kan vi regne ut som et uttrykk av komponentene av ◊vec{d}
og ◊vec{t}.

◊$${
  \mathbf{d}\cdot\mathbf{t'} =
  ◊norm{\mathbf{d}} ◊norm{\mathbf{t'}} \cos{\theta_{\mathbf{dt'}}} =
  \mathbf{d}_1\mathbf{t'}_1 + \mathbf{d}_2\mathbf{t'}_2 =
  \mathbf{d}_1\mathbf{t}_2 - \mathbf{d}_2\mathbf{t}_1
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
