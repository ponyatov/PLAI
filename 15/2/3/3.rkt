<tc-lamC-case> ::=
[recC (f a aT rT b u)
(let ([extended-env
(extend-ty-env (bind f (funT aT rT)) tenv)])
(cond
[(not (equal? rT (tc b
(extend-ty-env
(bind a aT)
extended-env))))
(error 'tc "body return type not correct")]
[else (tc u extended-env)]))]