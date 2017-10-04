#lang racket
;(+ 2 2)
(define size 2)

; 1.1.4. Compound procedures:
(define (square x)(* x x))
(square 9)

(define (sum-of-square x y) (+ (square x) (square y)))
;(sum-of-square 4 4)

; 1.1.6. Conditional expressions:
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
        ))
;(abs -1)
;(abs 1)

; ex 1.3 Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers:
(define (sum-of-square-max-num a b c)
  (cond ((and (not (> c a)) (not (> c b))) (sum-of-square a b))
        ((and (not (> b a)) (not (> b c))) (sum-of-square a c))
        ((and (not (> a b)) (not (> a c))) (sum-of-square b c))
        )
  )

; (sum-of-square-max-num 1 1 0)

; ex 1.4 Operators are compound expressions:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;(a-plus-abs-b 1 -3)

; ex 1.5 Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
(define (p)(p))
(define (test x y)
  (if (= x 0)
  0
  y))

; (test 0 (p))
