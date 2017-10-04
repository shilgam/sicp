#lang racket
; AIM: check only even numbers


(define (smallest-divisor n) ; n should be even
  (define (divide? a b)
    (= (remainder a b) 0))

  (define (square n)
    (* n n))

  (define (smallest-divisor-iter counter)
    (cond ((> (square counter) n) n)
          ((divide? n counter) counter)
          (else (smallest-divisor-iter (+ counter 1)))))

  (smallest-divisor-iter 2))


;(smallest-divisor 15)
;(smallest-divisor 13)

; Testing for Primality (Проверка на простоту)
; n - простое тогда и только тогда, когда является наименьшим общим делителем
(define (prime? n)
  (= (smallest-divisor n) n))



; Book BEGIN
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
     (report-prime (- (runtime) start-time))
     (newline)))

(define (report-prime elapsed-time)
  (display " Time:  ")
  (display elapsed-time)
  (display " ms. "))
; Book END


; Converting (LISP ---> Racket)
(define (runtime)
  (current-process-milliseconds))

;(runtime)
;(timed-prime-test 63018038201)
;(runtime)
;(timed-prime-test 274876858367)
;(runtime)


;(define (even? n) ; n - четное число?
;  (if (= (remainder n 2) 0))

(define (search-for-primes a b)

  (define (search-for-primes-iter n)
    (if (> n b)
        (begin
          (newline)
          (display "Calculating stopped. ")
          (newline))
        (begin
          (if (prime? n)
              (begin
                (timed-prime-test n)
                (display "  ")
                (search-for-primes-iter (+ n 2)))
              (begin
                (display "*")
                (search-for-primes-iter (+ n 2)))) )))

  (if (even? a)
      (search-for-primes-iter (+ a 1))
      (search-for-primes-iter a)))

(search-for-primes 1000000000000 1000000000100)
