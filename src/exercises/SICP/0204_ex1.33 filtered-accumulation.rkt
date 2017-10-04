#lang racket
(require "0204_ex1.33_Help_filter_for_prime_numbers.rkt")   ; ----> including procedure (prime?-MRT n)
; for filtering by prime numbers

; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
(define (accumulation combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (combiner (filter (term a) null-value)
                (accumulation combiner null-value filter term (next a) next b))))


(define (filter-by-prime n null-value)
  (if (< n 3)
      n
      (if (prime?-FT n)
          n
          null-value)))

(define (sum term a next b)
  (accumulation + 0 filter-by-prime term a next b))

(define (product term a next b)
  (accumulation * 1 filter-by-prime term a next b))

(define (linear-sum-with-filter n)
  (sum linear 1 inc n))

(define (factorial-with-filter n)
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

(linear-sum-with-filter 8)
;(factorial 8)

(factorial-with-filter 5)
