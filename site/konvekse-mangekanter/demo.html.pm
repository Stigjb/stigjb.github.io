#lang pollen

◊define-meta[title]{Interaktiv demo}

◊h2{Transformer en mangekant til en konveks sådan}

Klikk i rammen for å legge til hjørner i en mangekant.

◊div[#:class "canvas-wrapper"]{
    ◊canvas[#:id "canvas" #:width "400" #:height "300"]
}
◊button[#:id "reset"]{Nullstill}
◊button[#:id "go"]{Gjør konveks}

◊script[#:src "demo.js"]
