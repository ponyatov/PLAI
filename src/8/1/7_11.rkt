<ms-setboxC-case> ::=
[setboxC (b v) (type-case Result (interp b env sto)
[v*s (v-b s-b)
(type-case Result (interp v env s-b)
[v*s (v-v s-v)
(v*s v-v
(override-store (cell (boxV-l v-b)
v-v)
s-v))])])]