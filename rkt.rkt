#lang plai-typed

;;; 2. [C]ore language

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

;;; 3. [interp]reter

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

;;; 4. de[s]ugaring

(define-type ArithS ; de[s]ugaring type set
  [numS  (n : number) ] ; number
  [plusS (l : ArithS) (r : ArithS) ] ; + operator
  [bminusS (l : ArithS) (r : ArithS) ] ; - operator
  [uminusS (e : ArithS) ] ; unary - operator
  [multS (l : ArithS) (r : ArithS) ] ; * operator
  )

(define (desugar [as : ArithS]) : ArithC
  (type-case ArithS as
    [numS (n) (numC n)]
    [plusS (l r) (plusC (desugar l)(desugar r))]
    [multS (l r) (multC (desugar l)(desugar r))]
    [bminusS (l r) (plusC
                    (desugar l)
                    (multC (numC -1)
                           (desugar r) )
                    )]
    [uminusS (e) (desugar (bminusS (numS 0) e ))]
    )
  )

(test
 (desugar (numS -1))
 (numC -1)
 )

(test
 (desugar (multS (numS 2) (bminusS (numS 3)(numS 4))))
 (multC (numC 2) (plusC (numC 3) (multC (numC -1) (numC 4))))
 )

