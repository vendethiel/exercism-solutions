#lang racket
(require racket/match)

(provide balanced?)

(define matches
  (make-immutable-hash
   '([#\( . #\)]
     [#\[ . #\]]
     [#\{ . #\}])))

(define (get-end-for-start c)
  (hash-ref matches c #f))

(define ends (hash-values matches))

(define (balanced? str)
  (define/match (go chars stack)
    [((list) (list))
     #t]
    [((list) _)
     #f]

    [((list* c cs) (list* c stack))
     (go cs stack)]
    [((list* c cs) _)
     #:when (member c ends)
     #f]

    [((list* c cs) stack)
       #:do [(define end (get-end-for-start c))]
       #:when end
       (go cs (cons end stack))]

    [((list* c cs) stack)
     (go cs stack)])
  (go (string->list str) null))