; Exercise 1.39: A continued fraction representation of the tangent function
; was published in 1770 by the German mathematician J.H. Lambert:
;
; tan x = x / (1 - x^2 / 3 - (x^2 / (5 - ...)))
;
; where x is in radians. Define a procedure (tan-cf x k) that computes an
; approximation to the tangent function based on Lambert’s formula. k specifies
; the number of terms to compute, as in Exercise 1.37.

(define (cont-frac n d k)
  (define (f i)
    (if (< i k)
        (/ (n i) (+ (d i) (f (+ i i))))
        (/ (n k) (d k))))
  (f 1))

(define (tan-cf x k)

  (define (n k)
    (if (= k 1)
        x
        (* -1.0 (square x))))

  (define (d k)
    (- (* 2 k) 1))

  (cont-frac n d k))
