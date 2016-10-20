(test (let ([o (o-static-1 1000)])
  (msg o 'count))
    1)

(test (let ([o (o-static-1 0)])
  (msg o 'count))
    2)