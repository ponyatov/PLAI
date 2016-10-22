<cps-macro-lam-case-take-1> ::=
[(_ (lam (a) b))
(identifier? #'a)
#'(lambda (k)
(k (lambda (a dyn-k)
((cps b) ...))))]