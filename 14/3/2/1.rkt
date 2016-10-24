<cps-macro-generator-case> ::=
[(_ (generator (yield) (v) b))
(and (identifier? #'v) (identifier? #'yield))
<generator-body>]