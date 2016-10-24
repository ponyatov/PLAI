(let ([id (lambda (x) x)])
  (if (id true)
    (id 5)
    (id 6)))