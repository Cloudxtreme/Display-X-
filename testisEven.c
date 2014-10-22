/*
 * Filename: testisEven.c
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Unit test program to test the function isEven.
 * Date: October 14, 2014
 * Sources of Help: List all the people, books, websites, etc. that you
 *                  used to help you write the code in this source file.
 */ 

#include <stdlib.h>	/* For rand() function prototype */
#include <limits.h>	/* For LONG_MIN and LONG_MAX */
#include "pa1.h"	/* For checkRange() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */


void testisEven()
{
    printf( "Testing isEven()\n" );

    /* Test around 0 with range of size 0. */

    TEST( isEven(9) == 0 );

   
    printf( "Finished running tests on isEven function\n" );
}

int main()
{
    testisEven();

   

    return 0;
}
