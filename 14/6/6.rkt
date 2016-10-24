(test (run (cps (+ 1 (let/cc esc (+ 2 (esc 3))))))
4)