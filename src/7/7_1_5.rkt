<answer-type-take-1> ::=
  (define-type Value
    [numV (n : number)]
    [funV (name : symbol) (arg : symbol) (body : ExprC)])