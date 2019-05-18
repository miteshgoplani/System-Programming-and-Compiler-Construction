%{
#include <stdio.h>
%}
%start lines
%token NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token END
%left PLUS MINUS
%left TIMES DIVIDE
%right POWER
%%
lines: /* empty */
| lines line /* do nothing */
line: exp END { printf("found exp END\n"); }
;
exp : term { printf("found term\n"); }
| exp PLUS term { printf("found exp PLUS term\n"); }
| exp MINUS term { printf("found exp MINUS term\n"); }
;
term : factor { printf("found factor\n"); }
| term TIMES factor { printf("found term TIMES factor\n"); }
;
factor : NUMBER { printf("found NUMBER %d\n", yylval); }
| LEFT_PARENTHESIS exp RIGHT_PARENTHESIS
{ printf("found PARENS exp\n"); }
;
%%
int main (void) {return yyparse ( );}
int yyerror (char *s) {fprintf (stderr, "%s\n", s);}