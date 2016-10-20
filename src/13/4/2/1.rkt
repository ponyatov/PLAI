(let ([init #f])
  (my-or-3 (begin (set! init (not init))
      init)
    #f))