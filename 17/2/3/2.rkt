(add1 seconds)
(modulo seconds 10)
(build-list (modulo seconds 10) identity)
(build-list (add1 (modulo seconds 10)) identity)