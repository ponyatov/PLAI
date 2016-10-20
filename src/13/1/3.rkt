(let (var val) body)
->
((lambda (var) body) val)