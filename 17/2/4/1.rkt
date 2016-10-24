(if (or (behavior? x) (behavior? y))
  (behavior (lambda () (f (current-value x) (current-value y))) x y)
  (f x y))