(define-syntax (my-or-2 x)
(syntax-case x ()
[(my-or-2)
#'#f]
[(my-or-2 e0 e1 ...)
#'(if e0
e0
(my-or-2 e1 ...))]))