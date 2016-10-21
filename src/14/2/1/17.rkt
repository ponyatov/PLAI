(test (run (cps 3)) 3)
(test (run (cps ((lam () 5) ))) 5)
(test (run (cps ((lam (x) (* x x)) 5))) 25)
(test (run (cps (+ 5 ((lam (x) (* x x)) 5)))) 30)