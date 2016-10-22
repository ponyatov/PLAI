(define-syntax (my-or-1 x)
  (syntax-case x ()
    [(my-or-1 e0 e1 ...)
      #'(if e0
      e0
      (my-or-1 e1 ...))]))