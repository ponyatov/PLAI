(define (parse [s : s-expression]) : ArithC 
  (cond
    [(s-exp-number? s) ; if s-number
      (numC (s-exp->number s))] ; return numC(number)
    [(s-exp-list? s) ; if composite structure
      (let ([sl (s-exp->list s)]) ; local listed sl
        (case (s-exp->symbol (first sl)) ; <operator>
          [(+) (plusC
              (parse (second sl)) (parse (third sl)))]
          [(*) (multC
              (parse (second sl)) (parse (third sl)))]
          [else
            (error 'parse "invalid list input")]
        ))]
    [else (error 'parse "invalid input")]))
