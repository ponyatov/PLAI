<sc-macro-eg-rule> ::=
  [(my-let-3 (var val) body)
    #'((lambda (var) body) val)]