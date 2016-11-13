(test (interp (plusC (numC 10)
              (appC 'quadruple (plusC (numC 1) (numC 2))))
          mt-env
          (list (fdC 'quadruple 'x
                (appC 'double (appC 'double (idC 'x))))
                (fdC 'double 'x
                    (plusC (idC 'x) (idC 'x)))))
      22)