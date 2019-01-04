; Exercise 2.35: Redefine count-leaves from 2.2.2 as an accumulation:

(load "ch02.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                         (if (not (pair? x))
                             1
                             (count-leaves x)))
                       t)))
