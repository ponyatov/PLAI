(define new-loc
  (let ([n (box 0)])
    (lambda ()
      (begin
      (set-box! n (add1 (unbox n)))
      (unbox n)))))    