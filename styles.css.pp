#lang pollen

◊(define blue "#0d6efd")
◊(define yellow "#ffc107")
◊(define gray-600 "#6c757d")
◊(define gray-900 "#212529")
◊(define small-font-size ".875em")

html {
  font-size: 16px;
}

body {
  background: #fff;
  color: ◊|gray-900|;
  margin: 0;
  font-family: "IBM Plex Serif", serif;
}

main {
  max-width: 50rem;
  font-size: 1rem;
  line-height: 1.5;
  margin: 0 1rem;
}

p {
  hyphens: auto;
}

h1 {
  font-family: Verdana;
  font-weight: lighter;
}

h2 {
  font-size: 1.1rem;
  padding-top: 2rem;
}

pre, code {
  font-family: "Fira Mono", monospace;
  font-size: ◊|small-font-size|;
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
