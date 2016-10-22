<interp-hof> ::=
  (define (interp [expr : ExprC] [env : Env]) : Value
    (type-case ExprC expr
    <interp-body-hof>))