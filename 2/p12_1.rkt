(define-type ArithC                  ; algebraic type
  [numC  (n : number)]               ; number
  [plusC (l : ArithC) (r : ArithC)]  ; + <left> <right>
  [multC (l : ArithC) (r : ArithC)]) ; - <left> <right>
