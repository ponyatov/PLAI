(define-type ArithC							; algebraic type
	[numC  (n : number)]					; number
	[plusC (l : ArithC) (r : ArithC)]		; + <[l]eft> <[r]ight>
	[multC (l : ArithC) (r : ArithC)])		; - <[l]eft> <[r]ight>
