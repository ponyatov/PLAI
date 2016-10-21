(define cookie '-100)

(read-number/suspend "First number"
(lambda (v1)
(begin
(set! cookie v1)
(read-number/suspend "Second number"
(lambda (v2)
(display
(+ cookie v2)))))))