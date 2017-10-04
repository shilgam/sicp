#lang racket

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose proc1 proc2)
  (lambda (x) (proc1 (proc2 x))))

((compose inc     square) 10)
((compose square  inc)    10)
