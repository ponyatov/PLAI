<ms-appC-case-main> ::=
(let ([where (new-loc)])
(interp (closV-body v-f)
(extend-env (bind (closV-arg v-f)
where)
(closV-env v-f))
(override-store (cell where v-a) s-a)))