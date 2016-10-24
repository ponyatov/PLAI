(a1 "x")
= (guard (function (immediate number?)
(immediate number?))
add1
"add1 body"
"add1 input")
= (((function (immediate number?) (immediate number?))
"add1 body" "add1 input")
add1)
= (let ([dom-c ((immediate number?) "add1 body" "add1 input")]
[rng-c ((immediate number?) "add1 body" "add1 input")])
(lambda (x) (rng-c (add1 (dom-c x)))))
= (let ([dom-c (lambda (val)
(if (number? val) val (blame "add1 body")))]
[rng-c (lambda (val)
(if (number? val) val (blame "add1 body")))])
(lambda (x) (rng-c (add1 (dom-c x)))))