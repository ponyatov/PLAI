(let ([x 10])
(if (even? (read-number "Enter a number"))
(set! x 5)
(set! x "something")))