#lang racket

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (double proc)
  (lambda (x) (proc (proc x))))

(inc 0)
((double inc) 0)
((double (double inc)) 0)
((double (double (double inc))) 0)


;(((double double) inc) 0)
;(((double (double double)) inc) 0)
;(((double (double (double double))) inc) 0)

(newline)
; ((double (double (double inc))) 0)



;(square 2)
;((double square) 2)
;(((double double) square) 2)
