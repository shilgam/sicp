#lang racket
; ex 1.37
; golden ratio = 1.61803398874989484820458683436563811772030917980576...

(define (cont-frac k n d)
  (define (cont-frac-recur count result)
    (if (= count 0)
        result
        (cont-frac-recur (- count 1) (/ (n count) (+ (d count) result))) ))
  (cont-frac-recur k 0))


(define (golden-ratio k)
  (/ 1 (cont-frac k
                  (lambda (i) 1.0)
                  (lambda (i) 1.0))))



(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (puts string)
  (display string)
  (newline))

(define epsilon 0.000099)

(define (print-golden-ratio epsilon)
  (let ((exact-golden-ratio 1.61803398874989484820458683436563811772030917980576))

    (define (iter count)
      (let ((deviation            (abs(- (golden-ratio count) exact-golden-ratio))))

        (define (display-results defiation)
        (display count)
        (display "\t")
        (puts deviation))

        (if (< deviation epsilon)
            (begin
              (display-results deviation)
              (puts "        --- END OF PROCEDURE ---"))
            (begin
              (display-results deviation)
              (iter (+ 1 count))))))

    (puts "k      Amount of deflection")
    (newline)

    (iter 2)))


(print-golden-ratio epsilon)
