; Exercise 2.9: The width of an interval is half of the difference between its
; upper and lower bounds. The width is a measure of the uncertainty of the
; number specified by the interval. For some arithmetic operations the width of
; the result of combining two intervals is a function only of the widths of the
; argument intervals, whereas for others the width of the combination is not a
; function of the widths of the argument intervals. Show that the width of the
; sum (or difference) of two intervals is a function only of the widths of the
; intervals being added (or subtracted). Give examples to show that this is not
; true for multiplication or division.

(load "exercise_08.scm")

(define (width-interval x) (* 0.5 (- (upper-bound x) (lower-bound x))))

; (width-interval (add-interval x y))
; (width-interval (make-interval (+ (lower-bound x) (lower-bound y))
;                                (+ (upper-bound x) (upper-bound y))))
; (* 0.5 (- (+ (upper-bound x) (upper-bound y))
;           (+ (lower-bound x) (lower-bound y))))
; (* 0.5 (+ (- (upper-bound x) (lower-bound x))
;           (- (upper-bound y) (lower-bound y))))
; (* 0.5 (+ (width-interval x) (width-interval y)))
