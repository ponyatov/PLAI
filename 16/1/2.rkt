(define non-neg?-contract
(make-contract
(lambda (n) (and (number? n)
(>= n 0)))))