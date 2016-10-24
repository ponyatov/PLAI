(define d display) ;; a useful shorthand in what follows
  (scheduler-loop-0
    (list
      (thread-0 (y) (d "t1-1 ") (y) (d "t1-2 ") (y) (d "t1-3 "))
      (thread-0 (y) (d "t2-1 ") (y) (d "t2-2 ") (y) (d "t2-3 "))
      (thread-0 (y) (d "t3-1 ") (y) (d "t3-2 ") (y) (d "t3-3 "))))