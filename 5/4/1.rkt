<appC-interp-case-take-1> ::=
[appC (f a) (local ([define fd (get-fundef f fds)])
              (subst a
                     (fdC-arg fd)
                     (fdC-body fd)))]