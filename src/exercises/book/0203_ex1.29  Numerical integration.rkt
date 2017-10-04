#lang racket

; - - - - - - - - - - - - - - - - - - - - -
; Общее понятие суммирования
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a)
              next
              b))))
; - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - -
;  (exact->inexact x)
; - - - - - - - - - - - - - - - - - - - - -
; definite integral of a function f between the limits a and b
(define (linear x)
  x)
(define a 0)
(define b 10)

(define (dx min max)
  (/ (- max min) 1000))


(define (integral function a b dx)

  (define (piese a)
    (function (+ a (* (dx a b) 0.5))))

  (define (add-dx x)
    (+ x (dx a b)))

  (* (dx a b)
     (sum piese a add-dx b)))

(display "Integral of a function = ")
(integral linear a b dx)
