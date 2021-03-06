#lang pollen

◊(require "../colors.rkt")

<svg
  version="1.1" baseProfile="full"
  width="200" height="200"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 200 200"
>
  <defs>
     <marker id="arrowhead" viewBox="-5 -5 10 10"
          refX="3" refY="0" 
          markerUnits="strokeWidth"
          markerWidth="10" markerHeight="10"
          orient="auto">
          <path d="M 0 2 L 3 0 L 0 -2" fill="none" stroke="◊|red|"/>
    </marker>
  </defs>
  <path
    stroke-width="2"
    stroke="◊|gray-900|"
    fill="◊|gray-400|"
    d="M 30 30 L 60 120 L 105 170 L 170 130 L 130 55 Z"
  />

  <!-- stigningstall = (170 - 120) / (105 - 60) = 50 / 45 -->
  <path stroke-width="2"
    stroke="◊|green|"
    fill="◊|gray-900|"
    d="M 195 270 L -30 20 L -5 205 Z" />
  <line
    x1="60" y1="120" x2="105" y2="170"
    stroke-width="2"
    stroke-linecap="round"
    stroke="◊|red|"
    marker-end="url(#arrowhead)"
  />
</svg>
