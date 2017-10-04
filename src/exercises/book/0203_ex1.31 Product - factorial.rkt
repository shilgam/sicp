#lang racket
; - - - - - - - - - - - - - - - - - - - - -
; product-iter - iterative algoritm
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))


(define (factorial-iter n)
  (product-iter linear 1 inc n))
; - - - - - - - - - - - - - - - - - - - - -
; product-recur - recursive algoritm
(define (product-recur term a next b)
  (if (> a b)
      1
      (* a
         (product-recur term (next a) next b))))


(define (factorial-recur n)
  (product-recur linear 1 inc n))
; - - - - - - - - - - - - - - - - - - - - -
; additional procedures:

(define (inc x)
  (+ x 1))

(define (linear x)
  x)

; - - - - - - - - - - - - - - - - - - - - -
; Results:
; 0! 	 1  
; 1! 	 1
; 2! 	 2
; 3! 	 6
; 4! 	 24
; 5! 	 120
; 6! 	 720
; 7! 	 5040
; 8! 	 40320

(factorial-iter  8)
(factorial-recur 8)
