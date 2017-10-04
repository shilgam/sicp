#lang racket

; Метoд половинного деления (half-interval method)

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (if (< (f midpoint) 0)
            (half-interval-method f midpoint pos-point)
            (half-interval-method f neg-point midpoint)))))


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (< a-value 0) (> b-value 0))  (search f a b))
          ((and (> a-value 0) (< b-value 0))  (search f b a))
          (else
             (error "Arguments have the same sign " a b)))))


(define (average a b)
  (+ a (* 0.5 (- b a))))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (close-enough? x1 x2)
  (< (abs (- x1 x2)) 0.00001))


(define (f1 x)
  (- (* x x) 9))

(search f1 1 100)
(search sin 2.0 4.0)
