<appC-interp-case> ::=
[appC (f a) (local ([define fd (get-fundef f fds)])
              (interp (subst a
                             (fdC-arg fd)
                             (fdC-body fd))
                      fds))]