#lang pollen

◊define-meta[title]{Interaktiv demo}

◊h2{Gjør en vilkårlig mangekant konveks}

Mangekanter kan deles opp i separate kanter som forbinder hjørnene. Hver kant
er definert av en todimensjonal vektor som angir kantens utstrekning i vannrett
og loddrett retning. Kantene kan settes sammen i hvilken rekkefølge som helst,
og vil alltid ende opp i en lukket sti som ender der den begynte.

Av alle måter kantene kan settes sammen på, er det kun én som gir en mangekant
som er ◊em{konveks}, som vil si at alle hjørnene svinger i samme retning. Denne
interaktive demonstrasjonen viser hvordan vilkårlige mangekanter kan
transformeres til sine konvekse motstykker. Den lar deg også tegne figurer med
kanter som krysser hverandre, selv om det kanskje strider mot det typiske
bildet av en mangekant. Det har imidlertid ingen betydning for egenskapene som
er diskutert her.

Klikk i det hvite området under for å legge til hjørner i en mangekant. Når du
har lagt til minst tre hjørner kan du trykke på «Gjør konveks».

◊div[#:class "canvas-wrapper"]{
  ◊canvas[#:id "canvas" #:width "400" #:height "300"]
  ◊button[#:id "reset"]{Nullstill}
  ◊button[#:id "go"]{Gjør konveks}
}

◊script[#:src "demo.js"]

Kanskje du har tegnet mangekanter som ser konvekse ut, men som likevel har
blitt stokket om på når du har trykket på knappen. Det er fordi denne
demonstrasjonen krever at alle hjørnene dreier mot venstre. Hvis du har tegnet
en figur hvor kantene dreier mot høyre, vil figuren «vrenges». Hvis tegningen
hadde vist kantenes retning, for eksempel med pilhoder i kantretningen, ville
det vært lettere å se.

Teksten over inneholder en hvit løgn om at det kun finnes én konveks måte å
sette sammen kantene på. Unntaket fra denne regelen er hvis to eller flere av
kantene peker i lik retning. Kanter som peker i samme retning må komme
umiddelbart etter hverandre, men de kan bytte plass innbyrdes. Det ikke finnes
noe reelt hjørne der de møtes (null dreining), så resultatene er ikke til å
skille fra hverandre.
