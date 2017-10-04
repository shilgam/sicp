#lang racket

(define (mult a b)

  (define (double x)
    (* x 2))

  (define (halve x)
  (/ x 2))

  (define (mult-iter a b balance)
    (if (= b 1)
        (+ a balance)
        (if (even? b)
            (mult-iter (double a) (halve b) balance)
            (mult-iter a          (- b 1)   (+ balance a)))))

  (mult-iter a b 0))


(mult 3 7)
