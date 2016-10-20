[unboxC (a) (type-case Result (interp a env sto)
  [v*s (v-a s-a)
    (v*s (fetch (boxV-l v-a) s-a) sto)])]