(generator (y) (from)
(rec (f (lam (n)
(seq
(y n)
(f (+ n 1)))))
(f from)))