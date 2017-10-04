#lang racket

(define (smallest-divisor n)
  (define (divide? a b)
    (= (remainder a b) 0))

  (define (square n)
    (* n n))

  (define (smallest-divisor-iter counter)
    (cond ((> (square counter) n) n)
          ((divide? n counter) counter)
          (else (smallest-divisor-iter (+ counter 1)))))

  (smallest-divisor-iter 2))

;(define (prime? n)
;  (= (smallest-divisor n) n))



;(smallest-divisor 15)
;(smallest-divisor 13)

; Testing for Primality (Проверка на простоту)
; n - простое тогда и только тогда, когда является наименьшим общим делителем

; ТЕСТ ФЕРМА НА ПРОСТОТУ:
(define (fast-prime?-times n)
  (fast-prime? n 10000))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))

  (if (> n 4294967087)
      (try-it (+ 1 (random 4294967087)))
      (try-it (+ 1 (random (- n 1))))))

; Вычисление степени по модулю другого числа
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square(expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))


; Book BEGIN
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime?-times n)
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
          (if (fast-prime?-times n)
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



(search-for-primes 100000000000     100000000100)     ; 10^11
(search-for-primes 1000000000000    1000000000100)    ; 10^12
(search-for-primes 10000000000000   10000000000100)   ; 10^13
(search-for-primes 100000000000000  100000000000100)  ; 10^14
(search-for-primes 1000000000000000 1000000000000300) ; 10^15
