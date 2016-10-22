(define o-self!
  (let ([self 'dummy])
    (begin
      (set! self
        (lambda (m)
          (case m
            [(first) (lambda (x) (msg self 'second (+ x 1)))]
            [(second) (lambda (x) (+ x 1))])))
      self)))