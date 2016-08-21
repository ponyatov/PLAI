#lang plai-typed

(define-type ArithC ; base algebraic type 
  [numC  (n : number) ] ; number
  [plusC (l : ArithC) (r : ArithC) ] ; + operator
  [multC (l : ArithC) (r : ArithC) ] ; * operator
  )

(define (parse [s : s-expression]) : ArithC ; type-setting parser
  (cond
    [(s-exp-number? s) (numC (s-exp->number s))]
    [(s-exp-list? s)
     (let ([sl (s-exp->list s)])
       (case (s-exp->symbol (first sl))
         [(+) (plusC (parse (second sl)) (parse (third sl)))]
         [(*) (multC (parse (second sl)) (parse (third sl)))]
         [else (error 'parse "invalid list input")]))]
    [else (error 'parse "invalid input")])
  )

(test
 (parse '(+ 2 (* 2 3)) )
 (plusC (numC 2) (multC (numC 2) (numC 3)))
 )

