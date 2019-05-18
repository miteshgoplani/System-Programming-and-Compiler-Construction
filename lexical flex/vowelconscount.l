%{
#include<stdio.h>
int c=0,v=0,p=0,s=0,op=0,i=0;
%}
%%
{ 
	printf p++;
	scanf s++;
	[aeiouAEIOU] v++;
	[a-zA-Z] c++;
	[\+\-*/] op++;
	([a-zA-Z0-9])* i++;
}
%%
int yywrap()
{
  return 1;
}


int main(int argc, char** argv)
{
if (argc > 1)
{
 FILE *file;
 file = fopen(argv[1], "r");
 if (!file)
 {
 fprintf(stderr, "Could not open %s\n", argv[1]);
 exit(1);
 }
 yyin = file;
}
yylex();
printf("Vowels = %d & Consonants = %d\n",v,c);
printf("Number of printf = %d and number of scanf = %d\n",p,s);
printf("Number of operators = %d\n",op);
printf("Number of variables = %d\n",i);
return 0;
}
