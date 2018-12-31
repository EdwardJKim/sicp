; Exercise 1.38: In 1737, the Swiss mathematician Leonhard Euler published a
; memoir De Fractionibus Continuis, which included a continued fraction
; expansion for e − 2, where e is the base of the natural logarithms. In this
; fraction, the N_i are all 1, and the D_i are successively 1, 2, 1, 1, 4, 1,
; 1, 6, 1, 1, 8, ... Write a program that uses your cont-frac procedure from
; Exercise 1.37 to approximate e, based on Euler’s expansion.

(load "exercise_37.scm")

(define (e)

  (define (d i)
    (cond ((<= i 2) i)
          ((= (remainder (+ i 1) 3) 0) (* 2.0 (/ (+ i 1) 3)))
          (else 1.0)))

  (+ 2.0 (cont-frac (lambda (i) 1.0) d 11)))

(e)
