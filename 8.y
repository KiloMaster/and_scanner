%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
%}




%token IF BREAK                             
CATCH                              
CACHE                             
CONTINUE                          
DO                                  
DEFAULT                           
ELSE                              
ELIF                             
EXTEND                            
ECHO                              
FUNCTION                          
FOR                             
FINALLY                           
IMPLEMENT                          
IN                              
INFO                             
INTO                             
INLINE                           
PUBLIC                        
PROTECT                           
PRIVATE                         
CONST                            
RETURN                         
STATIC                            
STRUCT                            
SWITCH                            
GOTO                              
TRY                               
TYPEDEF                          
WHILE                          
INSERTSCRIPT
CREATE_OPERATER

IDENTIFIER
HEX_VALUE
BIN_VALUE
INT_VALUE
FLOAT_VALUE
NEW_LINE
SPACE_WD


OR
AND

NOT
"~"                                  { printf("bits reverse  \n");  }    
BIT_REVERSER
"["                                  { printf("[\n");  }
"]"                                  { printf("]\n");  }
"("                                  { printf("(\n");  }
")"                                  { printf(")\n");  }
"{"                                  { printf("{\n");  }
"}"                                  { printf("}\n");  }

","                                  { printf(",\n");  }
";"                                  { printf(";\n");  }
"^"                                  { printf("^"); }
":"                                  { printf(":\n");  }
":="                                 { printf(":=\n");  }
INITIAL_VALUE
"<:="                                { printf("<:=\n");  }
PARALLEL_COMPUTE
"="                                  { printf("=\n");  }
SET_VALUE
"=="                                 { printf("==\n");  }
EQUAL
"'"                                  { printf("'\n");  }
\"                                   { printf("\"\n");  }
"<>"                                 { return; }   
IS_NOT_EQUAL
">"                                  { return; }   
IS_GREATER
"<"                                  { return; }   
IS_LESS
"<="                                 { return; }   
IS_NOT_GREATER
">="                                 { return; }   
IS_NOT_LESS
"<<"                                 { return; }   
LEFT_SHIFT
">>"                                 { return; } 
RIGHT_SHIFT
"!="                                 { return; }     
NOT_EQUAL
"."
GET_FIELD
.                                    { printf("未处理\n");  }
%%
%%



main(int argc, char** argv  )
{

    while(1)
    {
        yylex();
        printf("->%s\n",  yytext  );
    }

}
