#lang racket
; - - - - - - - - - - - - - - - - - - - - -
; SUM - recursive algoritm
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))

; - - - - - - - - - - - - - - - - - - - - -
; SUM - iterative algoritm
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

; - - - - - - - - - - - - - - - - - - - - -
; additional data for both algoritms
(define a 0)
(define b 100)

(define (inc x)
  (+ x 1))

(define (cubes x)
  (* x x x))

; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
(define (sum-cubes a b)
  (sum cubes a inc b))
(display "Sum (recursive algoritm) = ")
(sum-cubes a b)


(display "Sum (iterative algoritm) = ")
(sum-iter cubes a inc b)
