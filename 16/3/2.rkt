(define (immediate pred?)
  (lambda (val)
    (if (pred? val) val (blame val))))