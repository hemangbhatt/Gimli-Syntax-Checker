// Author: Hemang Bhatt


%{ 
#include <stdio.h>
#include "y.tab.h"
%}

%%

"start"                     return START;
"end"                       return END;
"if"                        return IF;
"then"                      return THEN;
"else"                      return ELSE;
"while"                     return WHILE;
"read"                      return READ;
"print"                     return PRINT;
"and"                       return AND;
"or"                        return OR;
"not"                       return NOT;
"+"                         return PLUS;
"-"                         return MINUS;
"*"                         return ASTERISK;
"/"                         return DIVIDE;
"%"                         return PERCENT;
"<"                         return LESSTHAN;
"="                         return EQUALS;
">"                         return GREATERTHAN;
";"                         return SEMI;
","                         return COMMA;
"int"                       return INT;
"float"                     return FLOAT;
"function"                  return FUNCTION;
"("                         return STARTP;
")"                         return ENDP;
"\""                        return QUOTE;

[0-9]+                      return INTEGER;
[a-zA-Z0-9\032]+            return CHARS;
\"[ a-zA-Z0-9]+\"           return STRING;


\/\*[ a-zA-Z0-9]*\*\/         ;
[ \t\r\n]                     ;
[.]                          printf("%s",yytext);
