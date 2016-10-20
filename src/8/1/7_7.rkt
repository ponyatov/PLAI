<ms-seqC-case> ::=
  [seqC (b1 b2) (type-case Result (interp b1 env sto)
    [v*s (v-b1 s-b1)
      (interp b2 env s-b1)])]