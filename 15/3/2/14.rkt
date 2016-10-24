<unify/Omega> ::=
(define (unify/Omega [cs : (listof Constraints)] [Omega : Subst]) : Subst
(cond
[(empty? cs) Omega]
[(cons? cs)
(let ([l (eqCon-lhs (first cs))]
[r (eqCon-rhs (first cs))])
(type-case Term l
<unify/Omega-tVar-case>
<unify/Omega-tExp-case>
<unify/Omega-tNum-case>
<unify/Omega-tArrow-case>))]))