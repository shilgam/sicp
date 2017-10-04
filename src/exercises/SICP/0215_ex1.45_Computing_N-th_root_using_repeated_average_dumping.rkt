#lang racket
; Related exersize:  1.40


(require "0215_ex1.45_HelpFile_Newtons_method.rkt") ; include Help-file

(define (repeat proc times)
  (if (= times 1)
      (lambda (x) (proc x))
      (lambda (x) (proc ((repeat proc (- times 1)) x)) )))

(define (smooth f)
  (define (average a b c) (/ (+ a b c) 3))
  (let ((dx 0.1))
    (lambda (x) (average (f (- x dx))
                         (f x)
                         (f (+ x dx))))) )

;((repeat inc 5) 10)

; Repeat Smooth procedure n times for function sin
;(((repeat smooth 3) sin) 1)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

; ------------------------------------------------

; N  root - searching fixed point for transformation: y --> x/y with average dumping
(define (exp-n x n)
    (if (= n 0)
        1
        (* x (exp-n x (- n 1)))))

(define (n-th-root x n)

  (define (find-dump-number n)
    (let ((a  (- (* (/ 1 (log 2)) (log (+ n 1))) 1)))
      (ceiling a)))

  (define (find-n-th-root-with-dump x n dumps)
    (fixed-point-of-transform (lambda (y) (/ x (exp-n y (- n 1))))
                              (repeat average-dump dumps)
                              1.0))

  (find-n-th-root-with-dump x n (find-dump-number n)))

(n-th-root 1000  3)
(n-th-root 10000 4)
