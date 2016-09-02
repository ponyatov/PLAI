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

;;; 5. Functions  p.21

(define-type ExprC
  [numZ   (n : number) ]
  [plusZ  (l : ExprC) (r : ExprC)]
  [multZ (l : ExprC) (r : ExprC)]
  [idC ( s : symbol) ] ; identifier
  [appC (fun : symbol) (arg : ExprC) ] ; function application
  )

'(define (double x) (+ x x)) ; is equal to
; '(define (quadruple x) (double (double x)))
; '(define (const5 _) 5)
'(fdC 'double 'x '(plusC (idC 'x) (idC 'x)))

(define-type FunDefC ; function defiinition required for interpfn definition
  [fdC
   (name : symbol) ; function name
   (arg : symbol) ; argument (single: scalar or composite)
   (body : ExprC) ; _executable_ function body
   ]
  )

(define (interpfn [e : ExprC] [fds : (listof FunDefC)] ) : number ; $5.2
  (type-case ExprC e
    [numZ (n) n]
    [plusZ (l r) (+ (interpfn l fds) (interpfn r fds))]
    [multZ (l r) (* (interpfn l fds) (interpfn r fds))]
    [idC (id) 0]
    [appC (a b) 0]
    )
  )

; get-fundef : symbol * (listof FunDefC) -> FunDefC ; p.22 function body search

; p.23 $5.3 Substitution

(define (subst [what : ExprC] [for : symbol] [in : ExprC] ) : ExprC
  (type-case ExprC in
    [numZ (n) in] ; numbers not substitutable so stays itself
    [idC (s) (cond ; replace id
               [(symbol=? s for) what] ; by what if for is symbol
               [else in])] ; or for is function name so leave it unsubsted
    [appC (f a) (appC f (subst what for a))]
    [plusZ (l r) (plusZ (subst what for l) (subst what for r))]
    [multZ (l r) (multZ (subst what for l) (subst what for r))]
  )
)

; p.23 $5.4
