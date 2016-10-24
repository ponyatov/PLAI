<cps-interp-plusC-case> ::=
[plusC (l r) (interp/k l env
(lambda (lv)
(interp/k r env
(lambda (rv)
(k (num+ lv rv))))))]