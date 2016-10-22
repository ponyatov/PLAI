(let ([quadruple (lambda (x) (double (double x)))])
  (let ([double (lambda (x) (+ x x))])
    (quadruple 10)))