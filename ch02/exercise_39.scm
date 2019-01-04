; Exercise 2.39: Complete the following definitions of reverse (Exercise 2.18)
; in terms of fold-right and fold-left from Exercise 2.38:

(define (reverse sequence)
  (fold-right
    (lambda (x y) (append y (list x))) '() sequence))

(reverse (list 1 4 9 16 25))

(define (reverse sequence)
  (fold-left
    (lambda (x y) (append (list y) x)) '() sequence))

(reverse (list 1 4 9 16 25))

