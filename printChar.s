/*
 * Filename: printChar.s
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Program to print out a inputted char to stdout
 * Date: October 20, 2014
 * Sources of Help: pa0, lecture notes, SPARC wikibook
 *                  
 */ 

/*
 * Function name: printChar()
 * Function prototype: void printChar(char ch)
 * Description: Prints out inputted char to stdout
 *
 * Parameters: arg 1: ch the character to be printed
 *
 * Side Effects: Outputs char to stdout as supplied by argument
 * Error Conditions: None.
 * Return Value: none
 *
 *
 *
 */

	.global printChar	! Declares the symbol to be globally
				! visible so we can call this function
	.section ".data"

	

format:				! Formatted String for printf()
	.asciz "%c"

	.section ".text"

printChar: 
	
	save	%sp, -96, %sp

	set	format, %o0	! Format the argument contained in
				! register %o0

	mov	%i0, %o1	! copy value to be printed

	call	printf, 2	! Calls the printf function for printing
	nop			

	ret			
	restore			


