#lang racket

(require pollen/decode txexpr)
(provide (all-defined-out))

(define (decode-linebreaks* elements)
  (decode-linebreaks elements " "))

(define (decode-paragraphs* elements)
  (decode-paragraphs elements #:linebreak-proc decode-linebreaks*))

(define (root . elements)
  (let* ([decode-linebreaks* (λ (elements) (decode-linebreaks elements " "))]
         [decode-paragraphs* 
           (λ (elements) (decode-paragraphs elements #:linebreak-proc decode-linebreaks*))])
    (txexpr 'root empty (decode-elements elements
      #:txexpr-elements-proc decode-paragraphs*
      #:exclude-tags '(pre figure)))))

(define (figure url . tx-elements)
  `(figure ((class "figure"))
    (img ((src ,url) (class "figure-img img-fluid")))
    (figcaption ((class "figure-caption")) ,@tx-elements)))
  
(define (figure* caption . tx-elements)
  `(figure ((class "figure"))
    ,@tx-elements
    (figcaption ((class "figure-caption")) ,caption)))

(define (code-block lang . tx-elements)
  `(pre
    (code ((class ,lang)) ,@tx-elements)))

(define (link url . tx-elements)
  (txexpr 'a `((href ,url)) tx-elements))

;; fl står for foreign language
(define (fl lang-code . tx-elements)
  (txexpr 'i `((lang ,lang-code)) tx-elements))

;; inline maths
(define ($ . xs)
  `(mathjax ,(apply string-append `("\\(" ,@xs "\\)"))))

;; block maths
(define ($$ . xs)
  `(mathjax ,(apply string-append `("\\[" ,@xs "\\]"))))

(define (alert [category "primary"] . tx-elements)
  (let ([class (format "alert alert-~a" category)])
    (txexpr 'div `((class ,class)) tx-elements)))

;; sn for side note
(define (sn sn-label . tx-elements)
  `(@
    (label ((for ,sn-label) (class "margin-toggle sidenote-number")))
    (input ((type "checkbox") (id ,sn-label) (class "margin-toggle")))
    (span ((class "sidenote")) ,@tx-elements)))

(define (row . tx-elements)
  `(div ((class "row")) ,@tx-elements))
