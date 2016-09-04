#lang plai
;; -typed

; p.21 $5. Functions 

(define-type ExprC
  [numC (n : number)] ; number
  [plusC (l : ExprC) (r : ExprC)] ; a+b
  [multC (l : ExprC) (r : ExprC)] ; b*b
  [idC (s : symbol)] ; identifier
  [appC (fun : symbol) (arg : ExprC)] ; function application
)

; p.20 $5.2 Defining Data Representations

(define-type FunDefC ; function definition
  [fdC
    (name : symbol) ; name
    (arg : symbol) ; argument (single: scalar or composite)
    (body : ExprC) ; function body
  ]
)

; p.23 $5.3 Substitution

(define (subst [what : ExprC] [for : symbol] [in : ExprC]) : ExprC
  (type-case ExprC in
    [numC (n) in] ; numbers stays itself
    [plusC (l r) (plusC (subst what for l) (subst what for r))]
    [multC (l r) (multC (subst what for l) (subst what for r))]
    [appC (f a) (appC f (subst what for a))]
    [idC (s) (cond ; consitional id replace
               [(symbol=? s for) what] ; replace only symbols
               [else in] ; but not function names
              )]
    )
  )

; p.22 function body search
; get-fundef : symbol * (listof FunDefC) -> FunDefC ; 

; p.21 $5.2 Interpreter

(define (interp [e : ExprC] [fds : (listof FunDefC)]) : number
  (type-case ExprC e
    [numC (n) n]
    [plusC (l r) (+ (interp l fds) (interp r fds))]
    [multC (l r) (* (interp l fds) (interp r fds))]
    [appC (f a)
      (local ([define fd (get-fundef f fds)]) (
        (interp (subst a (fdC-arg fd) (dfC-body fd) ) fds)
      ))
    ]
    [idC e]
  )
)

; p.23 $5.4
