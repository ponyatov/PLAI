<ms-boxC-case> ::=
  [boxC (a) (type-case Result (interp a env sto)
    [v*s (v-a s-a)
      (let ([where (new-loc)])
        (v*s (boxV where)
          (override-store (cell where v-a)
            s-a)))])]