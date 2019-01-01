; Exercise 2.6: In case representing pairs as procedures wasn’t mind-boggling
; enough, consider that, in a language that can manipulate procedures, we can
; get by without numbers (at least insofar as nonnegative integers are
; concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo
; Church, the logician who invented the lambda-calculus.
;
; Define one and two directly (not in terms of zero and add-1). (Hint: Use
; substitution to evaluate (add-1 zero)). Give a direct definition of the
; addition procedure + (not in terms of repeated application of add-1).

; (add-1 zero)
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x)) x)))
; (lambda (f) (lambda (x) (f x)))
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; (add-1 (add-1 n))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f ((n f) x)))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f ((n f) x))) x))))
; (lambda (f) (lambda (x) (f (f ((n f) x)))))
; (lambda (f) (lambda (x) (f (f ((n f) x)))))

(define (add n m) (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define three (add one two))

((three (lambda (x) (+ x 1))) 0)

(define four (add two two))

((four (lambda (x) (+ x 1))) 0)

(define five (add two three))

((five (lambda (x) (+ x 1))) 0)
