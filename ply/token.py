from ply.lex import TOKEN

@TOKEN(identifier)
def t_ID(t):
    ...