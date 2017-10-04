#lang racket

(define (abs x)
  (if (< x 0)
      (- x)
      x))

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


(define (average a b)
  (* 0.5 (+ a b)))

(define (average-dump f)
  (lambda (x) (average x (f x))))

(define (square x)
  (* x x))


(define (deriv f)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (f (+ x dx)) (f x))
                   dx)) ))

(define (newtons-transform g)
  (lambda (x)
                 (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method f guess)
  (fixed-point (newtons-transform f) guess))

(newtons-method (lambda (x) (- (* x x) 4))
                0.1)

; Вычисление квадратного корня с помощью метода Ньютона
(define (sqrt x)
  (newtons-method (lambda (y) (- (* y y) x))
                  1.0))


; --------------------------------------
(newtons-method cos    1.2)
(newtons-method cos (- 1.2))

; (sqrt 1000)
