%{
#include "include.hpp"
%}

%token LAMBDA
%token DOT
%token ISEQUAL
%token NOTEQUAL
%token GE
%token LE
%token GT
%token LT
%token AND
%token OR
%token NOT
%token EQUAL
%token VARIABLE
%token NEWLINE
%token ADD
%token SUBTRACT
%token DIVIDE
%token MULTIPLY
%token BITXOR
%token BITAND
%token BITOR
%token LPAREN
%token RPAREN
%token LBRACKET
%token RBRACKET
%token INTEGER
%token FLOAT
%token STRING
%token IF
%token THEN
%token ELSE
%token BOOLEAN
%token ILLEGAL

%%
start:
	lines
	;

line:
	assignment NEWLINE
	| NEWLINE
	| assignment
	;

lines:
	lines line | line
	;

assignment:
	VARIABLE EQUAL value
	;

value:
	function | number | BOOLEAN | array | VARIABLE
	;

values:
	values value | value
	;

function:
	LPAREN LAMBDA args DOT expression RPAREN
	| LPAREN LAMBDA args DOT sequential RPAREN
	| LPAREN LAMBDA args DOT control RPAREN
	;

args:
	variables |
	;

variables:
	variables VARIABLE | VARIABLE
	;

number:
	INTEGER | FLOAT
	;

expression:
	value
	| application
	| LPAREN expression RPAREN
	;

application:
	VARIABLE expression
	| function expression
	| application expression
	| math
	| bitwise
	| boolean
	| LPAREN application RPAREN
	;

math:
	expression ADD expression
	| expression SUBTRACT expression
	| expression DIVIDE expression
	| expression MULTIPLY expression
	;

bitwise:
	expression BITXOR expression
	| expression BITAND expression
	| expression BITOR expression
	;

boolean:
	expression ISEQUAL expression
	| expression NOTEQUAL expression
	| expression GE expression
	| expression LE expression
	| expression GT expression
	| expression LT expression
	| expression AND expression
	| expression OR expression
	| NOT expression
	;

control:
	IF expression THEN expression
	| IF expression THEN expression ELSE expression
	| IF expression THEN expression ELSE control
	;

sequential:
	application THEN sequential
	| application THEN application
	;

array:
	matrix | vector
	;

vector:
	LBRACKET values RBRACKET
	;

matrix:
	matrix vector | vector NEWLINE
	;
%%

int main() {
	do {
		yyparse();
	} while(!feof(stdin));
	printf("parsed successfully\n");
}

void yyerror(char * err) {
	printf("syntax error: %s line: %d\n", err, yyline);
	exit(1);
}
