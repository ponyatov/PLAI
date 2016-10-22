> '+
- symbol
'+
> (define L '(+ 1 2))
> L
- s-expression
'(+ 1 2)
> (first L)
. typecheck failed: (listof '_a) vs s-expression in:
  first
  L
  (quote (+ 1 2))
  L
  first
> (define f (first (s-exp->list L)))
> f
- s-expression
'+