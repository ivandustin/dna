#include <stdio.h>
#include <iostream>
#include <vector>

extern "C" int yylex();
extern "C" int yyparse();
extern "C" void yyerror(char*);
extern "C" int yyline;

using namespace std;
