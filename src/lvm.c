#include "lvm.h"
#include <stdio.h>

int is_blocktype(t_block block, enum blocktype type) {
    return (block << 4 >> (24 + 4)) == type;
}

int is_value_equal(t_block a, t_block b) {
    return ((a << 8 >> 8) == (b << 8 >> 8));
}

int get_value(t_block block) {
    return block << 8 >> 8;
}

int is_bound(t_block block) {
    return block >> 31;
}


// Reduce a lambda function.
// This assumes that there is a valid function and has an argument.
// P1 - Pointer to lambda function's body.
// P2 - Pointer to argument.
// P - Same as P2. But this is not modified.
// L - Last block's index of lambda argument. Minus 1.
unsigned int reduce(t_block * MEM, t_block * CACHE,
            t_index P1, t_index P2, t_index P, t_index L, 
            t_block a)
{
    int IO1     = 1,
        IO2     = 1,
        n       = 0,
        P_CACHE = 0
        ;

    do {
        t_block in; // input
        t_block x;
        t_block y;
        
        // 1
        x = MEM[P1];
        y = MEM[P2];
        in = IO1 ? x : y; // get input
        (*(IO1 ? &P1 : &P2))--; // decrement pointer

        // 2
        // Switch IO1, if input == argument.
        IO1 = IO1 & IO2 & is_value_equal(in, a) & is_blocktype(in, blocktype_name) & is_bound(in) ? 0 : IO1;
        IO1 = P2 == L ? 1 : IO1; // switch IO1 if P2 met the last block
        P2 = P2 == L ? P : P2; // reset P2 if P2 met the last block

        // 3
        // Turn off switching of 2 if encountered a function in P1
        // with the same argument as 'a'.
        // get the length of the function
        n = IO1 & is_blocktype(in, blocktype_function) ? get_value(in) : n;
        n = n ? (n - 1) : n;
        IO2 = n & is_blocktype(in, blocktype_argument) & is_value_equal(in, a) ? 0 : 1;

        // move to cache
        CACHE[P_CACHE++] = in;
        // printf("%d: %c %d\n", P_CACHE, in << 24 >> 24, IO1);
        // advance CACHE's pointer, unless 2 just switched
        P_CACHE = (!IO1) & (P2 == P) ? P_CACHE - 1 : P_CACHE;
    } while(!(IO1 & (P1 == P)));
    return P_CACHE;
}
