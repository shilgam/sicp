#lang racket

; EX 1.38. Approxoimate for base e (Euler's number)
; e = 2.71828182845904523536028747135266249775724709369995

(define (convert-to-float x)
  (exact->inexact x))

(define (cont-frac k n d x)
  (define (iter count)
    (if (> count k)
        0
        (/ (n count) (+ (d count x) (iter (+ 1 count))))))
  (convert-to-float (iter 1)))


(define (square x)
  (* x x))

(define (n i)
  (- (* i 2) 1))

(define (d i x)
  (if (= i 1)
      x
      (square x)))

(define (tan-cf x k)
  (cont-frac k
             n
             d
             x))


(tan-cf 0.5 10000)
