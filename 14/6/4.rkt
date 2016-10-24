(test (run (cps (+ 1 (let/cc esc (esc 3)))))
  4)