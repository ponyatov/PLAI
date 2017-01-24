literals = [ '{', '}' ]

def t_lbrace(t):
    r'\{'
    t.type = '{' # Set token type to the expected literal
    return t

def t_rbrace(t):
    r'\}'
    t.type = '}' # Set token type to the expected literal
    return t