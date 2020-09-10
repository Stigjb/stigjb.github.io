#lang pollen

◊(define blue "#0d6efd")
◊(define yellow "#ffc107")

html {
  font-size: 16px;
}

body {
  background: #fff;
  color: #212529;
  margin: 0;
}

main {
  max-width: 50rem;
  font-size: 1rem;
  line-height: 1.5;
  margin: 0 1rem;
  font-family: "Georgia";
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
  font-family: "Fira Code", "Consolas", monospace;
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
  color: ◊|blue|;
  border-color: ◊|blue|;
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
  font-size: 0.875rem;
  color: #6c757e;
}

.img-fluid {
  max-width: 100%;
  height: auto;
}
