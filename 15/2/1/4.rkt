<tc-take-1> ::=
(define (tc [expr : TyExprC] [tenv : TyEnv]) : boolean
(type-case TyExprC expr
<tc-take-1-numC-case>
<tc-take-1-idC-case>
<tc-take-1-appC-case>))
