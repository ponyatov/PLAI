(define a1
((lambda (val)
(if (procedure? val)
(lambda (x) (num?-con (val (num?-con x))))
(blame val)))
add1))