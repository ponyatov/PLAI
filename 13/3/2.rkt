<sc-macro-eg-guarded-rule> ::=
  [(my-let-3 (var val) body)
    (identifier? #'var)
    #'((lambda (var) body) val)]