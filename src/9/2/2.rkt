(let ([fact (box 'dummy)])
  (let ([fact-fun
    (lambda (n)
    (if (zero? n)
    1
    (* n ((unbox fact) (- n 1)))))])
  (begin
    (set-box! fact fact-fun)
    ((unbox fact) 10))))