<tc-lamC-case> ::=
[lamC (a argT retT b)
(if (equal? (tc b (extend-ty-env (bind a argT) tenv)) retT)
(funT argT retT)
(error 'tc "lam type mismatch"))]