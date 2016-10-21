<cps-macro-app-1-case> ::=
[(_ (f a))
#'(lambda (k)
((cps f) (lambda (fv)
((cps a) (lambda (av)
(fv av k))))))]