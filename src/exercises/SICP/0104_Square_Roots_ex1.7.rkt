#lang racket

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt 0.0001)
(sqrt 900000000)
;(sqrt (square 1000.0))
