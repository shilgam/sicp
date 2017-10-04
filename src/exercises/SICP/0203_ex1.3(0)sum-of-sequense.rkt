#lang racket

; - - - - - - - - - - - - - - - - - - - - -
(define (addend x)
  (/ 1 (* x (+ x 2))))

(define (sum-of-sequense max)
  (define (sum-of-sequense-iter count)
    (if (> count max)
        0
        (+ (addend count)
           (sum-of-sequense-iter (+ count 4)))))
  (sum-of-sequense-iter 1))

(sum-of-sequense 6)

; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
; Sum of cubes: 1^3 + 2^3 + 3^3 + ...

(define (cubes x)
  (* x x x))

(define (sum-of-cubes max)
  (define (sum-of-cubes-iter count)
    (if (> count max)
        0
        (+ (cubes count)
           (sum-of-cubes-iter (+ count 1)))))
  (sum-of-cubes-iter 1))

(sum-of-cubes 10)

; - - - - - - - - - - - - - - - - - - - - -
; Общее понятие суммирования
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))
; - - - - - - - - - - - - - - - - - - - - -

; Sum of cubes (defining throught "Summation of a series")
(define (inc x)
  (+ x 1))

(define (sum-cubes a b)
  (sum cubes a inc b))

(sum-cubes 1 10)
; - - - - - - - - - - - - - - - - - - - - -
