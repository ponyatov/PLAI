(define-syntax thread-0
(syntax-rules ()
[(thread (yielder) b ...)
(letrec ([thread-resumer (lambda (_)
(begin b ...))])
(lambda (sched-k)
(thread-resumer 'dummy)))]))