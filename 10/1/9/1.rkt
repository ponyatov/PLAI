(define (mt)
(let ([self 'dummy])
(begin
(set! self
(lambda (m)
(case m
[(add) (lambda () 0)])))
self)))
(define (node v l r)
(let ([self 'dummy])
(begin
(set! self
(lambda (m)
(case m
[(add) (lambda () (+ v
(msg l 'add)
(msg r 'add)))])))
self)))