%{
#include <stdio.h>
#include <stdlib.h>
#include<math.h>

int c=0;
%}

%token IF LEFT_PARENTHESIS RIGHT_PARENTHESIS END
%%
S : E G {printf("\nNo. of IF's : %d",c); };
E : IF LEFT_PARENTHESIS E RIGHT_PARENTHESIS {c++;} | ;
G : END;
%%
