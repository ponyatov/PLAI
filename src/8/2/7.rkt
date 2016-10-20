<setC-case> ::=
  [setC (var val) (type-case Result (interp val env sto)
    [v*s (v-val s-val)
      <rest-of-setC-case>])]