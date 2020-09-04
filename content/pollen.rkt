#lang racket

(require pollen/decode txexpr)
(provide root figure)

(define (decode-linebreaks* elements)
  (decode-linebreaks elements " "))

(define (decode-paragraphs* elements)
  (decode-paragraphs elements #:linebreak-proc decode-linebreaks*))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs*
    #:exclude-tags '(pre figure))))

(define (figure url . tx-elements)
  (let ([img-tx
	  (txexpr 'img `((src ,url) (class "figure-img img-fluid")) empty)]
	[cap-tx
	  (txexpr 'figcaption '((class "figure-caption")) tx-elements)])
   (txexpr 'figure '((class "figure")) (list img-tx cap-tx))))
