#lang racket
; integer multiplication - repeated addition
; steps ~ b
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

; fast multiplication
(define (*_fast a b)
  (define (double x)
    (* x 2))

  (define (halve x)
  (/ x 2))

  (if (= b 0)
      0
      (if (even? b)
          (*_fast (double a)
                  (halve b))
          (+ a (*_fast a
                       (- b 1))))))


(*      2 100)
(*_fast 2 100)
