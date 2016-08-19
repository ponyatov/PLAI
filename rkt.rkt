#lang plai-typed

(define-type ArithC ; base algebraic type 
  [numC  (n : number) ] ; number
  [plusC (l : ArithC) (r : ArithC) ] ; + operator
  [minusC (l : ArithC) (r : ArithC) ] ; - operator
  [multC (l : ArithC) (r : ArithC) ] ; * operator
  [divC (l : ArithC) (r : ArithC) ] ; / operator
  )

(define (parse [s : s-expression]) : ArithC ; type-setting parser
  (cond
    [(s-exp-number? s) (numC (s-exp->number s))]
    [(s-exp-list? s)
     (let ([sl (s-exp->list s)])
       (case (s-exp->symbol (first sl))
         [(+) (plusC (parse (second sl)) (parse (third sl)))]
         [(-) (minusC (parse (second sl)) (parse (third sl)))]
         [(*) (multC (parse (second sl)) (parse (third sl)))]
         [(/) (divC (parse (second sl)) (parse (third sl)))]
         [else (error 'parse "invalid list input")]))]
    [else (error 'parse "invalid input")])
  )

(parse '(+ 23 (- 5 6)) )

