PROJECT: TYPED LAMBDA CALCULUS PROGRAMMING LANGUAGE
NAME: ADNA (ARTIFICIAL DNA)

ABSTRACT

A small programming language based on Lambda Calculus, inspired by GOD from His design of the DNA. This is designed to execute in a highly parallel manner by default and automatically. This is a compiled, statically typed language and uses automatic type inference. This is a general purpose high-level programming language. It compiles to C++ to create machine code.

This uses un-named lambda calculus, but uses synonyms. Therefore, all lambdas are inlined at call site during compile time.

ELEMENTS

Variable
Function
Application

EXTENSION 1

Type
Variable Assignment
Synonym Assignment
Operator

EXTENSION 2

Program
Library
Import Library

VARIABLE TYPES

Scalar
Vector
Matrix
Hash

CONCRETE TYPES

Integer
Float
Character
String
Boolean
Function

EXAMPLES

n = 1
m = 2
f = \ a b . a + b
o = f n m

f = \ a . a + 1
z = \ a b . a b
v = (z f 2) + 2

GRAMMAR

start = lines
lines = line | lines
line = assignment
function = \ variables . expression
application = function expressions
variables = variable | variable variables
expression = variable | function | application | operation | scalar | vector | ( expression )
operation = expression operator expression
expressions = expression | expression expressions
operator = + | - | / | * | ^ | & | "|"
assignment = variable "=" expression | variable "=" matrix
scalar = integer | float | character | string | boolean | function
vector = [ scalars ]
matrix = vectors
