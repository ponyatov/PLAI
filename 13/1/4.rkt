(define-syntax my-let-1
  (syntax-rules ()
    [(my-let-1 (var val) body)
      ((lambda (var) body) val)]))