#lang racket
; Providing procedures for the Main File:
(provide newtons-method)

(provide newton-transform)
(provide fixed-point)
(provide average-dump)

(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (abs x)
    (if (< x 0) (- x) x))

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-dump f)
  (define (average a b) (* 0.5 (+ a b)))
  (lambda (x) (average x (f x))))

(define (newton-transform g)
  (define (deriv f)
    (let ((dx 0.00001))
      (lambda (x) (/ (- (f (+ x dx)) (f x))
                     dx)) ))
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

; Newtons method:
(define (newtons-method f guess)
  (fixed-point (newton-transform f) guess))

; Calculation of SQUARE ROOT by using Newtons method:
(define (sqrt x)
  (newtons-method (lambda (y) (- (* y y) x))
                  1.0))

; Calculation of CUBE ROOT by using Newtons method:
(define (cube-root x)
  (newtons-method (lambda (y) (- (* y y y) x))
                  1.0))

; --------------------------------------
; Calculation of zero point for function: F(x) = x^2 - 4
;(newtons-method (lambda (x) (- (* x x) 4)) 0.1)

; Calculation of roots:
;(sqrt 100)
;(cube-root 1000)
