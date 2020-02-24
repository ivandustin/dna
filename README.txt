PROJECT: TYPED LAMBDA CALCULUS PROGRAMMING LANGUAGE

ABSTRACT

A small programming language based on Lambda Calculus, inspired by GOD from His design of the DNA. This is designed to execute in a highly parallel manner by default and automatically. This is a compiled, statically typed language and uses automatic type inference. This is a general purpose high-level programming language. It compiles to C++ to create machine code.

This uses un-named lambda calculus, but uses synonyms. Therefore, all lambdas are inlined at the call site during compile time.

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

a = 1
a = true
a = false
a = (\x.(\x.x)(\y.y))
a = [1 2 3]
a = [1 2 3]
    [1 2 3]
a = [[1 2 3] [1 2 3] [1 2 3]]
    [[1 2 3] [1 2 3] [1 2 3]]
a = (\x.a b c d e)
a = (\.((1+2)+(1+2)))
a = (\.(a b)(a b))
a = (\.a (a b) b (a b) a (a+2))
a = (\x.if x then a else if x then b else c)
a = (\x.if x then (if x then c))
a = (\x.a then b then c then e)
