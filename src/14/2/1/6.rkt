<cps-macro-set-case> ::=
[(_ (set v e))
#'(lambda (k)
((cps e) (lambda (ev)
(k (set! v ev)))))]