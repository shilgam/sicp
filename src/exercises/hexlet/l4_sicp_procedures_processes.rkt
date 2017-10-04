#lang racket
; Lesson #4: Recursive versus Iterative Process
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; Linear Recursive process:
; steps: O(n)
; mem:   O(n)
(define (+o1 a b)
  (if (= a 0) b
      (inc (+o1 (dec a) b))))
(+o1 4 5)

; Linear Iterative process:
; steps: O(n)
; mem:   O(1)
(define (+o2 a b)
  (if (= a 0) b
      (+o2 (dec a) (inc b))))
(+o2 4 5)
