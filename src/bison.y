%{
#include "include.hpp"
%}

%token LAMBDA
%token DOT
%token EQUAL
%token VARIABLE
%token NEWLINE
%token OPERATOR
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
	LPAREN LAMBDA variables DOT expression RPAREN
	| LPAREN LAMBDA DOT expression RPAREN
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
	| conditional
	| sequential
	| LPAREN application RPAREN
	;

math:
	math OPERATOR value
	| value OPERATOR math
	| math OPERATOR math
	| value OPERATOR value
	| LPAREN math RPAREN
	;

conditional:
	IF expression THEN expression
	| IF expression THEN expression ELSE expression
	;

sequential:
	expression THEN expression
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
