<app-case> ::=
  [appC (f a) (local ([define f-value (interp f env)])
    (interp (closV-body f-value)
    (extend-env (bind (closV-arg f-value)
      (interp a env))
    (closV-env f-value))))]