<generator-value> ::=
(let ([where-to-go (lambda (v) (error 'where-to-go "nothing"))])
(letrec([resumer (lambda (v)
((cps b) (lambda (k)
(error 'generator "fell through"))))]
[yield (lambda (v gen-k)
(begin
(set! resumer gen-k)
(where-to-go v)))])
<generator-core>))