(define-type Constraints
[eqCon (lhs : Term) (rhs : Term)])

(define-type Term
[tExp (e : ExprC)]
[tVar (s : symbol)]
[tNum]
[tArrow (dom : Term) (rng : Term)])