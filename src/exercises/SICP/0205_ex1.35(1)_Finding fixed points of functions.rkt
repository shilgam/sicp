#lang racket

; Нахождение неподвижных точек функций
; Неподвижная, если F(x) = x.

(define tolerance 0.00001)


(define (fixed-point f first-guess)
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (average a b)
  (* 0.5 (+ a b)))


; Вычисление квадратного корня методом неподвижных точек функции
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

; -----------------------------------------------

(fixed-point cos 1.5)

(fixed-point (lambda (x) (+ (sin x) (cos x))) 0)

(sqrt 9)
