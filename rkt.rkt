#lang plai-typed

;;; [C]ore language

(define-type ArithC ; [c]ore language type set
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
 (parse '(+ 1 (* 2 3)) )
 (plusC (numC 1) (multC (numC 2) (numC 3)))
 )

;;; [interp]reter

(define (interp [a : ArithC]) : number
  (type-case ArithC a
    [numC (n) n]
    [plusC (l r) (+ (interp l) (interp r))]
    [multC (l r) (* (interp l) (interp r))]
    )
  )

(test
 (interp (parse '(+ 1 (* 2 3)) ) )
 7
 )