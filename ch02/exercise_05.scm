; Exercise 2.5: Show that we can represent pairs of nonnegative integers using
; only numbers and arithmetic operations if we represent the pair a and b as
; the integer that is the product 2^a 3^b. Give the corresponding definitions
; of the procedures cons, car, and cdr.

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car x)
  (define (factor n)
    (if (not (= (remainder n 2) 0))
        0
        (+ 1 (factor (/ n 2)))))
  (factor x))

(define (cdr x)
  (define (factor n)
    (if (not (= (remainder n 3) 0))
        0
        (+ 1 (factor (/ n 3)))))
  (factor x))
