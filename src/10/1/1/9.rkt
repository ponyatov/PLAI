(letS 'o (objS (list 'add1 'sub1)
    (list (lamS 'x (plusS (idS 'x) (numS 1)))
      (lamS 'x (plusS (idS 'x) (numS -1)))))
  (msgS (idS 'o) 'add1 (numS 3)))