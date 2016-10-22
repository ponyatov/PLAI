<appC-case> ::=
  [appC (f a) (local ([define fd (get-fundef f fds)])
              <appC-interp>)]