(define a1
(if (procedure? add1)
(lambda (x) (num?-con (add1 (num?-con x))))
(blame val)))