#lang racket
; Lesson #4:
; Implement the Ackermann's function A.
; It takes two parameters, x and y, and works as follows:
; if y = 0, then it returns 0;
; if x = 0, then it returns 2*y;
; if y = 1, then it returns 2;
; else, it calls itself (function A) with x = x-1 and y = A ( x, (y - 1) )

(define (ackermann_func x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (+ (ackermann_func (- x 1)
                                 (ackermann_func x (- y 1)))))))

; (ackermann_func 1 10)
(ackermann_func 2 4)