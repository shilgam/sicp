#lang racket

; Define a procedure sum-of-squares-of-top-two that takes three numbers
; as arguments and returns the sum of the squares of the two larger numbers.
; For example:
; if argument numbers are 1, 2 and 4 --> procedure should return 2^2 + 4^2 = 20
; if argument numbers are 9, 3 and 7 --> procedure should return 9^2 + 7^2 = 130

(define (square x) (* x x))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-squares-of-top-two a b c)
  (cond
    ((and (> a c) (> b c)) (sum-of-squares a b))
    ((and (> a b) (> c b)) (sum-of-squares a c))
    ((and (> b a) (> c a)) (sum-of-squares b c))
))

(sum-of-squares-of-top-two 1 2 3)   ; 13
(sum-of-squares-of-top-two 3 4 2)   ; 25
(sum-of-squares-of-top-two 5 3 4)   ; 41
