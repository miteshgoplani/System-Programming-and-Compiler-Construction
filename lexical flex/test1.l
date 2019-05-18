%{
#include<stdio.h>
%}
letter [a-zA-Z]
digit [0-9]
%%
begin {printf("keyword : %s",yytext);}
if {printf("keyword : %s",yytext);}
{letter}({letter}|{digit})* {printf("id : %s",yytext);}
%%
int yywrap(void) {
return 1;
}
int main()
{
yylex();
return 0;
}
    //To run : 
    //flex test1.l
    //gcc lex.yy.c -o test1.exe
    //test1.exe

