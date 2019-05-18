%{
#include <stdio.h>
%}

%token NUM END
%token PLUS MINUS MUL DIV LEFT_PARENTHESIS RIGHT_PARENTHESIS
%left PLUS MINUS MUL DIV
%%
S : E G { printf("=%d",$1); };
E : E PLUS T {$$ = $1 + $3;}
| T
| E MINUS T {$$ = $1 - $3;};
T : T MUL F {$$ = $1 * $3;}
| F
| T DIV F {$$ = $1 / $3;};
F : LEFT_PARENTHESIS E RIGHT_PARENTHESIS {$$ = $2;} | NUM;
G : END;
%%