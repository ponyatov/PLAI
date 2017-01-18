class Sym:
    def __init__(self, V):  # constructor
        self.val = V            # val
        self.nest = []          # nest[]ed elemenets
        self.sel = {}           # selectors table
    def dump(self, depth=0):
        S = "\n" + self.pad(depth) + self.head()
        for i in self.sel:
            S += "\n"+ self.pad(depth+1) + i + ' ='
            S += self.sel[i].dump(depth+2)
        for j in self.nest:
            S += j.dump(depth + 1)
        return S