[(_ (f a))
#'(lambda (k)
((cps f) (lambda (fv)
((cps a) (lambda (av)
(fv av k))))))]