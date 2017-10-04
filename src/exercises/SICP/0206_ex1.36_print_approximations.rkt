#lang racket

; Нахождение неподвижных точек функций
; Неподвижная, если F(x) = x.

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define tolerance 0.000001)


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
            next
          (begin
            (display next)
            (newline)
            (try next)))))
  (try first-guess))
; -----------------------------------------------
; Average dumping (Торможение усреднением):
(define (average a b)
  (* 0.5 (+ a b)))

;(define (average a b)
;  b)
; -----------------------------------------------
; Вычисление y^2 = x (квадратного корня)
; методом поиска неподвижной точки y --> x / y
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
; -----------------------------------------------
; Вычисление корня уравнения y^y = x
; Путем поиска неподвижной точки y --> lg(x)/lg(y)
(define (lg x)
  (/ (log x) (log 10)))

(define (exponent x)
  (fixed-point (lambda (y) (average y (/ (lg x) (lg y)))) 10.0))

; -----------------------------------------------

;(sqrt 100)

(exponent 256)
(expt 4.000000138126624 4.000000138126624)
