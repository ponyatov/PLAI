(define-syntax (object/self-3 x)
  (syntax-case x ()
    [(object [mtd-name (var) val] ...)
      (with-syntax ([self (datum->syntax x 'self)])
      
     #'(let ([self (lambda (msg-name)
(lambda (v) (error 'object "nothing here")))])
(begin
(set! self
(lambda (msg-name)
(case msg-name
[(mtd-name) (lambda (var) val)]
...)))
self)))]))