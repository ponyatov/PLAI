<seqC-case-take-1> ::=
  [seqC (b1 b2) (let ([v (interp b1 env)])
    (interp b2 env))]