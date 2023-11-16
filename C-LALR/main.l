%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"BEGIN" { return BEGIN_; }
"PRINT" { return PRINT; }
"INTEGER" { return INT; }
"STRING" { return STRING; }
"REAL" {return REAL_NUM;}
"TO" { return TO; }
"END" { return END_;}
"FOR" {return FOR;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
-?[0-9]+(\.[0-9]+)? { return NUM; }
-?[0-9]*\.?[0-9]+([eE][+-]?[0-9]+)?  {return REAL_DIG;}
\"([^"]*)\"  {return LIT;}
\r\n {return NL;}
"    " {;}
[ \t]+ {;}
"," { return CM; }
":=" {return EQ; } 
. { return yytext[0]; }
%%
