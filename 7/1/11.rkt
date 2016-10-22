<app-case-take-1> ::=
	[appC (f a) (local ([define fd f])
		(interp (fdC-body fd)
			(extend-env (bind (fdC-arg fd)
					(interp a env))
				mt-env)))]