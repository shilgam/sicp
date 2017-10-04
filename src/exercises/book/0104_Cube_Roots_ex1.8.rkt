#lang racket


(define (sqrt x)
  (define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.001))

  (define (improve guess x)
  (* (/ 1 3) (+ (/ x (square guess)) (* 2 guess) )))

  (define (sqrt-iter guess previous-guess x)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess x)
                   guess
                   x)))

  (define (square x) (* x x))

  (sqrt-iter 1.0 0 x))

(sqrt 0.000001)
(sqrt 27000)
