; Exercise 1.27: Demonstrate that the Carmichael numbers listed in Footnote 47
; really do fool the Fermat test. That is, write a procedure that takes an
; integer n and tests whether a^n is congruent to a modulo n for every a < n,
; and try your procedure on the given Carmichael numbers.

(load "ch01.scm")

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)


(fast-prime? 561 10)
(fast-prime? 1105 10)
(fast-prime? 1729 10)
(fast-prime? 2465 10)
(fast-prime? 2821 10)
(fast-prime? 6601 10)

(define (carmichael? n)

  (define (try-it a)
    (cond ((>= a n) true)
          ((= (expmod a n n) a) (try-it (+ 1 a)))
          (else false)))

  (try-it 1))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
