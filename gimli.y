// Name: Hemang Bhatt
// Project: Lex/Yacc gimli syntax checker

%{
#include <stdio.h> 
%}

%start program

%token START END 
%token IF THEN ELSE WHILE 
%token READ PRINT 
%token AND OR NOT

 /* each of the tokens mentioned in the Lex file need to be listed here */
%token MINUS PLUS ASTERISK DIVIDE PERCENT 

%token LESSTHAN EQUALS GREATERTHAN

%token SEMI COMMA QUOTE

%token CHARS INTEGER

%token INT FLOAT FUNCTION STRING  

%token STARTP ENDP
%%                   /* beginning of rules section */

program :  START statements END 
| { yyerror("didn't find a program"); }
;

statements : statement SEMI
| statement SEMI statements
;

statement : printStmt  
| declaration 
| assignmentStmt 
| readStmt 
| ifStmt
| whileStmt
| call_stmt 
;


printStmt : PRINT expr 
;


declaration : INT identifierList 
| FLOAT identifierList 
| FUNCTION identifierList
| STRING identifierList
;

assignmentStmt: identifier EQUALS expr
;

readStmt: READ identifierList
;

ifStmt: IF expr THEN statements ELSE statements
;

whileStmt: WHILE expr statements END
;

call_stmt: identifier STARTP argumentList ENDP
;

expr: term
| term addop factor
| STARTP expr ENDP
| expr relOps expr
| expr addop expr // Define by me to work print x+3-17;
| expr logicalOps expr 
;

term: factor 
| factor multop term
;

addop: PLUS | MINUS
;

identifierList: identifier
| identifier COMMA identifierList
;

argumentList: argument
| argument COMMA argumentList
;

multop: ASTERISK | DIVIDE | PERCENT
;

relOps: LESSTHAN | GREATERTHAN | EQUALS EQUALS
;


logicalOps: AND | OR | NOT
;

argument: expr
;

factor: identifier
| constant
;

identifier: CHARS
| STRING
;

constant: INTEGER
| FLOAT
| FUNCTION
;


%%
main()
{
  fprintf(stderr, "Starting parse\n");  
  yyparse();
  fprintf(stderr, "Looks good\n");  
}

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n", s);
}

yywrap()
{
  return(1);
}
