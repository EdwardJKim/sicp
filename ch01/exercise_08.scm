; Exercise 1.8: Newton’s method for cube roots is based on the fact that if y
; is an approximation to the cube root of x, then a better approximation is
; given by the value
; \frac{x / y^2 + 2 y}{3}.
; Use this formula to implement a cube-root procedure analogous to the
; square-root procedure.

(load "ch01.scm")

(define (cube-root-iter guess x)
  (define next-guess (improve guess x))
  (if (good-enough? guess next-guess)
      guess
      (cube-root-iter next-guess x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess next-guess)
  (< (abs (- guess next-guess)) 0.001))

(define (cube x) (* (square x) x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 0.001)
(cube-root 8)
(cube-root 1000)
