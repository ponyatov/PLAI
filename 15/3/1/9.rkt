(define-syntax define-poly
(syntax-rules ()
[(_ (name tyvar) body)
(define-syntax (name stx)
(syntax-case stx ()
[(_ type)
(with-syntax ([tyvar #'type])
#'body)]))]))