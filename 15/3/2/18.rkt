<unify/Omega-tArrow-case> ::=
[tArrow (d r) (type-case Term r
[tArrow (d2 r2)
(unify/Omega (cons (eqCon d d2)
(cons (eqCon r r2)
cs))
Omega)]
[else (error 'unify "arrow and something else")])]