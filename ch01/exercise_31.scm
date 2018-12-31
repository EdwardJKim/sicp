; Exercise 1.31:
;
; 1. The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of
; a function at points over a given range. Show how to define factorial in
; terms of product. Also use product to compute approximations to pi using the
; formula
;
; pi / 4 = (2 * 4 * 4 * 6 * 6 * 8 * ...) / (3 * 3 * 5 * 5 * 7 * 7 * ...)
;
; 2. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

; recursive

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (define (identity a) a)
  (define (inc a) (+ a 1))
  (product identity 1 inc n))

(define (even? n)
  (= (remainder n 2) 0))

(define (pi n)

  (define (pi-term k)
    (if (even? k)
        (/ (+ k 2) (+ k 1))
        (/ (+ k 1) (+ k 2))))

  (define (inc a) (+ a 1))

  (* 4.0 (product pi-term 1 inc n)))

(pi 1000)


; iterative

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(pi 1000)
