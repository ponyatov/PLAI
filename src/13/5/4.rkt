(define-syntax object/self-2
(syntax-rules ()
[(object self [mtd-name (var) val] ...)
(let ([self (lambda (msg-name)
(lambda (v) (error 'object "nothing here")))])
(begin
(set! self
(lambda (msg)
(case msg
[(mtd-name) (lambda (var) val)]
...)))
self))]))