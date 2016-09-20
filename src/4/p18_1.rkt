[bminusS (l r)
	(plusC (desugar l)
	(multC (numC -1) (desugar r)))]