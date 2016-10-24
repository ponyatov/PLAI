(define-syntax thread-0
(syntax-rules ()
[(thread (yielder) b ...)
(letrec ([thread-resumer (lambda (_)
(begin b ...))]
[yielder (lambda () (error 'yielder "nothing here"))])
(lambda (sched-k)
(begin
(set! yielder
(lambda ()
(let/cc thread-k
(begin
(set! thread-resumer thread-k)
(sched-k 'dummy)))))
(thread-resumer 'tres))))]))