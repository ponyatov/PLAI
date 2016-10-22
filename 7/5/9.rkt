(let ([loop-forever (lambda (x) (loop-forever x))])
  (loop-forever 10))