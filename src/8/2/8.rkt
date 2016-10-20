<rest-of-setC-case> ::=
  (let ([where (lookup var env)])
    (v*s v-val
      (override-store (cell where v-val)
        s-val)))