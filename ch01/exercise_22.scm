; Exercise 1.22: Most Lisp implementations include a primitive called runtime 
; that returns an integer that specifies the amount of time the system has been 
; running (measured, for example, in microseconds). The following 
; timed-prime-test procedure, when called with an integer n, prints n and 
; checks to see if n is prime. If n is prime, the procedure prints three 
; asterisks followed by the amount of time used in performing the test.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; Using this procedure, write a procedure search-for-primes that checks the 
; primality of consecutive odd integers in a specified range. Use your 
; procedure to find the three smallest primes larger than 1000; larger than 
; 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to 
; test each prime. Since the testing algorithm has order of growth of
; O(sqrt(n)), you should expect that testing for primes around 10,000 should
; take about sqrt(10) times as long as testing for primes around 1000. Do your
; timing data bear this out? How well do the data for 100,000 and 1,000,000
; support the O(sqrt(n)) prediction? Is your result compatible with the notion
; that programs on your machine run in time proportional to the number of steps
; required for the computation?

(load "ch01.scm")

(define (search-for-primes start end)
  (timed-prime-test start)
  (if (< start end) (search-for-primes (+ start 1) end)))

; (search-for-primes 1000 10000)
; (search-for-primes 10000 100000 (runtime))
; (search-for-primes 100000 1000000 (runtime)


(define (three-smallest-primes-in-range start end)

  (define (report-prime n)
      (newline)
      (display n)
      (display " is a prime."))

  (define (search curr count)
    (if (and (< curr end) (< count 3))
        (cond ((prime? curr)
               (report-prime curr)
               (search (+ 2 curr) (+ 1 count)))
              (else (search (+ 2 curr) count)))))
            
  (if (even? start)
      (search (+ 1 start) 0)
      (search start 0)))

(three-smallest-primes-in-range 1000 10000)
(three-smallest-primes-in-range 10000 100000)
(three-smallest-primes-in-range 100000 1000000)


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

(test-runtime 1000)
(test-runtime 10000)
(test-runtime 100000)
(test-runtime 1000000)
