%{
#include <stdlib.h>
#include "y.tab.h"
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUM;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"\n" {return END;}
"(" {return LEFT_PARENTHESIS;}
")" {return RIGHT_PARENTHESIS;}
%%
int main(void)
{
yyparse();
return 0;
}
int yywrap(void)
{
return 0;
}
int yyerror(void)
{
exit(1);
}