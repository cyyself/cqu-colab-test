#include "test.h"
.extern ret_add_test
.globl add_test
add_test:
  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------
  TEST_RR_OP( add, 2,  add, 0x00000000, 0x00000000, 0x00000000 );
  TEST_RR_OP( add, 3,  add, 0x00000002, 0x00000001, 0x00000001 );
  TEST_RR_OP( add, 4,  add, 0x0000000a, 0x00000003, 0x00000007 );

  TEST_RR_OP( add, 5,  add, 0xffffffffffff8000, 0x0000000000000000, 0xffffffffffff8000 );
  TEST_RR_OP( add, 6,  add, 0xffffffff80000000, 0xffffffff80000000, 0x00000000 );
  TEST_RR_OP( add, 7,  add, 0xffffffff7fff8000, 0xffffffff80000000, 0xffffffffffff8000 );

  TEST_RR_OP( add, 8,  add, 0x0000000000007fff, 0x0000000000000000, 0x0000000000007fff );
  TEST_RR_OP( add, 9,  add, 0x000000007fffffff, 0x000000007fffffff, 0x0000000000000000 );
  TEST_RR_OP( add, 10, add, 0x0000000080007ffe, 0x000000007fffffff, 0x0000000000007fff );

  TEST_RR_OP( add, 11, add, 0xffffffff80007fff, 0xffffffff80000000, 0x0000000000007fff );
  TEST_RR_OP( add, 12, add, 0x000000007fff7fff, 0x000000007fffffff, 0xffffffffffff8000 );

  TEST_RR_OP( add, 13, add, 0xffffffffffffffff, 0x0000000000000000, 0xffffffffffffffff );
  TEST_RR_OP( add, 14, add, 0x0000000000000000, 0xffffffffffffffff, 0x0000000000000001 );
  TEST_RR_OP( add, 15, add, 0xfffffffffffffffe, 0xffffffffffffffff, 0xffffffffffffffff );

  TEST_RR_OP( add, 16, add, 0x0000000080000000, 0x0000000000000001, 0x000000007fffffff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( add, 17, add, 24, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( add, 18, add, 25, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( add, 19, add, 26, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( add, 20, 0, add, 24, 13, 11 );
  TEST_RR_DEST_BYPASS( add, 21, 1, add, 25, 14, 11 );
  TEST_RR_DEST_BYPASS( add, 22, 2, add, 26, 15, 11 );

  TEST_RR_SRC12_BYPASS( add, 23, 0, 0, add, 24, 13, 11 );
  TEST_RR_SRC12_BYPASS( add, 24, 0, 1, add, 25, 14, 11 );
  TEST_RR_SRC12_BYPASS( add, 25, 0, 2, add, 26, 15, 11 );
  TEST_RR_SRC12_BYPASS( add, 26, 1, 0, add, 24, 13, 11 );
  TEST_RR_SRC12_BYPASS( add, 27, 1, 1, add, 25, 14, 11 );
  TEST_RR_SRC12_BYPASS( add, 28, 2, 0, add, 26, 15, 11 );

  TEST_RR_SRC21_BYPASS( add, 29, 0, 0, add, 24, 13, 11 );
  TEST_RR_SRC21_BYPASS( add, 30, 0, 1, add, 25, 14, 11 );
  TEST_RR_SRC21_BYPASS( add, 31, 0, 2, add, 26, 15, 11 );
  TEST_RR_SRC21_BYPASS( add, 32, 1, 0, add, 24, 13, 11 );
  TEST_RR_SRC21_BYPASS( add, 33, 1, 1, add, 25, 14, 11 );
  TEST_RR_SRC21_BYPASS( add, 34, 2, 0, add, 26, 15, 11 );

  TEST_RR_ZEROSRC1( add, 35, add, 15, 15 );
  TEST_RR_ZEROSRC2( add, 36, add, 32, 32 );
  TEST_RR_ZEROSRC12( add, 37, add, 0 );
  TEST_RR_ZERODEST( add, 38, add, 16, 30 );

  j ret_add_test