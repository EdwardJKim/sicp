; Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of extra work
; in writing expmod. After all, she says, since we already know how to compute
; exponentials, we could have simply written

(define (expmod base exp n)
  (remainder (fast-expt base exp) n))

; Is she correct? Would this procedure serve as well for our fast prime tester?
; Explain.

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

; This procedure would not serve as well, because we are dealing with very
; large numbers in the new procedure. In the old procedure, we never had to
; deal with numbers larger than m.
