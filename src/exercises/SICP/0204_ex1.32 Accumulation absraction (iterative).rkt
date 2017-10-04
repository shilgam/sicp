#lang racket
; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
(define (accumulation combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))

  (iter a null-value))


(define (sum term a next b)
  (accumulation + 0 term a next b))

(define (product term a next b)
  (accumulation * 1 term a next b))

(define (linear-sum n)
  (sum linear 1 inc n))

(define (factorial n)
  (product linear 1 inc n))
; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
; additional procedures:

(define (inc x)
  (+ x 1))

(define (linear x)
  x)

; - - - - - - - - - - - - - - - - - - - - -
; Results:

(linear-sum 8)
(factorial 8)
