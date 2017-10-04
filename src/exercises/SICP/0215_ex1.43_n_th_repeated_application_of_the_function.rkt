#lang racket

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose proc1 proc2)
  (lambda (x) (proc1 (proc2 x))))


(define (repeat proc times)
  (if (= times 1)
      (lambda (x) (proc x))
      (lambda (x) (proc ((repeat proc (- times 1)) x)) )))


((repeat inc 5) 10)
((repeat square 1) 10)
((repeat square 2) 5)
