#lang racket
; Straightforward way
; Order of growth: Teta(n^(1/2))
(define (smallest-divisor n)
  (define (divide? a b)
    (= (remainder a b) 0))

  (define (square n)
    (* n n))

  (define (smallest-divisor-iter counter)
    (cond ((> (square counter) n) n)
          ((divide? n counter) counter)
          (else (smallest-divisor-iter (+ counter 1)))))

  (smallest-divisor-iter 2))

(smallest-divisor 15)
(smallest-divisor 13)

; Testing for Primality (Проверка на простоту)
; n - простое тогда и только тогда, когда является наименьшим общим делителем
(define (prime? n)
  (= (smallest-divisor n) n))

(prime? 15)
(prime? 13)
(remainder (* 7 7 7 7 7) 5)
