digit            = r'([0-9])'
nondigit         = r'([_A-Za-z])'
identifier       = r'(' + nondigit + r'(' + digit + r'|' + nondigit + r')*)'        

def t_ID(t):
    # want docstring to be identifier above. ?????
    ...