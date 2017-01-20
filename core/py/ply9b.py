def t_BIN(tok):                     # binary string
    r'0b[01]+'
    tok.value = int(tok.value,2)
    return tok 
def t_HEX(tok):                     # hexadeciman number
    r'0x[0-9a-fA-F]+'
    tok.value = int(tok.value,16)
    return tok