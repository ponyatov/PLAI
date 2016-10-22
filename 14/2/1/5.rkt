<cps-macro-rec-case> ::=
[(_ (rec (v f) b))
#'(cps (with (v (lam (arg) (error 'dummy "nothing")))
(seq
(set v f)
b)))]