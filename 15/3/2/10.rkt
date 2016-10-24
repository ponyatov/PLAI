<constr-gen-plusC/multC-case> ::=
[plusC (l r) (append3 (cg l)
(cg r)
(list (eqCon (tExp l) (tNum))
(eqCon (tExp r) (tNum))
(eqCon (tExp e) (tNum))))]