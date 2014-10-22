/*
 * Filename: teststrToLong.c
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Unit test program to test the function isEven.
 * Date: October 14, 2014
 * Sources of Help: 
 */ 

#include <stdlib.h>	/* For rand() function prototype */
#include <limits.h>	/* For LONG_MIN and LONG_MAX */
#include "pa1.h"	/* For checkRange() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */


void teststrToLong()
{
    printf( "Testing strToLong()\n" );

    /* Test around 0 with range of size 0. */

    TEST( strToLong("2323", 2) == 0);

   
    printf( "Finished running tests on strToLong function\n" );
}

int main()
{
    teststrToLong();

    return 0;
}
