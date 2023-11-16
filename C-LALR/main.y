%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yydebug=1;
    extern FILE *yyin;
%}

%token ID NUM NL BEGIN_ PRINT END_ INT FLOAT REAL_NUM STRING CM EQ FOR TO
%%
S: BEGIN_ NL statement_list END_ { printf("\nValid language\n"); exit(0); };
statement_list: statement NL | statement_list statement NL;
statement: declaration | assignment | loop |  PRINT ID;
declaration: type ID_list;
type: INT | FLOAT | STRING;
ID_list: ID | ID_list CM ID;
assignment: ID EQ expression;
expression: ID | NUM | REAL_NUM | STRING;
loop: FOR ID EQ expression TO expression NL statement_list END_
;

%%

int yyerror(char *msg){
    printf("Invalid input");
    return 1;
}

int yywrap(){
return 1;
}

int main(int argc,char **argv)
{
    yyin=fopen(argv[1],"r");
    yyparse();
    return 0;
}