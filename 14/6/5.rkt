(test (run (cps (let/cc esc (+ 2 (esc 3)))))
  3)