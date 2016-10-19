<answer-type> ::=
  (define-type Value
    [numV (n : number)]
    [closV (arg : symbol) (body : ExprC) (env : Env)])