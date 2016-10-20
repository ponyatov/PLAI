<ms-appC-case> ::=
[appC (f a)
(type-case Result (interp f env sto)
[v*s (v-f s-f)
(type-case Result (interp a env s-f)
[v*s (v-a s-a)
<ms-appC-case-main>])])]