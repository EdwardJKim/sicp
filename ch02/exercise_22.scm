; Exercise 2.22: Louis Reasoner tries to rewrite the first square-list
; procedure of Exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(square-list (list 1 2 3 4))

; Unfortunately, defining square-list this way produces the answer list in the
; reverse order of the one desired. Why?
;
; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square
                     (car things))))))
  (iter items '()))

(square-list (list 1 2 3 4))

; This doesn’t work either. Explain.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list
                       (square
                        (car things)))))))
  (iter items '()))

(square-list (list 1 2 3 4))
