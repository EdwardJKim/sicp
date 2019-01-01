; Exercise 2.11: In passing, Ben also cryptically comments: “By testing the
; signs of the endpoints of the intervals, it is possible to break mul-interval
; into nine cases, only one of which requires more than two multiplications.”
; Rewrite this procedure using Ben’s suggestion.

(load "exercise_10.scm")

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound x)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (mul-interval x y)
  (let ((x0 (lower-bound x))
        (x1 (upper-bound x))
        (y0 (lower-bound y))
        (y1 (upper-bound y)))
    (cond ((and (>= x0 0) (>= x1 0) (>= y0 0) (>= y1 0))
             (make-interval (* x0 y0) (* x1 y1)))
          ((and (>= x0 0) (>= x1 0) (< y0 0) (>= y1 0))
             (make-interval (* x1 y0) (* x1 y1)))
          ((and (>= x0 0) (>= x1 0) (< y0 0) (< y1 0))
             (make-interval (* x1 y0) (* x0 y1)))
          ((and (< x0 0) (>= x1 0) (>= y0 0) (>= y1 0))
             (make-interval (* x0 y1) (* x1 y1)))
          ((and (< x0 0) (>= x1 0) (< y0 0) (>= y1 0))
             (make-interval (min (* x0 y1) (* x1 y0))
                            (max (* x0 y0) (* x1 y1))))
          ((and (< x0 0) (>= x1 0) (< y0 0) (< y1 0))
             (make-interval (* x1 y0) (* x0 y0)))
          ((and (< x0 0) (< x1 0) (>= y0 0) (>= y1 0))
             (make-interval (* x0 y1) (* x1 y0)))
          ((and (< x0 0) (< x1 0) (< y0 0) (>= y1 0))
             (make-interval (* x0 y1) (* x0 y0)))
          ((and (< x0 0) (< x1 0) (< y0 0) (< y1 0))
             (make-interval (* x1 y1) (* x0 y0))))))
