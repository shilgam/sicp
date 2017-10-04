#lang racket
; Ex 1.11:
; f(n) = n if n < 3
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n > 3.
; n:    0   1   2   3   4   5   6   7
; f(n): 0   1   2   3   6   11  20  37
; Write a procedure that computes f by means of a recursive process.
; Write a procedure that computes f by means of an iterative process.

; Recursive process:
(define (func count)
  (if (< count 3)
      count
      (+ (func (- count 1))
         (func (- count 2))
         (func (- count 3)) )))

(func 7)


; Iterative process:
(define (func2 n)
  (define (func-iter a b c count n)
    (if (< (- n count 3) 0)
        c
        (func-iter b c (+ a b c) (+ count 1) n)))
  (func-iter 0 1 2 0 n))

(func2 7)
