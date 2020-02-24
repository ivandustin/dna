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
%token WHOLE
%token DECIMAL
%token STRING
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

function:
	LAMBDA variables DOT expression |
	LPAREN function RPAREN
	;

application:
	expression expressions
	;

expression:
	VARIABLE |
	function |
	application |
	operation |
	scalar |
	vector |
	LPAREN expression RPAREN
	;

expressions:
	expressions expression | expression
	;

variables:
	variables VARIABLE | VARIABLE
	;

operation:
	expression OPERATOR expression
	;

assignment:
	VARIABLE EQUAL expression |
	VARIABLE EQUAL matrix
	;

scalar:
	WHOLE | DECIMAL | STRING | BOOLEAN | function
	;

scalars:
	scalars scalar | scalar
	;

vector:
	LBRACKET scalars RBRACKET
	;

matrix:
	vector NEWLINE matrix |
	vector NEWLINE |
	vector
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
