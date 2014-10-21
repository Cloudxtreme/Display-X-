/*
 * Filename: numOfDigits.s
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Program to count number of base digits in its argument.
 * Date: October 20, 2014
 * Sources of Help: pa0, lecture notes, SPARC wikibook
 *                  
 */ 

	.global numOfDigits

	.section ".text"

	MIN_BASE = 2

	MAX_BASE = 36

	COUNTER = 0



/*
 * Function name: numOfDigits()
 * Function protype: int numOfDigits(long num, int base);
 * Description: Count nunber of base digits in argument
 * if the num is the value 0, return value of 1
 * Parameters: 
 * 	arg 1: long num -- number to be checked
 *
 * Side Effects: None
 * error conditions: none
 * return value: non-zero value if even, 0 if not even
 *
 * registers used: 
 * 	$i0 - arg 1 -- number to be checked
 * 	%o0 - argument 1 is passed to subroutine checkrang
 * 	%o1 - value of 2 to be compared to 
 *
 */

numOfDigits:

	save	%sp, -96, %sp	! Save caller's window

	mov 	%i1, %o0	! Copy base parameter in the register

	mov 	MIN_BASE, %o1	

	mov	MAX_BASE, %o2

	call	checkRange	! Call the checkRange function
	nop			! to check if the base value is valid

	cmp	%o0, 0

	bne	initialCheck	! Check if the value is 0 initially
	nop

	mov	-1, %l1		! out of Range, return -1

	ba	end
	nop




initialCheck:
	
	mov	%i0, %o0
	clr	%l1		! counter

loop: 
	cmp     %o0, 0          ! check loop as is not zero
        
	be      end         	! move to the end
        nop

        mov     %i1, %o1        ! set base for div operation
        
	call	.div            ! divides
        nop

        inc     %l1             ! increment counter

        cmp     %o0, 0          ! to execute loop again
        bne     loop            ! iterate
        nop
        


	
		
end:
	mov	%l1, %i0

	ret
	restore
	
	



	



	
