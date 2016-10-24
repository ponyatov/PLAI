<tc-multC-case> ::=
[multC (l r) (let ([lt (tc l tenv)]
[rt (tc r tenv)])
(if (and (equal? lt (numT))
(equal? rt (numT)))
(numT)
(error 'tc "* not both numbers")))]