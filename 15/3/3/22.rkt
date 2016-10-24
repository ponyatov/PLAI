(define-type SExp
  [numSexp (n : number)]
  [strSexp (s : string)]
  [listSexp (l : (listof SExp))])