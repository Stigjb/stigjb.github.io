#lang pollen

html {
  font-size: 16px;
}

body {
  background: #fafafa;
  color: #202020;
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
  color: blue;
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

◊(define blue "#0d6efd")
◊(define yellow "#ffc107")

◊(define (color-level color level)
  (let ([color-base (if (> level 0) "black" "white")]
        [level (abs level)])
    (format "mix(~a, ~a, ~a)" color-base color (* level 0.08))))

.alert-primary {
  color: ◊|blue|;
  border-color: ◊|blue|;
}

.alert-warning {
  color: #856404;
  background-color: #fff3cd;
  border-color: #ffeeba;
}
