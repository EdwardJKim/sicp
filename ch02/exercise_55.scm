; Exercise 2.55: Eva Lu Ator types to the interpreter the expression

(car ''abracadabra)

; To her surprise, the interpreter prints back quote. Explain.

(car ''abracadabra)
(car (quote 'abracadabra))
(car (quote abracadabra))
; quote
