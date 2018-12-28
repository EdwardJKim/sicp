;;; Exercise 1.3: Define a procedure that takes three numbers as arguments and
;;; returns the sum of the squares of the two larger numbers.

(load "ch01.scm")

(define (sum-of-squares a b c)
  (+ (square a) (square b) (square c)))

(define (sum-of-squares-of-two-largest a b c)
  (- (sum-of-squares a b c) (square (min a b c))))

(assert (= (sum-of-squares-of-two-largest 1 2 3) 13))
(assert (= (sum-of-squares-of-two-largest 3 2 1) 13))
(assert (= (sum-of-squares-of-two-largest 2 3 1) 13))
(assert (= (sum-of-squares-of-two-largest 5 4 1) (+ 25 16)))
