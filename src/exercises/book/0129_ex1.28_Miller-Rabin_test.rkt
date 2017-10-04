#lang racket
(require (lib "27.ss" "srfi"))
(provide prime?-MRT)
; - - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - - -
; FERMAT TEST:

(define (square x)
  (* x x))

; Вычисление степени по модулю другого числа:
(define (expmod-FT base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square(expmod-FT base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod-FT base (- exp 1) m))
                    m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod-FT a n n) a))
  (try-it (+ 2 (random-integer (- n 2)))))

; - - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - - -
; MILLER RABIN TEST:

; Вычисление степени по модулю другого числа
(define (square-check x m)
  (if (and (or (= x 1) (= x (- m 1)))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))


(define (expmod-MRT base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
           (square-check (expmod-MRT base (/ exp 2) m) m))
        (else
           (remainder (* base (expmod-MRT base (- exp 1) m))
                    m))))

; Miller-Rabin test
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-MRT a (- n 1) n) 1))
  (try-it (+ 2 (random-integer (- n 2)))))

; - - - - - - - - - - - - - - - - - - - - - -
; - - - - - - - - - - - - - - - - - - - - - -

; Converting (LISP ---> Racket)
(define (runtime)
  (current-process-milliseconds))



; - - - - - - - - - - - - - - - - - - - - - -
; Check for prime (MILLER_RABIN):
(define (prime?-MRT-iter n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (prime?-MRT-iter n (- times 1)))
        (else false)))

(define (prime?-MRT n)
  (prime?-MRT-iter n 1000))

; Check for prime (FERMAT):
(define (prime?-iter-F n times)
  (cond ((= times 0) true)
        ((fermat-test n) (prime?-iter-F n (- times 1)))
        (else false)))

(define (prime?-FT n)
  (prime?-iter-F n 1000))

; - - - - - - - - - - - - - - - - - - - - - -
; output
(define (puts line)
  (newline)
  (display line)
  (newline))

; - - - - - - - - - - - - - - - - - - - - - -


; The Carmichael numbers under 100,000 are:
; 561, 1105, 1729, 2465, 2821, 6601, 8911, 10585, 15841, 29341, 41041, 46657, 52633, 62745, 63973, 75361, ...
; ----
(puts "Miller-Rabin test:")
(prime?-MRT   561)          ; The Carmichael number
(prime?-MRT   63018038201)  ; The Carmichael number
(prime?-MRT   274876858367) ; The Carmichael number

(puts "Fermat test:")
(prime?-FT    561)          ; The Carmichael number
(prime?-FT    63018038201)  ; The Carmichael number
(prime?-FT    274876858367) ; The Carmichael number
