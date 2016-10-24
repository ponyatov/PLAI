<cps-interp-appC-case> ::=
[appC (f a) (interp/k f env
(lambda (fv)
(interp/k a env
(lambda (av)
((closV-f fv) av k)))))]