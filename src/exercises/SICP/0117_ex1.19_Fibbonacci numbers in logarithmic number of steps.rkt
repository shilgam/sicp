#lang racket

; n         0  1  2  3  4  5  6  7  8
; fib(n):   0  1  1  2  3  5  8  13 21

(define (fib n)

  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))   ; compute P'
                     (+ (* 2 p q) (* q q))  ; compute q'
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))
  (fib-iter 1 0 0 1 n))

(fib 6)
