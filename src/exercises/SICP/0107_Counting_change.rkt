#lang racket
; Counting chang

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond
        ((= kinds-of-coins 1) 50)
        ((= kinds-of-coins 2) 25)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 5)
        ((= kinds-of-coins 5) 1)
        ))


(count-change 50)
(count-change 100)
(count-change 150)
(count-change 200)
(count-change 250)
(count-change 300)
(count-change 350)
(count-change 400)
(count-change 450)
(count-change 500)
(count-change 550)
(count-change 600)
