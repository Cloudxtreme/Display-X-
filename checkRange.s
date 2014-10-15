/*
 * Filename: checkRange.s
 * Author: Eric Tran
 * Login Name: cs30xjy
 * Description: Checks whether the value of the first argument is
 * within the range of minRange and maxRange
 * Sources of Help: StackOverflow, SPARC Assembly wikibook, Lecture 
 * Notes
 *
 */

	.global checkRange

	.section ".text"

/*
 * Function Name: checkRange()
 * Function Prototype: 
 * 			int checkRange(long value, long minRange, long maxRange)
 * Descripton: Checks whether the input is within the ranges allowed by minRange
 * and maxRange
 *
 * Parameters: long value - the value to be checked
 * 	       long minRange - the minimum range value
 * 	       long maxRange- the maximum range value
 *
 *
 * Registers: %i0 - value, the number checked also used 
 * 	      to return, 1st parameter
 *
 * 	      %i1 - the minimum value, 2nd parameter
 *
 * 	      %i2 - the maximum value, 3rd parameter
 *
 * Return: 0 for false, 1 for true
 *
 *
 *
 */
 

checkRange:
	
	save	%sp, -96, %sp	! "magic"

	cmp	%i0, %i1	! compare value and minRange first

	bge	comparison	! branch greater or equal to
	nop

	ba	outRange	! will branch to outOfRange
				! to return 0 indicating false
	nop

comparison:

	cmp	%i0, %i2	! compare value and maxRange
	
	ble	inRange		! branch less than or equal to
	nop

	ba	outRange	! branch to outOfRange to return
				! to return 0 indicating false
	nop

inRange:

	mov	1, %i0		! return 1 if inRange
	
	ba	return
	nop

outRange:
	
	mov	0, %i0		! return 0 if out of range
	
	ba	return
	nop

return:
	
	ret			
	restore				
