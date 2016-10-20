[plusC (l r) (type-case Result (interp r env sto)
  [v*s (v-r s-r)
    (type-case Result (interp l env s-r)
      [v*s (v-l s-l)
        (v*s (num+ v-l v-r) s-l)])])]