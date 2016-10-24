(define (interp [expr : ExprC]) : Value
(interp/k expr mt-env
(lambda (ans)
ans)))