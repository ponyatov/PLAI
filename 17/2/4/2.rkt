(if (or (behavior? 3) (behavior? 4))
  (behavior (lambda () (+ (current-value 3) (current-value 4))) 3 4)
  (+ 3 4))