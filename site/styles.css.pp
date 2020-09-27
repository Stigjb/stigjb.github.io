#lang pollen

◊(require "colors.rkt")

◊(define small-font-size ".875em")

html {
  font-size: 16px;
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

body {
  background: ◊|white|;
  color: ◊|gray-900|;
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

h1 {
  margin-top: 0;
  margin-bottom: 0.5rem;
  font-weight: 500;
  line-height: 1.2;
  font-size: 3rem;
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
  color: ◊|gray-600|;
  font-size: 1rem;
}

pre, code {
  font-family: "Fira Mono", monospace;
  font-size: ◊|small-font-size|;
}

code {
  color: ◊|pink|;
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
  color: ◊|blue|;
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
  font-size: ◊|small-font-size|;
  color: ◊|gray-600|;
}

.img-fluid {
  max-width: 100%;
  height: auto;
}

.header {
  width: 100%;
  padding: 1rem 2rem;
  border-bottom: solid 5px #198754;
  margin-bottom: 2rem;
  background-image: linear-gradient(to right, ◊|green|, ◊|white| 80%);
}

.header-inner {
  background: ◊|white|;
  padding: 0.5rem;
  border-radius: 0.25rem;
}

.footer {
  width: 100%;
  padding: 1rem 2rem;
  border-top: solid 5px ◊|green|;
  margin-top: 2rem;
}

.canvas-wrapper {
  padding: 1rem;
  border-radius: 0.5rem;
  background: ◊|gray-400|;
}

button {
  display: inline-block;
  border: none;
  border-radius: 5px;
  padding: 0.25rem 1rem;
  margin: 0;
  text-decoration: none;
  background: ◊|blue|;
  color: #ffffff;
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
  outline: 1px solid #fff;
  outline-offset: -4px;
}

button:active {
  transform: scale(0.99);
}

button:disabled {
  background: ◊|gray-400|;
  color: ◊|gray-600|;
}
