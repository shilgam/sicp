#lang racket

(define (fast-expt n b)

  (define (square x)
    (* x x))

  (define (even? num)
    (= (remainder num 2) 0))

  (define (fast-expt-iter n b a)
    ; where (a * b^n) <--- invariant
    (if (= n 0)
        a
        (if (even? n)
            (fast-expt-iter (/ n 2) (square b) a)
            (fast-expt-iter (- n 1) b (* a b)))))

    (fast-expt-iter n b 1))

(fast-expt 10 2)
