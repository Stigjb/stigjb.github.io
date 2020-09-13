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

  <line x1="0" x2="300" y1="110" y2="110" stroke="◊|gray-400|" />
  <line x1="150" x2="150" y1="0" y2="300" stroke="◊|gray-400|" />

  <line x1="150" x2="180" y1="110" y2="30" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="185" y="25" style="font-weight: 700;">t</text>

  <line x1="150" x2="230" y1="110" y2="140" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="235" y="135" style="font-weight: 700;">t′</text>

  <line x1="150" x2="210" y1="110" y2="80" stroke="◊|gray-900|"
    marker-end="url(#arrowhead)"
   />
  <text x="215" y="75" style="font-weight: 700;">d</text>

</svg>
