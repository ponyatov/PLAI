[(_ (cont-lambda (a) b))
(identifier? #'a)
#'(lambda (k)
(k (lambda (a dyn-k)
((cps b) k))))]