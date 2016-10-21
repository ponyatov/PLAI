(define os-3
  (object/self-3
    [first (x) (msg self 'second (+ x 1))]
    [second (x) (+ x 1)]))