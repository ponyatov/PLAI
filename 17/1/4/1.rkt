<lazy-interp> ::=
(define (interp [expr : ExprC] [env : Env]) : Value
(type-case ExprC expr
<lazy-numC-case>
<lazy-idC-case>
<lazy-plusC/multC-case>
<lazy-appC-case>
<lazy-lamC-case>))