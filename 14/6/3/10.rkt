(define-syntax thread-1
(syntax-rules ()
[(thread (yielder) b ...)
(letrec ([thread-resumer (lambda (_)
(begin b ...
(finisher)))]
[finisher (lambda () (error 'finisher "nothing here"))]
[yielder (lambda () (error 'yielder "nothing here"))])
(lambda (sched-k)
(begin
(set! finisher
(lambda ()
(let/cc thread-k
(sched-k (Tdone)))))
(set! yielder
(lambda ()
(let/cc thread-k
(begin
(set! thread-resumer thread-k)
(sched-k (Tsuspended))))))
(thread-resumer 'tres))))]))