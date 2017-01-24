# Compute column. 
#     input is the input text string
#     token is a token instance
def find_column(input,token):
    last_cr = input.rfind('\n',0,token.lexpos)
    if last_cr < 0:
    last_cr = 0
    column = (token.lexpos - last_cr) + 1
    return column