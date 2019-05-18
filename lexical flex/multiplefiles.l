%{
#include <stdlib.h>
#include <stdio.h>
int charCount=0;
int wordCount=0;
int lineCount=0;
%}
%%
\n {charCount++; lineCount++;}
[^ \t\n]+ {wordCount++; charCount+=yyleng;}
. {charCount++;}
%%
int yywrap(void) {
return 1;
}
int main(int argc, char** argv)
{
   int i=1;
   for(i=1;i<argc;i++)
   {
       FILE *file;
       file = fopen(argv[i], "r");
       if (!file)
       {
           fprintf(stderr, "Could not open %s\n", argv[i]);
           exit(1);
       }
       yyin = file;   
       yylex();
       printf("Name of file => %s \n", argv[i]);
       printf("No of Character : %d \n", charCount);
       printf("No of Words : %d \n", wordCount);
       printf("No of Lines : %d \n", lineCount);
       charCount=0;
       wordCount=0;
       lineCount=0;
   }
   return 0;
}
