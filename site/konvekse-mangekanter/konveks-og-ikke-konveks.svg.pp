#lang pollen

◊(require "../colors.rkt")

<svg
  version="1.1" baseProfile="full"
  width="300" height="150"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 300 150"
>
  <rect width="300" height="150" fill="#fff" />
  <path
    stroke-width="2"
    stroke="◊|gray-900|"
    fill="◊|gray-400|"
    d="M 10 10 L 100 25 L 140 100 L 75 140 L 30 90 Z"
  />
  <path
    stroke-width="2"
    stroke="◊|gray-900|"
    fill="◊|gray-400|"
    d="M 160 10 L 250 25 L 290 100 L 225 140 L 230 90 Z"
  />

  <line
    x1="180" y1="20" x2="240" y2="120"
    stroke-width="3"
    stroke="◊|blue|"
  />
</svg>
