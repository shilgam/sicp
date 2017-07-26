#lang racket
; Lesson #11:

(define (sum-int a b)
  (if (> a b) 0
      (+ a (sum-int (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b) 0
      (+ (* a a a) (sum-cubes (+ a 1) b))))

; 1/(1*3) + 1/(5*7) + 1/(9*11) + ... = pi/8

(define (pi-sum a b)
  (if (> a b) 0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

; (sum-int 1 10)
 (sum-cubes 1 10)
; (pi-sum 1 10)

; --------------
; SUM OF SEQUENCE:
(define (sum-of-seq term next a b)
  (if (> a b) 0
      (+ (term a) (sum-of-seq term next (next a) b))))
; --------------

(define (sum-int2 a b)
  (define (term n) n)
  (define (next n) (+ n 1))
  (sum-of-seq term next a b))
; (sum-int2 1 10)

(define (sum-cubes2 a b)
  (define (term n) (* n n n))
  (define (next n) (+ n 1))
  (sum-of-seq term next a b))
(sum-cubes2 1 10)

(define (pi-sum2 a b)
  (define (term n) (/ 1.0 (* n (+ n 2))))
  (define (next n) (+ n 4))
  (sum-of-seq term next a b))
; (pi-sum2 1 10)
