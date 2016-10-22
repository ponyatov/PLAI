<exprC> ::=
(define-type ExprC
  [numC (n : number)]				; number
  <idC-def>							; identifier
  <app-def>							; fn application
  [plusC (l : ExprC) (r: ExprC) ]	; (+ L R) 
  [multC (l : ExprC) (r: ExprC) ] ) ; (* L R)