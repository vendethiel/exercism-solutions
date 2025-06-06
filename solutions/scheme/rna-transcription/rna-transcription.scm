(import (rnrs))

(define (dna1->rna1 c)
  (case c
    ((#\G) #\C)
    ((#\C) #\G)
    ((#\T) #\A)
    ((#\A) #\U)))

(define (dna->rna dna)
  (list->string (map dna1->rna1 (string->list dna))))

