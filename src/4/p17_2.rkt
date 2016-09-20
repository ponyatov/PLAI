(define (desugar [as : ArithS]) : ArithC
	(type-case ArithS as
		[numS (n) (numC n)]
		[plusS (l r) (plusC (desugar l)
		(desugar r))]
		[multS (l r) (multC (desugar l)
		(desugar r))]
		; <bminusS-case>))