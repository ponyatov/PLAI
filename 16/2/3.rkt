(define list-of-even?-contract
(make-contract
(lambda (l)
(and (list? l) (andmap number? l) (andmap even? l)))))