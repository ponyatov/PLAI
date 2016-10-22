(test (let ([o1 (o-state-1 3)]
    [o2 (o-state-1 3)])
  (begin (msg o1 'inc)
    (msg o1 'inc)
    (+ (msg o1 'get)
       (msg o2 'get))))
  (+ 5 3))