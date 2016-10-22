<cps-macro-seq-case> ::=
[(_ (seq e1 e2))
#'(lambda (k)
((cps e1) (lambda (_)
((cps e2) k))))]