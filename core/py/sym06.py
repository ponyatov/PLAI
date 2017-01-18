#    nest = [] # by init, must be nonstatic
    def push(self, o):      # add nested element
        self.nest.append(o) # store to nest[]ed
        return self         # return modified object
