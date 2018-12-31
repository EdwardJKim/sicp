; Exercise 1.23: The smallest-divisor procedure shown at the start of this
; section does lots of needless testing: After it checks to see if the number
; is divisible by 2 there is no point in checking to see if it is divisible by
; any larger even numbers. This suggests that the values used for test-divisor
; should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, ... To implement
; this change, define a procedure next that returns 3 if its input is equal to
; 2 and otherwise returns its input plus 2. Modify the smallest-divisor
; procedure to use (next test-divisor) instead of (+ test-divisor 1). With
; report-runtime incorporating this modified version of smallest-divisor, run
; the test for each of the 12 primes found in Exercise 1.22. Since this
; modification halves the number of test steps, you should expect it to run
; about twice as fast. Is this expectation confirmed? If not, what is the
; observed ratio of the speeds of the two algorithms, and how do you explain
; the fact that it is different from 2?

(define (smallest-divisor n)

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (next n)
    (if (= n 2)
        3
        (+ n 2)))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))

  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (test-runtime n)

  (define (report-runtime start-time)
    (newline)
    (display "elapsed time: ")
    (display (- (runtime) start-time)))

  (define (search curr start-time)
    (cond ((< curr n)
           (prime? curr)
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
