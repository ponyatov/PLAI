(define-poly (filter t)
(lambda ([f : (t -> boolean)] [l : (listof t)]) : (listof t)
(cond
[(empty? l) empty]
[(cons? l) (if (f (first l))
(cons (first l)
((filter t) f (rest l)))
((filter t) f (rest l)))])))