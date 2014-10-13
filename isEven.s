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
 *
 */

.global isEven

.section ".text"



isEven:
	save	%sp, -96, %sp

	mov	%i0, %o0

	mov	2,   %o1

	call	.rem
	nop

	mov	%o0, %i0

	ret
	restore

