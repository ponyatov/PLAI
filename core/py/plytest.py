import ply.lex  as lex
import ply.yacc as yacc

tokens = ['INT' , 'NUM' , 'EXP' , 'BIN' , 'HEX' ,
          'SYM' , 'DIR', 'COMMENT' , 'OP' ,
          'STR','CHAR' ]

def t_BIN(tok):             # binary string
    r'0b[01]+'
    tok.value = int(tok.value,2)
    return tok 
def t_HEX(tok):             # hexadeciman number
    r'0x[0-9a-fA-F]+'
    tok.value = int(tok.value,16)
    return tok 
def t_EXP(tok):             # number exponential form
    r'[0-9]+(\.[0-9]+)?[eE][\+\-]?[0-9]+'
    tok.value = float(tok.value)
    return tok
def t_NUM(tok):             # number point form
    r'[0-9]+\.[0-9]*'
    tok.value = float(tok.value)
    return tok
    
def t_SYM(tok):             # symbol
    r'[a-zA-Z0-9_]+'
    return tok

def t_COMMENT(tok):
    r'\#[^\n]+'
    print 'comment:', tok
    return tok

t_OP = r'[=@\+\-\*\/\^\[\]\{\}&]'

t_DIR = r'\.[a-z]+'        # directive

t_ignore = ' \t\r\n'        # ignore spaces

states = [('string','exclusive')]

t_string_ignore = '' # must be defined for every state

lexstring = ''      # global buffer for parsed string

def t_STR(tok):             # will be called in <INITIAL>
    r'\''
    tok.lexer.begin('string')   # trigger state
    global lexstring            # \ clar buffer
    lexstring = ''              # / 
    return None                 # drop token

def t_string_STR(tok):      # will be called in <string>
    r'\''
    tok.lexer.begin('INITIAL')  # trigger state
    global lexstring            # \ return buffer
    tok.value = lexstring       
    return tok                  # / in token

def t_string_CHAR(tok):     # add any char to lexstring
    r'.'
    global lexstring
    lexstring += tok.value
    
def t_ANY_error(tok):       # error callback
    print 'error:', tok # report
#     tok.lexer.skip(1)   # error recovery

lexer = lex.lex()
lexer.input(file('1.src').read())

for i in iter(lexer.token,None): print i