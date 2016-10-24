<tc-appC-case> ::=
[appC (f a) (let ([ft (tc f tenv)]
[at (tc a tenv)])
(cond
[(not (funT? ft))
(error 'tc "not a function")]
[(not (equal? (funT-arg ft) at))
(error 'tc "app arg mismatch")]
[else (funT-ret ft)]))]