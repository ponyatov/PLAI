(define (interp [a : ArithC]) : number
	(type-case ArithC a
		[numC (n) n]
		[plusC (l r) ... (interp l) ... (interp r) ...]
		[multC (l r) ... (interp l) ... (interp r) ...]))