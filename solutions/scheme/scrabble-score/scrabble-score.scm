(import (rnrs))

(define (value letter)
  (case letter
    ((#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t) 1)
    ((#\d #\g) 2)
    ((#\b #\c #\m #\p) 3)
    ((#\f #\h #\v #\w #\y) 4)
    ((#\k) 5)
    ((#\j #\x) 8)
    ((#\q #\z) 10)
    (else 0)))

(define (score word)
  (let ((total 0))
    (for-each (lambda (letter)
                (set! total (+ total (value letter))))
      (string->list (string-downcase word)))
    total))