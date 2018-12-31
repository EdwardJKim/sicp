; Exercise 1.24: Modify the timed-prime-test procedure of Exercise 1.22 to use
; fast-prime? (the Fermat method), and test each of the 12 primes you found in
; that exercise. Since the Fermat test has Θ(logn) growth, how would you expect
; the time to test primes near 1,000,000 to compare with the time needed to
; test primes near 1000? Do your data bear this out? Can you explain any
; discrepancy you find?

(load "ch01.scm")

(define (test-runtime n)

  (define (report-runtime start-time)
    (newline)
    (display "elapsed time: ")
    (display (- (runtime) start-time)))

  (define (search curr start-time)
    (cond ((< curr n)
           (fast-prime? curr 10)
           (search (+ 2 curr) start-time))
          (else (report-runtime start-time))))

  (search 3 (runtime)))

(test-runtime 1009)
(test-runtime 1013)
(test-runtime 1019)
(test-runtime 10007)
(test-runtime 10009)
(test-runtime 10037)
(test-runtime 100003)
(test-runtime 100019)
(test-runtime 100043)
