(define (resume [g : label] [n : number])
  ((some-v (hash-ref table g)) n))