; Exercise 1.33: You can obtain an even more general version of accumulate
; (Exercise 1.32) by introducing the notion of a filter on the terms to be
; combined. That is, combine only those terms derived from values in the range
; that satisfy a specified condition. The resulting filtered-accumulate
; abstraction takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the filter. Write
; filtered-accumulate as a procedure. Show how to express the following using
; filtered-accumulate:

; 1. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)
; 2. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i, n) = 1).

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate filter
                                         combiner
                                         null-value
                                         term
                                         (next a)
                                         next
                                         b)))
        (else (filtered-accumulate filter
                                   combiner
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b))))

; 1. the sum of the squares of the prime numbers in the interval a to b

(define (smallest-divisor n)

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (inc a) (+ 1 a))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

; 2. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i, n) = 1).

(define (identity a) a)

(define (product-of-integers-relatively-prime-to n)
  (define (filter i)
    (= (gcd i n) 1))
  (filtered-accumulate filter * 1 identity 2 inc (- n 1)))
