%{
#include <stdlib.h>
#include<math.h>
#include "y.tab.h"
%}
%%

"if" {return IF;}
"{"  {return LEFT_PARENTHESIS;}
"}"  {return RIGHT_PARENTHESIS;}
"\n" {return END;}

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
