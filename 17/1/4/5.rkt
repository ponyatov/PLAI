<lazy-plusC/multC-case> ::=
[plusC (l r) (num+ (strict (interp l env))
(strict (interp r env)))]
[multC (l r) (num* (strict (interp l env))
(strict (interp r env)))]