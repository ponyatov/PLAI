<cps-macro-display-case> ::=
[(_ (display output))
#'(lambda (k)
((cps output) (lambda (ov)
(k (display ov)))))]