(define os-1
  (object/self-1
    [first (x) (msg self 'second (+ x 1))]
    [second (x) (+ x 1)]))