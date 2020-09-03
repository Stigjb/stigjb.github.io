#lang racket

(require pollen/decode txexpr)
(provide root)

(define (decode-linebreaks* elements)
  (decode-linebreaks elements " "))

(define (decode-paragraphs* elements)
  (decode-paragraphs elements #:linebreak-proc decode-linebreaks*))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs*)))
