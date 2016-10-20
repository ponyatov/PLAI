<ms-plusC/multC-case> ::=
  [plusC (l r) (type-case Result (interp l env sto)
    [v*s (v-l s-l)
      (type-case Result (interp r env s-l)
        [v*s (v-r s-r)
          (v*s (num+ v-l v-r) s-r)])])]