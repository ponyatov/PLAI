<interp-mut-struct> ::=
(define (interp [expr : ExprC] [env : Env] [sto : Store]) : Result
<ms-numC-case>
<ms-idC-case>
<ms-appC-case>
<ms-plusC/multC-case>
<ms-lamC-case>
<ms-boxC-case>
<ms-unboxC-case>
<ms-setboxC-case>
<ms-seqC-case>)