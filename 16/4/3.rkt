(define-syntax (define/contract stx)
(syntax-case stx (::)
[(_ (f (id :: c) ...) b)
(with-syntax ([(new-id ...) (generate-temporaries #'(id ...))])
#'(define f
(lambda (new-id ...)
(let ([id (guard c new-id)]
...)
b))))]))