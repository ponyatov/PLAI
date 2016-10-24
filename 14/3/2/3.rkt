<generator-core> ::=
(lambda (v dyn-k)
(begin
(set! where-to-go dyn-k)
(resumer v)))