; Exercise 2.2: Consider the problem of representing line segments in a plane.
; Each segment is represented as a pair of points: a starting point and an
; ending point. Define a constructor make-segment and selectors start-segment
; and end-segment that define the representation of segments in terms of
; points. Furthermore, a point can be represented as a pair of numbers: the x
; coordinate and the y coordinate. Accordingly, specify a constructor
; make-point and selectors x-point and y-point that define this representation.
; Finally, using your selectors and constructors, define a procedure
; midpoint-segment that takes a line segment as argument and returns its
; midpoint (the point whose coordinates are the average of the coordinates of
; the endpoints). To try your procedures, you’ll need a way to print points:

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment segment)

  (define (average x y) (* 0.5 (+ x y)))

  (let ((x0 (x-point (start-segment segment)))
        (y0 (y-point (start-segment segment)))
        (x1 (x-point (end-segment segment)))
        (y1 (y-point (end-segment segment))))
    (make-point (average x0 x1) (average y0 y1))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define segment (make-segment (make-point 0 0) (make-point 10 10)))

(print-point (midpoint-segment segment))
