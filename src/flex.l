%{
#include "include.hpp"
#include "bison.hpp"

int yyline = 1;
%}

%%
[ \r\t]+        ;
\=\=            { return ISEQUAL; }
\!\=            { return NOTEQUAL; }
\>\=            { return GE; }
\<\=            { return LE; }
\>              { return GT; }
\<              { return LT; }
and             { return AND; }
or              { return OR; }
not             { return NOT; }
\=              { return EQUAL; }
\\              { return LAMBDA; }
\.              { return DOT; }
\n              { yyline++; return NEWLINE; }
\+              { return ADD; }
\-              { return SUBTRACT; }
\/              { return DIVIDE; }
\*              { return MULTIPLY; }
xor             { return BITXOR; }
\&              { return BITAND; }
\|              { return BITOR; }
\(              { return LPAREN; }
\)              { return RPAREN; }
\[              { return LBRACKET; }
\]              { return RBRACKET; }
[0-9]+          { return INTEGER; }
[0-9]+\.[0-9]+  { return FLOAT; }
\"[^\"]*\"      { return STRING; }
if              { return IF; }
then            { return THEN; }
else            { return ELSE; }
true|false      { return BOOLEAN; }
for             { return FOR; }
\,              { return COMMA; }
[a-z]+          { return VARIABLE; }
.               { return ILLEGAL; }
%%
