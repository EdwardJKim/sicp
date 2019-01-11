; Exercise 2.56: Show how to extend the basic differentiator to handle more
; kinds of expressions. For instance, implement the differentiation rule
;
; d(u^n) / dx = n u^{n-1} du / dx
;
; by adding a new clause to the deriv program and defining appropriate
; procedures exponentiation?, base, exponent, and make-exponentiation. (You may
; use the symbol ** to denote exponentiation.) Build in the rules that anything
; raised to the power 0 is 1 and anything raised to the power 1 is the thing
; itself.

(load "ch02.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation (base exp) (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else (error "unknown expression type: deriv" exp))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent))
         (expt base exponent))
        (else (list '** base exponent))))
