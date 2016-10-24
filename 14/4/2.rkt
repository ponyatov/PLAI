[(_ (cnd tst thn els))
#'(lambda (k)
((cps tst) (lambda (tstv)
(if tstv
((cps thn) k)
((cps els) k)))))]