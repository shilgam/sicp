#lang racket

(define (sine x)

  (define (cube x) (* x x x))

  (if (< (abs x) 0.1)
      x
      (- (* 3 (sine (/ x 3)))
         (* 4 (cube (sine (/ x 3)))))
  ))

(sine (/ pi 2))
(sine pi)
(sine (* 3 (/ pi 2)))
(sine (* 2 pi))

(sin 1.0)
