%{
#include <stdio.h>
#include <stdlib.h>
#include<math.h>

int c=0;
%}

%token FOR LEFT_PARENTHESIS RIGHT_PARENTHESIS END
%%
S : E G {printf("\nNo. of FOR's : %d",c); };
E : FOR LEFT_PARENTHESIS E RIGHT_PARENTHESIS {c++;} | ;
G : END;
%%
