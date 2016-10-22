[objC (ns es) (objV ns (map (lambda (e)
    (interp e env))
  es))]