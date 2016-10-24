(define-poly (filter2 t)
(letrec ([fltr
(lambda ([f : (t -> boolean)] [l : (listof t)]) : (listof t)
(cond
[(empty? l) empty]
[(cons? l) (if (f (first l))
(cons (first l) (fltr f (rest l)))
(fltr f (rest l)))]))])
fltr))