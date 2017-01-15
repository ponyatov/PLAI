import sys

src = open('src.src','r')
log = sys.stdout # open('log.log','w')

class Sym:
    val = ''
    tag = 'sym'
    def __init__(self,V): self.val = V
    nest = []
    def push(self, o):
        self.nest.append(o); return self
    def __repr__(self):
        return self.dump()
    def head(self):
        return "<" + self.tag + ":" + self.val + ">"
    def pad(self, N):
        return '\t' * N
    def dump(self, depth=0):
        S = "\n" + self.pad(depth) + self.head()
        for i in self.nest: print i  # S += i.dump(depth + 1)
        return S

#print >>log,src.read()

print >>log,Sym('symbol').push(Sym('+'))
