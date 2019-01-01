; Exercise 2.17: Define a procedure last-pair that returns the list that
; contains only the last element of a given (nonempty) list:

(define (last-pair items)
  (if (= (length items) 1)
      items
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34))
