; Exercise 2.1: Define a better version of make-rat that handles both positive
; and negative arguments. Make-rat should normalize the sign so that if the
; rational number is positive, both the numerator and denominator are positive,
; and if the rational number is negative, only the numerator is negative.

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
        (sign (if (< (* n d) 0)
                  -1
                  1)))
    (cons (* sign (/ (abs n) g)) (/ (abs d) g))))
