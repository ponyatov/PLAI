<app-case-take-2> ::=
[appC (f a) (local ([define fd (interp f env)])
(interp (funV-body fd)
(extend-env (bind (funV-arg fd)
(interp a env))
mt-env)))]