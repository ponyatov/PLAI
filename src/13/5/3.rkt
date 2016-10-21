(define os-2
  (object/self-2 self
    [first (x) (msg self 'second (+ x 1))]
    [second (x) (+ x 1)]))