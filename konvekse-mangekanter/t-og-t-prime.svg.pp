#lang pollen

◊(require "../colors.rkt")

<svg
  version="1.1" baseProfile="full"
  width="300" height="150"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 300 150"
>
  <defs>
     <marker id="arrowhead" viewBox="-5 -5 10 10"
          refX="3" refY="0" 
          markerUnits="strokeWidth"
          markerWidth="10" markerHeight="10"
          orient="auto">
          <path d="M 0 2 L 3 0 L 0 -2" fill="none" stroke="◊|gray-900|"/>
    </marker>
  </defs>

  <rect width="300" height="150" fill="#fff" />

  <line x1="0" x2="300" y1="120" y2="120" stroke="◊|gray-400|" />
  <line x1="150" x2="150" y1="0" y2="300" stroke="◊|gray-400|" />

  <line x1="150" x2="180" y1="120" y2="40" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="185" y="35" style="font-weight: 700;">t</text>

  <line x1="150" x2="70" y1="120" y2="90" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="75" y="85" style="font-weight: 700;">t′</text>

  <line x1="150" x2="210" y1="120" y2="90" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="215" y="85" style="font-weight: 700;">d</text>

</svg>
