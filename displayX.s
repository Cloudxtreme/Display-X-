/*
 *Filename: displayX.s
 *Author: Eric Tran
 *Userid: cs30xjy
 *Description: SPARC Assembly routine to display pattern X to screen
 *Date: 10/21/14
 *Sources of Help: lecture notes, StackOverflow
 */

    .global displayX        ! Declares the symbol to be globally visible so
       
       				! we can call this funtion from toher modules.
    
    .section ".text"        
    				! The text segments begins here

    
    
    BASE = 10 
    
    ROW = 0

    COL = 0

    BORDERCNT = 0

    NL   = '\n'
	
/* Function name: displayX()
 * Function prototype: void displayX( long size, long xChar, long fillerChar, 
 *                      long borderChar )
 * Description: display pattern to screen
 * Parameters: arg1,2,3,4: size, xChar, fillerChar, borderChar draw based on
 * Side Effects: pattern displayed
 * Error Conditions: parameters not even/out ofrange, tested in main()
 * Return Value: none
 * Registers Used:
 *  %i0 - arg1 - size
 *  %i1,2,3 - arg2,3,4 - input char
 *  %o0 - param1 to fucntions    -- for operation and comparison.
 *  %l1,2,3,4 - params to cmp -- for operation and comparison
 */

displayX:
	
	save	%sp, -96, %sp	! Save the calling window

	mov	%i0, %o0	! size to function register

	mov 	BASE, %o1	! BASE to numOfDigits function
				! register as well
	mov 	ROW, %l0	! local variables to be used later
	mov	COL, %l1	
	mov	BORDERCNT, %l2
	
	call	numOfDigits
	nop

	mov	%o0, %l3	! store numOfDigits(size,BASE) in %l3

	mov	2, %o0
	mov	%l3, %o1

	call	.mul
	nop

	add	%o0, %i0, %l4	! add numOfDigits()*2 to size

	cmp	%l0, %l3	! row and numOfDigits(size, BASE);

	bge	Outer_Loop2	! opposite logic to end loop
	nop

Outer_Loop:
	
	clr	%l0		! row = 0

	cmp	%l0, %l3	! row < numOfDigits()	

	bge	End_Loop1
	nop

Inner_Loop:

	mov	%i3, %o0	! mov borderChar

	call	printChar	! printChar(borderChar)

	inc	%l1		! col++

	cmp	%l1, %l4	! col < numOfDigits()*2+size

	bl	Inner_Loop
	nop



End_Loop1:
	mov	NL, %o0
	call	printChar	! printChar(borderChar)
	inc 	%l0

	cmp	%l0, %l3	! row < numOfDigits
	bl	Outer_Loop
	nop

Outer_Loop2:
	clr	%l0		! row =0
	cmp 	%l0, %i0	! row < size
	
	bge	End_Loop22	! *********End of 2nd large nested loop
	nop

Inner_Loop2:

	clr	%l2		! bordercnt = 0
	cmp	%l2, %l3	! bordercnt < numOfDigits

	bge	End_Loop22	! End of 2nd nested loop inside
	nop

PrintChar_InnerLoop2:

	mov	%i3, %o0
	
	call	printChar	! printChar(borderChar)
	nop

	inc	%l2		! borderCnt++

	cmp	%l2, %l3	! compare again
	
	bl	PrintChar_InnerLoop2	!Loop again	
	nop

End_Loop22:

	clr	%l1		! col = 0
	cmp	%l1, %i0	! col < size

	bge	End_Loop23	
	nop

Inner_Loop22:

	sub	%i0, %l1, %l5	! row = (size - col)
	sub	%l5, 1, %l5	! row = (size-col-1)

	cmp	%l0, %l1	! if(row == col)

	be	PrintXChar	! printChar(xChar)
	nop

	cmp	%l0, %l5	! if(row==size-col-1)

	be	PrintXChar	! printChar(xChar)
	nop

PrintFiller:
	mov	%i2, %o0
	call	printChar
	nop

	ba	End_ifelse
	nop

PrintXChar:
	mov	%i1, %o0
	call	printChar
	nop

End_ifelse:

	inc	%l1		! col++
	cmp	%l1, %i0	! col < size
	bl	Inner_Loop22	
	nop

Inner_Loop23:
	
	clr	%l2		! borderCnt = 0
	cmp	%l2, %l3	! borderCnt < numOfDigits

	bge	End_Loop23	
	nop

PrintBorderChar:

	mov	%i3, %o0
	call	printChar
	nop

	inc	%l2

	cmp	%l2, %l3	! compare again
	bl	PrintBorderChar
	nop

End_Loop23:
	mov	NL, %o0
	call	printChar
	nop

	inc	%l0
	cmp	%l0, %i0
	bl	Inner_Loop2	!Return to the beginning
	nop

End_Side:
	clr	%l0

	mov	%l3, %o0
	mov	2, %o1
	call	.mul
	nop

	mov	%o0, %l6	! numOfDigits*2
	add	%i0, %l6, %l6	! size+numOfDigits*2

	cmp	%l0, %l3	! row < numOfDigits
	bge	EndFinal
	nop

Inner_final:
	
	clr	%l1		! col = 0

	cmp	%l1, %l6	! col<numOfDigits*2+size
	bge	End_LoopFinal	
	nop

PrintBorderFinal:

	mov	%i3, %o0

	call	printChar
	nop

	inc	%l1		!col++

	cmp	%l1, %l6	! col<numOfDigits*2+size
	bl	PrintBorderFinal
	nop

End_LoopFinal:
	mov	NL, %o0
	call	printChar
	nop

	inc	%l0

	cmp	%l0, %l3	! row < numOfDigits
	bl	Inner_final
	nop

EndFinal:
	ret
	restore










	















	








	


