<constr-gen> ::=
(define (cg [e : ExprC]) : (listof Constraints)
(type-case ExprC e
<constr-gen-numC-case>
<constr-gen-idC-case>
<constr-gen-plusC/multC-case>
<constr-gen-appC-case>
<constr-gen-lamC-case>))