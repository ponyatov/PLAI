(define-type Value
[numV (n : number)]
[closV (f : (Value -> Value))])
(define (interp [expr : ExprC] [env : Env]) : Value
(type-case ExprC expr
[numC (n) (numV n)]
[idC (n) (lookup n env)]
[appC (f a) (local ([define f-value (interp f env)]
[define a-value (interp a env)])
((closV-f f-value) a-value))]
[plusC (l r) (num+ (interp l env) (interp r env))]
[multC (l r) (num* (interp l env) (interp r env))]
[lamC (a b) (closV (lambda (arg-val)
(interp b
(extend-env (bind a arg-val)
env))))]))