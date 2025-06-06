#lang racket

(provide number->eggs)

(require racket/fixnum)

(define (number->eggs n)
  (fxpopcount n))

