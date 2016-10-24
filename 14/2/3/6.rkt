<cps-interp-lamC-case> ::=
[lamC (a b) (k (closV (lambda (arg-val dyn-k)
(interp/k b
(extend-env (bind a arg-val)
env)
dyn-k))))]