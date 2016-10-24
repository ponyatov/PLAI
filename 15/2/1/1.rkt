(define-type TyExprC
[numC (n : number)]
[idC (s : symbol)]
[appC (fun : TyExprC) (arg : TyExprC)]
[plusC (l : TyExprC) (r : TyExprC)]
[multC (l : TyExprC) (r : TyExprC)]
[lamC (arg : symbol) (argT : Type) (retT : Type) (body : TyExprC)])