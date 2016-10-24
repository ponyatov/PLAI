(define g2 (generator (yield) (v)
(letrec ([loop (lambda (n)
(loop (+ (yield n) n)))])
(loop v))))