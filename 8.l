%{
int can = 0 ;
char* yylval = NULL ;

%}
%%

"if"                                 { return IF  ; }   
"break"                              { return BREAK  ; }   
"cache"                              { return CACHE ; } 
"catch"                              { return CATCH  ; }   
"continue"                           { return CONTINUE  ; }
"do"                                 { return DO ; }  
 
"default"                            { return DEFAULT  ; }   
"else"                               { return ELSE ; }
"elif"                               { return ELIF ; }   
"extend"                             { return EXTEND ; }   
"echo"                               { return ECHO ; } 

"function"                           { return FUNCTION ; }   
"for"                                { return FOR ; } 
"finally"                            { return FINALLY ; }   
"implement"                          { return IMPLEMENT ; }
"in"                                 { return IN ; } 
    
"info"                               { return INFO ; }   
"into"                               { return INTO ; }   
"inline"                             { return INLINE ; }   
"public"                             { return PUBLIC ; }
"protect"                            { return PROTECT ; }   

"private"                            { return PRIVATE ; }
"const"                              { return CONST ; } 
"return"                             { return RETURN  ; }   
"static"                             { return STATIC ; }   
"struct"                             { return STRUCT ; }   

"switch"                             { return SWITCH  ; }  
"goto"                               { return GOTO ; }   
"try"                                { return TRY ; } 
"typedef"                            { return TYPEDEF; }   
"while"                              { return WHILE ; }   
"operater"                           { return CREATE_OPERATER; }   



^"#!"/([ \t]*[:][ \t]*)              { printf("插入脚本\n");   ; return;  }
[a-zA-Z_][a-zA-Z_0-9]*               { printf("标识符\n");  return;   }
0x[0-9A-Fa-f]+                       { printf("十六进制数\n"); return; }
B'[01]+'                             { printf("获取了二进制数据\n"); return; }
[1-9][0-9]*|[0]                      { printf("整数\n");    ;  return;   }
([1-9][0-9]*|[0])"."[0-9]+           { printf("小数\n");    ;  return;   }
"\n"                                 { printf("\na new line \n");  return;    }    
[ \t]                                { printf("空格\n");      }
"+"                                  { printf("plus\n");  can = 0; }
"-"                                  { printf("minus\n"); can = 0;  }
"++"                                 { printf("increment\n");  can = 0; }
"--"                                 { printf("reduce\n"); can = 0;  }
"*"                                  { printf("mult\n");  can = 0; }
"/"                                  { printf("div\n");    }
"@"                                  { printf("get address\n");  }
"$"                                  { printf("get value of address\n");  }
"|"                                  { printf("bit or  \n"); }
"&"                                  { printf("bit and \n"); }
"||"                                 { printf("or\n");  }
"&&"                                 { printf("and\n"); }
"!"                                  { printf("logical  reverse \n");  }
"~"                                  { printf("bits reverse  \n");  }    
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
"<:="                                { printf("<:=\n");  }
"="                                  { printf("=\n");  }
"=="                                 { printf("==\n");  }
"'"                                  { printf("'\n");  }
\"                                   { printf("\"\n");  }
"<>"                                 { return; }   
">"                                  { return; }   
"<"                                  { return; }   
"<="                                 { return; }   
">="                                 { return; }   
"<<"                                 { return; }   
">>"                                 { return; } 
"!="                                 { return; }     
"."                                  { return; }   
.                                    { printf("未处理\n");  }
%%



main(int argc, char** argv  )
{

    while(1)
    {
        yylex();
        printf("->%s\n",  yytext  );
    }

}
