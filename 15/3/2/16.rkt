<unify/Omega-tExp-case> ::=
[tExp (e) (type-case (optionof Term) (lookup l Omega)
[some (bound)
(unify/Omega (cons (eqCon bound r)
(rest cs))
Omega)]
[none ()
(unify/Omega (rest cs)
(extend+replace l r Omega))])]