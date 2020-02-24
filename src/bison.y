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
	assignment NEWLINE | assignment
	;

lines:
	lines line | line
	;

assignment:
	VARIABLE EQUAL value
	;

value:
	function | number | BOOLEAN | array | VARIABLE |
	LPAREN value RPAREN
	;

values:
	values value | value
	;

function:
	LPAREN LAMBDA variables DOT value RPAREN 		|
	LPAREN LAMBDA variables DOT application RPAREN 	|
	LPAREN LAMBDA DOT value RPAREN 					|
	LPAREN LAMBDA DOT application RPAREN
	;

variables:
	variables VARIABLE | VARIABLE
	;

number:
	INTEGER | FLOAT
	;

expression:
	values | applications
	;

application:
	VARIABLE expression 	|
	function expression 	|
	math 					|
	conditional 			|
	sequential 				|
	application expression 	|
	LPAREN application RPAREN
	;

applications:
	applications application | application
	;

math:
	math OPERATOR value |
	value OPERATOR math |
	math OPERATOR math |
	value OPERATOR value |
	LPAREN math RPAREN
	;

conditional:
	IF expression THEN expression |
	IF expression THEN expression ELSE expression
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
	printf("syntax error: %s\n", err);
	exit(1);
}
