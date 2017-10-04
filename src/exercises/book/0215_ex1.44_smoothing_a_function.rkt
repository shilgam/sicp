#lang racket

(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose proc1 proc2)
  (lambda (x) (proc1 (proc2 x))))


(define (repeat proc times)
  (if (= times 1)
      (lambda (x) (proc x))
      (lambda (x) (proc ((repeat proc (- times 1)) x)) )))


(define (average a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (let ((dx 0.1))
    (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx))))) )

;((repeat inc 5) 10)


; Repeat Smooth procedure n times for function sin
(((repeat smooth 3) sin) 1)

(newline)
; without smooth procedure:
(sin 1)
; 1st time:
((smooth sin) 1)
; 2nd time:
((smooth (smooth sin)) 1)
; 3rd time:
((smooth (smooth (smooth sin))) 1)
