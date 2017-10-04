#lang racket

; EX 1.38. Approxoimate for base e (Euler's number)
; e = 2.71828182845904523536028747135266249775724709369995



(define (convert-to-float x)
  (exact->inexact x))

(define (cont-frac k n d)
  (define (iter count)
    (if (> count k)
        0
        (/ (n count) (+ (d count) (iter (+ 1 count))))))
  (convert-to-float (iter 1)))


(define (d i)
  (if (= 0 (remainder (+ i 1) 3))
      (* 2 (/ (+ i 1) 3))
      1))

(define eulers-number
  (+ 2 (cont-frac 100
                  (lambda (i) 1.0)
                  d)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (puts string)
  (display string)
  (newline))

eulers-number
