#lang racket

; n         0  1  2  3  4  5  6  7  8
; fib(n):   0  1  1  2  3  5  8  13 21

; Iterative procedure:

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        a
        (fib-iter (+ a b) a (- count 1) )))

  (fib-iter 0 1 n))


(fib 10)
