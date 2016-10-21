(define (read-number [prompt : string]) : number
  (begin
    (display prompt)
      (let ([v (read)])
        (if (s-exp-number? v)
          (s-exp->number v)
          (read-number prompt)))))