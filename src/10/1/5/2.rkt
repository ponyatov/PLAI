(test (let ([o (o-state-1 5)])
  (begin (msg o 'inc)
    (msg o 'dec)
    (msg o 'get)))
  5)