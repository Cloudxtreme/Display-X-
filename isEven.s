/*
 * Filename: isEven.s
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Program to test if value is even or not.
 * Date: October 14, 2014
 * Sources of Help: pa0, lecture notes, SPARC wikibook
 *                  
 */ 

.global isEven

.section ".text"

/*
 * Function name: isEven()
 * Function protype: int isEven(long num);
 * Description: Checks if the inputted number is even
 * and returns 0 if not and non-zero value if is.
 * Parameters: 
 * 	arg 1: long num -- number to be checked
 *
 * Side Effects: None
 * Error Conditions: None
 * Return Value: Non-zero value if even, 0 if not even
 *
 * Registers Used: 
 * 	$i0 - arg 1 -- number to be checked
 * 	%o0 - argument 1 is passed to subroutine .rem
 * 	%o1 - value of 2 to be compared to 
 *
 */

DIVISOR = 2



isEven:
	save	%sp, -96, %sp	! magic for now, saves the state

	inc 	%i0		! increment the return value by 1

	mov	%i0, %o0	! passes the argument to function 

	call	.rem		! modulus subroutine

	mov	DIVISOR, %o1	! move the divisor to register to 
				! be compared

	mov	%o0, %i0	! move the result to be returned

	ret

	restore


      











