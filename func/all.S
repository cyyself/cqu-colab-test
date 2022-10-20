.globl _start
.globl fail
.globl ret_add_test

.extern add_test

_start:
    j add_test
ret_add_test:

fail:
    nop

#include "rv64i/add.S"