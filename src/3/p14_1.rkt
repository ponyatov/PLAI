(define (interp [a : ArithC]) : number
	(type-case ArithC a
		[numC (n) n]
		[plusC (l r) ...]
		[multC (l r) ...]))