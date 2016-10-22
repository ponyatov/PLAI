<interp-take-1> ::=
  (define (interp [expr : ExprC] [env : Env]) : Value
    (type-case ExprC expr
      [numC (n) (numV n)]
      [idC (n) (lookup n env)]
[appC (f a) (local ([define f-value (interp f env)])
(interp (closV-body f-value)
(extend-env (bind (closV-arg f-value)
(interp a env))
(closV-env f-value))))]
[plusC (l r) (num+ (interp l env) (interp r env))]
[multC (l r) (num* (interp l env) (interp r env))]
[lamC (a b) (closV a b env)]
<boxC-case>
<unboxC-case>
<setboxC-case>
<seqC-case>))      