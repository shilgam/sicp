#lang racket
; f(x) = x
; Finding fixed point: f(x), f(f(x)), f(f(f(x))), ...

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enought? x y)
    (< (abs (- x y)) tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enought? guess next)
          next
          (try next))))
  
  (try first-guess))

(fixed-point cos 1.0)