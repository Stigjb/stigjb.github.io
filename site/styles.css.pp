#lang pollen

◊(require "colors.rkt")

:root {
  --small-font-size: 87.5%;
  --line-width: 32rem;
  --margin-width: 14rem;
  --content-width: calc(var(--line-width) + var(--margin-width));
  --yellow: ◊|yellow|;
  --white: ◊|white|;
  --red: ◊|red|;
  --pink: ◊|pink|;
  --blue: ◊|blue|;
  --green: ◊|green|;
  --gray-200: #e9ecef;
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

main {
  padding: 0 0.5rem;
}

article {
  max-width: var(--content-width);
  font-size: 1rem;
  line-height: 1.5;
  padding-right: var(--margin-width);
  margin: auto;
  counter-reset: sidenote-counter 0;
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
  padding: 1rem 0.5rem;
  border-bottom: solid 5px var(--green);
  margin-bottom: 2rem;
  background: linear-gradient(to right, var(--green), var(--white) 60%);
}

.header-inner {
  background: var(--white);
  max-width: var(--content-width);
  margin: auto;
  padding: 0.5rem;
  border-radius: 0.25rem;
}

.header-inner p:last-child { margin-bottom: 0; }

.footer {
  width: 100%;
  padding: 1rem 0.5rem;
  border-top: solid 5px var(--green);
  margin-top: 2rem;
}

.footer-inner {
  background: var(--white);
  max-width: var(--content-width);
  margin: auto;
  padding: 0.5rem;
  border-radius: 0.25rem;
  display: flex;
  justify-content: space-between;
  align-items: start;
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

@media all and (max-width: 720px) {
  article {
    padding: 0;
  }

  .sidenote { display: none; }

  .margin-toggle:checked ~ .sidenote {
    color: #111;
    font-size: 0.8rem;
    display: block;
    float: left;
    left: 0rem;
    clear: both;
    width: 85%;
    margin: 1rem 7.5%;
    vertical-align: baseline;
    position: relative;
  }

  label { cursor: pointer; }
}

.canvas-wrapper {
  padding: 1rem;
  border-radius: 0.5rem;
  background: var(--gray-200);
  max-width: 400px;
  margin: auto;
}

.canvas-wrapper > *:last-child {
  margin-bottom: 0;
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

.sidenote,
.marginnote {
  float: right;
  clear: right;
  margin-right: calc(-1 * var(--margin-width));
  width: calc(var(--margin-width) - 2rem);
  margin-top: 0.3rem;
  margin-bottom: 0;
  font-size: var(--small-font-size);
  line-height: calc(1rem * 1.5);
  vertical-align: baseline;
  position: relative;
}

.sidenote-number {
  counter-increment: sidenote-counter;
}

.sidenote-number:after,
.sidenote:before {
  position: relative;
  vertical-align: baseline;
  font-size: 0.8em;
  top: -0.4rem;
  left: 0rem;
}

.sidenote-number:after {
  content: counter(sidenote-counter);
}

.sidenote:before {
  content: counter(sidenote-counter) " ";
}

@supports (font-variant-position: super) {
  .sidenote-number:after {
    font-size: inherit;
    margin-left: -0.1em;
    font-variant-position: super;
    position: static;
  }

  .sidenote:before {
    font-variant-position: super;
    position: static;
    font-size: inherit;
  }
}

input.margin-toggle {
  display: none;
}

label.sidenote-number {
  display: inline;
}

label.margin-toggle:not(.sidenote-number) {
  display: none;
}

abbr {
  font-size: var(--small-font-size);
  letter-spacing: 0.05em;
  font-style: normal;
}

.sidenote-number {
  counter-increment: sidenote-counter;
}
