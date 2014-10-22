/*
 * Filename: testnumOfDigits.c
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Unit test program to test the function numOfDigits.
 * Date: 10/20/14
 * Sources of Help:
 */ 

#include <stdlib.h>	/* For rand() function prototype */
#include <limits.h>	/* For LONG_MIN and LONG_MAX */
#include "pa1.h"	/* For checkRange() function prototype */
#include "test.h"	/* For TEST() macro and stdio.h */

/*
 * int numOfDigits( long num, int base );
 *
 * Returns number of digits the number has by base.
 * 
 *
 * Precondition: Assume minRange is less than or equal to maxRange.
 */

void
testnumOfDigits()
{
    printf( "Testing numOfDigits()\n" );

    /* Test around 0 with range of size 0. */
    TEST( numOfDigits(0, 31) == 0);
    
    printf( "Finished running tests on numOfDigits()\n" );
}

int
main()
{
    int resultCorrect = numOfDigits(0,2);
    int resultFalse = numOfDigits(100, 2);
    int one = numOfDigits(100, 16);

    printf("Output of correct is %d\n ", resultCorrect);
    printf("Output of 100 with base 2 is %d\n", resultFalse);
    
    printf("Output of 100 with base 16 is %d\n", one);
    testnumOfDigits();



    return 0;
}
