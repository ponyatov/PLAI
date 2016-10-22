(read-number/suspend "First number"
(lambda (v1)
(display
(+ v1
(read-number "Second number")))))