tokens = [ 'SYM' , 'NUM', 'DIR', 'COMMENT' , 'OP' ,
          'STR','CHAR' ]
states = [('string','exclusive')]

t_string_ignore = '' # must be defined for every state