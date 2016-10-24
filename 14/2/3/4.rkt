(define-type Value
  [numV (n : number)]
  [closV (f : (Value (Value -> Value) -> Value))])