(define (node/size parent-maker v l r)
(let ([parent-object (parent-maker v l r)]
[self 'dummy])
(begin
(set! self
(lambda (m)
(case m
[(size) (lambda () (+ 1
(msg l 'size)
(msg r 'size)))]
[else (parent-object m)])))
self)))