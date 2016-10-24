(define-syntax let/cc
  (syntax-rules ()
    [(let/cc k b)
      (call/cc (lambda (k) b))]))