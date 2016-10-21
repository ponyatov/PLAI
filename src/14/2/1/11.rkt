<cps-macro-app-2-case> ::=
[(_ (f a b))
#'(lambda (k)
((cps a) (lambda (av)
((cps b) (lambda (bv)
(k (f av bv)))))))]