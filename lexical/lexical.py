import re
operators = {
'=': 'Assignment Operator',
'+': 'Addition Operator',
'-': 'Subtraction Operator',
'/': 'Division Operator',
'*': 'Multiplication Operator',
'++': 'increment Operator',
'--': 'Decrement Operator',
'%':'Mod Operator',
'<':'Less than Operator',
'>':'Greater than Operator',
'==':'Equals to Operator',
'!=':'Not equals to',
'&&':'Logical AND',
'||':'Logical OR'
}
optr_keys = operators.keys()
symbols = {
'(':'Left parenthesis',
')':'Right parenthesis',
'{':'Left brace',
'}':'Right brace',
';':'Semi-colon',
',':'Comma'
}
symb_keys = symbols.keys()
keywords = {
'if':'Keyword',
'else':'Keyword',
'while':'Keyword',
'printf':'Keyword',
'main':'Keyword'
}
keywords_keys = keywords.keys()
datatype = {
'int': 'Integer',
'float': 'Floating Point',
'char': 'Character',
'long': 'Long'
}
datatype_keys = datatype.keys()
prepro_dir ={
'include':'is preprocessing directive',
'define':'is preprocessing directive',
}
prepro_dir_keys = prepro_dir.keys()

f = open('lexical.c','r')
scrap = f.read()
program = scrap.split('\n')
count = 0
for line in program:
   count = count + 1
   print("\nLine no.",count," : ",line)
   t = line.split(' ')
   for i in t:
       tokens = re.split('(\W)', i)
       for t in tokens:
           if t is '':
               tokens.remove(t)
       flag = 0
   for token in tokens:
       if (token in prepro_dir_keys):
           print("#",token,prepro_dir[token] )
           break
       elif token in datatype_keys:
           print(token,"is",datatype[token],"datatype")
       elif token in keywords_keys:
           print(token," is ",keywords[token])
       elif token is '"':
           if flag is 0:
               print(token,"Inverted commas start")
               flag = 1
           elif flag is 1:
               print(token,"Inverted commas end")
               flag = 0
       elif token in symb_keys:
           print(token,symbols[token],"is delimiter")
       elif token in optr_keys:
           print(token," is ",operators[token])
       elif token is not '#':
           print(token," is identifier")
