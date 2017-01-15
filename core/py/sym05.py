    def __repr__(self):
        return self.dump()
    def head(self):
        return "<" + self.tag + ":" + self.val + ">"
    def pad(self, N):
        return '\t' * N
    def dump(self, depth=0):
        S = "\n" + self.pad(depth) + self.head()
        for i in self.nest: S += i.dump(depth + 1)
        return S
