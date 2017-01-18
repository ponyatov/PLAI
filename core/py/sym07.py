add = Sym('+')
symbol = Sym('symbol')
symbol.push(add)
print >>log,symbol
print >>log,symbol.nest[0]