; Exercise 1.18: Using the results of Exercise 1.16 and Exercise 1.17, devise a
; procedure that generates an iterative process for multiplying two integers in
; terms of adding, doubling, and halving and uses a logarithmic number of
; steps.

(define (fast-mult a b)

  (define (double x) (* x 2))

  (define (halve x) (/ x 2))

  (define (even? x) (= (remainder x 2) 0))

  (define (fast-mult-iter sum add count)
    (cond ((= count 0) sum)
          ((even? count) (fast-mult-iter sum (double add) (halve count)))
          (else (fast-mult-iter (+ sum add) add (- count 1)))))

  (fast-mult-iter 0 a b))

(fast-mult 3 4)
