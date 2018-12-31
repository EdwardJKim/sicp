; Exercise 2.3: Implement a representation for rectangles in a plane. (Hint:
; You may want to make use of Exercise 2.2.) In terms of your constructors and
; selectors, create procedures that compute the perimeter and the area of a
; given rectangle. Now implement a different representation for rectangles. Can
; you design your system with suitable abstraction barriers, so that the same
; perimeter and area procedures will work using either representation?

(load "exercise_02.scm")

(define (make-rect top-left low-right)
  (cons top-left low-right))

(define (top-left rectangle)
  (car rectangle))

(define (low-right rectangle)
  (cdr rectangle))

(define (perimeter rectangle)
  (let ((ver-len (- (y-point (top-left rectangle))
                    (y-point (low-right rectangle))))
        (hor-len (- (x-point (low-right rectangle))
                    (x-point (top-left rectangle)))))
    (+ (* 2 ver-len) (* 2 hor-len))))

(define (area rectangle)
  (let ((ver-len (- (y-point (top-left rectangle))
                    (y-point (low-right rectangle))))
        (hor-len (- (x-point (low-right rectangle))
                    (x-point (top-left rectangle)))))
    (* ver-len hor-len)))
