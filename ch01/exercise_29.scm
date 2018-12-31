; Exercise 1.29: Simpson’s Rule is a more accurate method of numerical integrat
; on than the method illustrated above. Using Simpson’s Rule, the integral of a
; function f between a and b is approximated as
; h/3 (y_0 + 4 y_1 + 2 y_2 + 4 y_3+ 2 y_4 + ... + 2 y_{n−2} + 4 y_{n-1} + y_n)
; where h = (b − a) / n, for some even integer n, and y_k = f(a + k h).
; (Increasing n increases the accuracy of the approximation.) Define a
; procedure that takes as arguments f, a, b, and n and returns the value of the
; integral, computed using Simpson’s Rule. Use your procedure to integrate cube
; between 0 and 1 (with n = 100 and n = 1000), and compare the results to those
; of the integral procedure shown above.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (even? n)
  (= (remainder n 2) 0))

(define (integral f a b n)

  (define (h) (/ (- b a) n))

  (define (y k) (f (+ a (* k (h)))))

  (define (iter k)
    (cond ((= k 0) (f a))
          ((= k n) (f b))
          ((even? k) (* 2 (y k)))
          (else (* 4 (y k)))))

  (define (inc x) (+ x 1))

  (* (/ (h) 3.0) (sum iter 0 inc n)))

(define (cube x) (* x x x))

(integral cube 0 1 100)
(integral cube 0 1 1000)
