(generator (yield) (from)
(rec (f (lam (n)
(seq
(yield n)
(f (+ n 1)))))
(f from)))