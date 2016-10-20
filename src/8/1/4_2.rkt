<value-take-1> ::=
(define-type Value
[numV (n : number)]
[closV (arg : symbol) (body : ExprC) (env : Env)]
[boxV (v : Value)])