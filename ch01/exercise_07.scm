; Exercise 1.7: The good-enough? test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also,
; in real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for small
; and large numbers. An alternative strategy for implementing good-enough? is
; to watch how guess changes from one iteration to the next and to stop when
; the change is a very small fraction of the guess. Design a square-root
; procedure that uses this kind of end test. Does this work better for small
; and large numbers?

(load "ch01.scm")

(sqrt 0.0001)
(sqrt 10000000000)

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? prev-guess curr-guess)
  (< (abs (- prev-guess curr-guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.0001)
(sqrt 10000000000)
