; Exercise 1.37:
;
; 1. An infinite continued fraction is an expression of the form
;
; f = N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ...)))
;
; As an example, one can show that the infinite continued fraction expansion
; with the N_i and the D_i all equal to 1 produces 1 / phi, where phi is the
; golden ratio (described in 1.2.2). One way to approximate an infinite
; continued fraction is to truncate the expansion after a given number of
; terms. Such a truncation--a so-called finite continued fraction k-term finite
; continued fraction--has the form
;
; N_1 / (D_1 + N_2 / (... + N_k / D_k))
;
; Suppose that n and d are procedures of one argument (the term index i) that
; return the N_i and D_i of the terms of the continued fraction. Define a
; procedure cont-frac such that evaluating (cont-frac n d k) computes the value
; of the k-term finite continued fraction. Check your procedure by
; approximating 1 / phi using
; 
; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)
; 
; for successive values of k. How large must you make k in order to get an
; approximation that is accurate to 4 decimal places?
;
; 2. If your cont-frac procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.


; recursive

(define (cont-frac n d k)
  (if (= k 1)
      1
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; iterative

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i k)
        result
        (iter (+ i 1) (/ (n i) (+ (d i) result)))))
  (iter 1 1.0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
