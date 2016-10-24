<lazy-appC-case> ::=
[appC (f a) (local ([define f-value (strict (interp f env))])
(interp (closV-body f-value)
(extend-env (bind (closV-arg f-value)
(suspendV a env))
(closV-env f-value))))]