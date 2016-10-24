(read-number/suspend "First"
(lambda (lv)
(read-number/suspend "Second"
(lambda (rv)
(identity
(display (+ lv rv)))))))