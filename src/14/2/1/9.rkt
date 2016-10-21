<cps-macro-app-1-case-take-1> ::=
[(_ (f a))
#'(lambda (k)
((cps f) (lambda (fv)
((cps a) (lambda (av)
(k (fv av)))))))]