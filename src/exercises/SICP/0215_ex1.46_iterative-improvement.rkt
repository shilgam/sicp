#lang racket
; Uses results of ex 1.7  - sqrt
; Uses results of ex 1.35 - fixed-point

; SQRT
(define (improve guess x)
  (define (average x y) (/ (+ x y) 2))
  (average guess (/ x guess)))

(define (good-enough? guess previous-guess)
      (< (abs (- guess previous-guess)) 0.001))

(define (sqrt x)
  (define (sqrt-iter guess previous-guess x)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess x)
                   guess
                   x)))
  (sqrt-iter 1.0 0 x))
; - -
(display "sqrt: ")
(sqrt 0.0001)
(display "sqrt: ")
(sqrt 900000000)
; ---------------------------------------------

; FIXED-POINT - Нахождение неподвижных точек функций
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Golden Ratio
(define (golden-ratio x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

; -----------------------------------------------
(display "Golden ratio: ") ; golden ratio = 1.618
(golden-ratio 9)

; Iterative improvement procedure
(define (iterative-improve good-enough? improve-guess)
  ())

((iterative-improve good-enough? improve) 900000000 1.0)
