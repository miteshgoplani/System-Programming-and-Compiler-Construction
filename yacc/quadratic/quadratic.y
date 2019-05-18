%{
#include <stdio.h>
#include <stdlib.h>
#include<math.h>
%}

%token NUM END
%token PLUS MINUS MUL DIV LEFT_PARENTHESIS RIGHT_PARENTHESIS 
%left PLUS MINUS MUL DIV 
%%

S : E G ;
E : A A A {$$ = $2*$2 - 4*$1*$3; if($$>=0) {float sq = sqrt($$); float alpha = (sq-$2)/(2*$1); printf("\nFirst root is %f", alpha); float beta = (-sq-$2)/(2*$1); printf("\nSecond root is %f", beta); } else {printf("Imaginary roots!!");} };
A : NUM;
G : END;

%%
