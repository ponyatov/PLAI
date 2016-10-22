<plus/mult-case> ::=
  [plusC (l r) (num+ (interp l env) (interp r env))]
  [multC (l r) (num* (interp l env) (interp r env))]