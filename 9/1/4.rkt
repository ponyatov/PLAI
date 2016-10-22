(let ([b (box 'dummy)])
  (begin
    (set-box! b b)
    b))