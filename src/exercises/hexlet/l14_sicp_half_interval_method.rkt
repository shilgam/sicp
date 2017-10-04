; f(x) = 0
; f(x) - continuous function (Without breaks)
; f(a) < 0 < f(b), x = average(a, b)
#lang racket
(define (average a b)
  (/ (+ a b) 2))

(define (close-enought? x y)
  (< (abs (- x y)) 0.0001))

(define (positive? x)
  (< x 0))

(define (negative? x)
  (> x 0))

(define (abs x)
  (if (> x 0)
      x
      (- x)))

(define (search f neg-p pos-p)
  (let ((mid-p (average neg-p pos-p)))
    (if (close-enought? neg-p pos-p)
        mid-p
        (let ((test-value (f mid-p)))
          (cond ((positive? test-value)
                  (search f neg-p mid-p))
                ((negative? test-value)
                  (search f mid-p pos-p))
                (else
                  mid-p))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value)
                (positive? b-value))
           (search f a b))
          ((and (positive? a-value)
                (negative? b-value))
           (search f b a))
          (else
           (error "Error" a b)))))

; pi ===> sin x = 0
(half-interval-method sin 2.0 4.0)
