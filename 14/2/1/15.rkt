<cps-macro-read-number-case> ::=
[(_ (read-number prompt))
#'(lambda (k)
((cps prompt) (lambda (pv)
(read-number/suspend pv k))))]