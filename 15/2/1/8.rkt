<tc> ::=
  (define (tc [expr : TyExprC] [tenv : TyEnv]) : Type
    (type-case TyExprC expr
<tc-numC-case>
<tc-idC-case>
<tc-plusC-case>
<tc-multC-case>
<tc-appC-case>
<tc-lamC-case>))