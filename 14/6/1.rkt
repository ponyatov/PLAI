<cps-macro-let/cc-case> ::= continuation”
[(_ (let/cc kont b))
(identifier? #'kont)
#'(lambda (k)
(let ([kont (lambda (v dyn-k)
(k v))])
((cps b) k)))]