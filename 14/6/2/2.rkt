(define g1 (generator (yield) (v)
(letrec ([loop (lambda (n)
(begin
(yield n)
(loop (+ n 1))))])
(loop v))))