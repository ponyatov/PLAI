(define (mapper f l)
(cond
[(empty? l) empty]
[(cons? l) (cons (f (first l)) (mapper f (rest l)))]))