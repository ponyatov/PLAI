(good
  (parse '(+ (* 1 2) (+ 2 3)))
  (plusC (multC (numC 1) (numC 2))
    (plusC (numC 2) (numC 3)))
  (plusC (multC (numC 1) (numC 2))
    (plusC (numC 2) (numC 3)))
  "at line 26")