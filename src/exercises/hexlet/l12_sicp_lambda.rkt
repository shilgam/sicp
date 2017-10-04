#lang racket

; Part#2. ex1.41 DOUBLE: apply the original procedure twice.
(define (double proc)
  (lambda (x) (proc (proc x))))

(define inc (lambda (n) (+ n 1)))
(define (square x) (* x x))

; ((double inc) 3)

; -------------------

; Part#3. REPEATED:  apply the original procedure n times
         
(define (repeated proc n)

  (define (repeated-iter count n accum)
    (if (= count n) accum 
        (repeated-iter (+ count 1) n (lambda (x) (proc (accum x))))))

  (repeated-iter 0 n (lambda (x) x)))

((repeated inc 1) 1)
((repeated inc 2) 1)
((repeated square 1) 2)
((repeated square 2) 2)