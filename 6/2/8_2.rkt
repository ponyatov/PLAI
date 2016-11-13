(test (interp (plusC (numC 10)
              (appC 'double (plusC (numC 1) (numC 2))))
              mt-env
              (list (fdC 'double 'x
                  (plusC (idC 'x) (idC 'x)))))
      16)