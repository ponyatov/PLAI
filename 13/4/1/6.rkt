(define-syntax (my-or-3 x)
(syntax-case x ()
[(my-or-3)
#'#f]
[(my-or-3 e)
#'e]
[(my-or-3 e0 e1 ...)
#'(if e0
e0
(my-or-3 e1 ...))]))
