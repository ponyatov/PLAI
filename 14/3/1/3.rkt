(generator (y) (from)
(rec (f (lam (n)
(seq
((yield-helper y) n)
(f (+ n 1)))))
(f from)))