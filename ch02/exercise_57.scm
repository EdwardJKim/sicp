; Exercise 2.57: Extend the differentiation program to handle sums and products
; of arbitrary numbers of (two or more) terms. Then the last example above
; could be expressed as
;
; (deriv '(* x y (+ x 3)) 'x)
;
; Try to do this by changing only the representation for sums and products,
; without changing the deriv procedure at all. For example, the addend of a sum
; would be the first term, and the augend would be the sum of the rest of the
; terms.

(load "ch02.scm")

(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (append (list '+) (cddr s))))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (append (list '*) (cddr p))))

(deriv '(* x y (+ x 3)) 'x)

