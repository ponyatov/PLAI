(define-type-alias Subst (listof Substitution))
(define-type Substitution
[sub [var : Term] [is : Term]])
(define (unify [cs : (listof Constraints)]) : Subst
(unify/Omega cs empty))