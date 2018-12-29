; Exercise 1.16: Design a procedure that evolves an iterative exponentiation 
; process that uses successive squaring and uses a logarithmic number of steps, 
; as does fast-expt. (Hint: Using the observation that (b^n/2)^2 = (b^2)^(n/2),
; keep, along with the exponent n and the base b, an additional state variable
; a, and define the state transformation in such a way that the product a*b^n
; is unchanged from state to state. At the beginning of the process a is taken
; to be 1, and the answer is given by the value of a at the end of the process.
; In general, the technique of defining an invariant quantity that remains 
; unchanged from state to state is a powerful way to think about the design of 
; iterative algorithms.)

(define (fast-expt b n)

  (define (fast-expt-iter a b count)
    (cond ((= count 0) a)
          ((even? count) (fast-expt-iter a (square b) (/ count 2)))
          (else (fast-expt-iter (* a b) b (- count 1)))))

  (fast-expt-iter 1 b n))

(define (even? n)
  (= (remainder n 2) 0))

(assert (= (fast-expt 2 1) 2))
(assert (= (fast-expt 2 2) 4))
(assert (= (fast-expt 2 3) 8))
(assert (= (fast-expt 2 4) 16))
(assert (= (fast-expt 2 5) 32))
(assert (= (fast-expt 2 6) 64))
(assert (= (fast-expt 2 7) 128))
(assert (= (fast-expt 2 8) 256))
(assert (= (fast-expt 2 9) 512))
(assert (= (fast-expt 2 10) 1024))
