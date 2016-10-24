<tc-take-1-idC-case> ::=
[idC (n) (if (lookup n tenv)
true
(error 'tc "not a bound identifier"))]