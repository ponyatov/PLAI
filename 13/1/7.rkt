(define-syntax my-let-2
  (syntax-rules ()
    [(my-let-2 ([var val] ...) body)
      ((lambda (var ...) body) val ...)]))