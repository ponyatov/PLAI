(define num?-con (immediate number?))
= (define num?-con
(lambda (val)
(if (number? val) val (blame val))))