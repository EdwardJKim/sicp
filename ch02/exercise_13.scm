; Exercise 2.13: Show that under the assumption of small percentage tolerances
; there is a simple formula for the approximate percentage tolerance of the
; product of two intervals in terms of the tolerances of the factors. You may
; simplify the problem by assuming that all numbers are positive.

; (c1 - w1, c1 + w1) * (c2 - w2, c2 + w2)
; (c1 c2 - c1 w2 - c2 w1 + w1 w2, c1 c2 + c1 w2 + c2 w1 + w1 w2)
; w = c1 w2 +  c2 w1

(load "exercise_12.scm")

(define (product-width x y)
  (+ (* (center x) (width y)) (* (center y) (width x))))
