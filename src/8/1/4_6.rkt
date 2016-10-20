<seqC-case-take-2> ::=
  [seqC (b1 b2) (begin
    (interp b1 env)
    (interp b2 env))]