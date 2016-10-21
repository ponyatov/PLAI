(define-syntax object/self-1
(syntax-rules ()
[(object [mtd-name (var) val] ...)
(let ([self (lambda (msg-name)
(lambda (v) (error 'object "nothing here")))])
(begin
(set! self
(lambda (msg)
(case msg
[(mtd-name) (lambda (var) val)]
...)))
self))]))