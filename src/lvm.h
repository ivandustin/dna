/*
    LVM - Lambda Virtual Machine

    Copyright (c) 2018 Ivan Dustin Bilon
*/

typedef unsigned int t_block;
typedef unsigned int t_index;

enum blocktype {
    blocktype_name = 0,
    blocktype_function = 1,
    blocktype_group = 2,
    blocktype_argument = 3
};

unsigned int reduce(t_block * MEM, t_block * CACHE,
            t_index P1, t_index P2, t_index P, t_index L, 
            t_block a);
