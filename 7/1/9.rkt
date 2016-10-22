(define (num+ [l : Value] [r : Value]) : Value
  (cond
      [(and (numV? l) (numV? r))
        (numV (+ (numV-n l) (numV-n r)))]
    [else
      (error 'num+ "one argument was not a number")]))