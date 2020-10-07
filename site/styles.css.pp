#lang pollen

◊(require "colors.rkt")

:root {
  --small-font-size: .875em;
  --yellow: ◊|yellow|;
  --white: ◊|white|;
  --red: ◊|red|;
  --pink: ◊|pink|;
  --blue: ◊|blue|;
  --green: ◊|green|;
  --gray-400: ◊|gray-400|;
  --gray-600: ◊|gray-600|;
  --gray-900: ◊|gray-900|;
}

html {
  font-size: 16px;
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

body {
  background: var(--white);
  color: var(--gray-900);
  margin: 0;
  font-family: "IBM Plex Serif", serif;
}

article {
  max-width: 36rem;
  font-size: 1rem;
  line-height: 1.5;
  margin: 0 5rem;
}

p {
  hyphens: auto;
}

em em {
  font-style: normal;
}

h1 {
  margin-top: 0;
  margin-bottom: 0.5rem;
  font-weight: 500;
  line-height: 1.2;
  font-size: 2rem;
}

h2 {
  margin-top: 0;
  margin-bottom: 0.5rem;
  padding-top: 0.8rem;
  font-weight: 700;
  line-height: 1.2;
  font-size: 1.1rem;
}

h3 {
  margin-top: 0;
  margin-bottom: 0.5rem;
  padding-top: 0.5rem;
  font-weight: 700;
  line-height: 1.2;
  color: var(--gray-600);
  font-size: 1rem;
}

pre, code {
  font-family: "Fira Mono", monospace;
  font-size: var(--small-font-size);
}

code {
  color: var(--pink);
  word-wrap: break-word;
}

pre {
  display: block;
  margin-top: 0;
  margin-bottom: 1rem;
  overflow: auto;
}

pre code {
  font-size: inherit;
  color: inherit;
  word-break: normal;
}

a {
  color: var(--blue);
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.alert {
  position: relative;
  padding: 1rem 1rem;
  margin-bottom: 1rem;
  border: 1px solid transparent;
  border-radius: .25rem;
}

.alert-primary {
  color: #004085;
  background-color: #cce5ff;
  border-color: #b8daff;
}

.alert-warning {
  color: #856404;
  background-color: #fff3cd;
  border-color: #ffeeba;
}

.figure {
  display: inline-block;
}

.figure-img {
  margin-bottom: 0.5rem;
  line-height: 1;
}

.figure-caption {
  font-size: var(--small-font-size);
  color: var(--gray-600);
}

.img-fluid {
  max-width: 100%;
  height: auto;
}

.header {
  width: 100%;
  padding: 1rem 2rem;
  border-bottom: solid 5px var(--green);
  margin-bottom: 2rem;
  background-image: linear-gradient(to right, var(--green), var(--white) 80%);
}

.header-inner {
  background: var(--white);
  padding: 0.5rem;
  border-radius: 0.25rem;
}

.header-inner p:last-child { margin-bottom: 0; }

.footer {
  width: 100%;
  padding: 1rem 2rem;
  border-top: solid 5px var(--green);
  margin-top: 2rem;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.footer-nav, .footer-some {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

blockquote {
  font-size: var(--small-font-size);
  line-height: 1.3;
  padding-left: 1rem;
  border-left: solid 3px var(--yellow);
  margin-left: 0;
  margin-right: 0;
}

blockquote > footer {
  font-size: var(--small-font-size);
  color: var(--gray-600);
}

blockquote > footer::before {
  content: "\2014\00A0";
}

@media all and (max-width: 800px) {
  article {
    margin: 0 5%;
  }
}

.canvas-wrapper {
  padding: 1rem;
  border-radius: 0.5rem;
  background: var(--gray-400);
  max-width: 400px;
}

canvas {
  width: 100%;
}

button {
  display: inline-block;
  border: none;
  border-radius: 5px;
  padding: 0.25rem 1rem;
  margin: 0;
  text-decoration: none;
  background: var(--blue);
  color: var(--white);
  font-size: 1rem;
  cursor: pointer;
  text-align: center;
  transition: background 250ms ease-in-out, 
              transform 150ms ease;
}

button:hover,
button:focus {
  background: #0053ba;
}

button:focus {
  outline: 1px solid var(--white);
  outline-offset: -4px;
}

button:active {
  transform: scale(0.99);
}

button:disabled {
  background: var(--gray-400);
  color: var(--gray-600);
}
