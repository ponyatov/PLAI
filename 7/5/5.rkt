(define (double x) (+ x x))
(define (quadruple x) (double (double x)))
(quadruple 10)