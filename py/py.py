import sys
import ply.lex as lex
import ply.yacc as yacc

src = open('src.src','r')
log = sys.stdout # open('log.log','w')

class Sym:
    tag = 'sym'
    def __init__(self, V):  # constructor
        self.val = V            # val
        self.nest = []          # nest[]ed elemenets
        self.sel = {}           # selectors table
    def push(self, o):
        self.nest.append(o) # store to nest[]ed
        return self         # return modified object
    def __repr__(self):     # for print
        return self.dump()
    def head(self):
        return "<" + self.tag + ":" + self.val + ">"
    def pad(self, N):
        return '\t' * N
    def dump(self, depth=0):
        S = "\n" + self.pad(depth) + self.head()
        for i in self.sel:
            S += "\n"+ self.pad(depth+1) + i + ' ='
            S += self.sel[i].dump(depth+2)
        for j in self.nest:
            S += j.dump(depth + 1)
        return S

#print >>log,src.read()

# add = Sym('+')
# symbol = Sym('symbol')
# symbol.push(add)
# symbol.sel['info'] = Sym('demo')
# print >>log,symbol
# print >>log,symbol.nest[0]

tokens = [ 'SYM' ]

t_SYM = r'[a-zA-Z0-9_]+'

lexer = lex.lex()
