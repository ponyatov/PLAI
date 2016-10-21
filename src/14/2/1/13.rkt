<cps-macro-lam-case> ::=
[(_ (lam (a) b))
(identifier? #'a)
#'(lambda (k)
(k (lambda (a dyn-k)
((cps b) dyn-k))))]