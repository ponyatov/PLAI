(let ([b (box 0)])
  (unbox (begin (set-box! b 1)
    b)))