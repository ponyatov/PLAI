(let ([b (box 0)])
  (begin (begin (set-box! b (+ 1 (unbox b)))
      (set-box! b (+ 1 (unbox b))))
    (unbox b)))