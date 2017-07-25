#lang racket
; Lesson #6:
; Pascal's triangle

(define (pasc-triangle x y)
  (cond ((= y 1) 1)
        ((= x y) 1)
        (else (+ (pasc-triangle (- x 1) (- y 1))
                 (pasc-triangle (- x 1) y)))))

(pasc-triangle 5 4)