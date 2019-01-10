; Figure 2.14: The recursive operations right-split and corner-split applied to
; the painters wave and rogers. Combining four corner-split figures produces
; symmetric square-limit designs as shown in Figure 2.9.

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
