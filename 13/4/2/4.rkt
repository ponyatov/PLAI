(define-syntax (my-or-4 x)
(syntax-case x ()
[(my-or-4)
#'#f]
[(my-or-4 e)
#'e]
[(my-or-4 e0 e1 ...)
#'(let ([v e0])
(if v
v
(my-or-4 e1 ...)))]))