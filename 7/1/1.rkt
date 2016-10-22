<expr-type> ::=
  (define-type ExprC
    [numC (n : number)]
    [idC (s : symbol)]
    <app-type>
    [plusC (l : ExprC) (r : ExprC)]
    [multC (l : ExprC) (r : ExprC)]
    <fun-type>)