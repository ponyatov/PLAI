(define (mt/size parent-maker)
(let ([parent-object (parent-maker)]
[self 'dummy])
(begin
(set! self
(lambda (m)
(case m
[(size) (lambda () 0)]
[else (parent-object m)])))
self)))