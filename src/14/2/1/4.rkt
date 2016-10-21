<cps-macro-with-case> ::=
[(_ (with (v e) b))
#'(cps ((lam (v) b) e))]