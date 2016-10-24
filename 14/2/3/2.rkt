<cps-interp-body> ::=
(type-case ExprC expr
[numC (n) (k (numV n))]
[idC (n) (k (lookup n env))]
<cps-interp-plusC-case>
<cps-interp-appC-case>
<cps-interp-lamC-case>)