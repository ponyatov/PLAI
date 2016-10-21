(read-number/suspend "First number"
(lambda (v1)
(read-number/suspend "Second number"
(lambda (v2)
(display
(+ v1 v2))))))