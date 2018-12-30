; Exercise 1.21: Use the smallest-divisor procedure to find the smallest
; divisor of each of the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (find-divisor divisor)
    (cond ((> (square divisor) n) n)
          ((divides? divisor n) divisor)
          (else (find-divisor (+ divisor 1)))))

  (find-divisor 2))


(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
