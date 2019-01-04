; Exercise 2.41: Write a procedure to find all ordered triples of distinct
; positive integers i, j, and k less than or equal to a given integer n that
; sum to a given integer s.

(load "ch02.scm")

(define (make-triple-sum triple)
  (append triple (list (accumulate + 0 triple))))

(define (target-sum-triples s)
  (define (target-sum? triple) (= s (accumulate + 0 triple)))
  (map make-triple-sum
       (filter
        target-sum?
        (flatmap
         (lambda (i)
           (flatmap
            (lambda (j)
              (map (lambda (k) (list i j k))
                   (enumerate-interval 1 (- j 1))))
            (enumerate-interval 1 (- i 1))))
         (enumerate-interval 1 s)))))

(target-sum-triples 10)
