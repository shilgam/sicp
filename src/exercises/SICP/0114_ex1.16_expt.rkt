#lang racket

; recursive process
(define (expt x n)
  (if (= n 0)
      1
      (* x (expt x (- n 1)))))

; iterative process
(define (expt2 x n)
  (define (expt2-iter product counter)
    (if (= counter 0)
        product
        (expt2-iter (* product x) (- counter 1))))
  (expt2-iter 1 n))

; iterative procecc (with logarifmic growth)
(define (fast-expt x n)

  (define (square x)
    (* x x))

  (define (even? num)
    (= (remainder num 2) 0))

  (define (fast-expt-iter product counter)
    (if (= counter 0)
        product
        (if (even? counter)
             (square (fast-expt-iter product (/ counter 2)))
             (fast-expt-iter (* product x) (- counter 1)) )))
  (fast-expt-iter 1 n))


(expt 2 4)
(expt2 2 4)
(fast-expt 2 4)
