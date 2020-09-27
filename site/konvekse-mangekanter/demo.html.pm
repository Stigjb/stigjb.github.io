#lang pollen

◊define-meta[title]{Interaktiv demo}

◊h2{Gjør en vilkårlig mangekant konveks}

Enhver mangekant kan gjøres om til en konveks mangekant ved å tegne kantene i en
bestemt rekkefølge. Dette er en interaktiv demonstrasjon av denne
transformasjonen.

Klikk i det hvite området under for å legge til hjørner i en mangekant. Når du
har lagt til minst tre hjørner kan du trykke på «Gjør konveks».

◊div[#:class "canvas-wrapper"]{
    ◊canvas[#:id "canvas" #:width "400" #:height "300"]
}
◊button[#:id "reset"]{Nullstill}
◊button[#:id "go"]{Gjør konveks}

◊script[#:src "demo.js"]
