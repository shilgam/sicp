#lang racket

(define (square x)
  (* x x))


(define (f g)
  (g 2))

(f square)


(f f)
