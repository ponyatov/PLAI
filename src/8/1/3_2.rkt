(define new-loc-broken
  (lambda ()
    (let ([n (box 0)])
    (begin
      (set-box! n (add1 (unbox n)))
      (unbox n)))))