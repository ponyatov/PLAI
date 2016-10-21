<cps-macro-atomic-case> ::=
[(_ atomic)
#'(lambda (k)
(k atomic))]