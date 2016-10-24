(if (or (behavior? 1) (behavior? seconds))
  (behavior (lambda () (+ (current-value 1) (current-value seconds))) 1 seconds)
  (+ 1 seconds))