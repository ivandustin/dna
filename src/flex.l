%{
#include "include.hpp"
#include "bison.hpp"
%}

%%
[ \r\t]+        ;
\=              { return EQUAL; }
\\              { return LAMBDA; }
\.              { return DOT; }
\n+             { return NEWLINE; }
[\+\-\/\*]      { return OPERATOR; }
[\^\&\|]        { return OPERATOR; }
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
[a-z]+          { return VARIABLE; }
.               { return ILLEGAL; }
%%
