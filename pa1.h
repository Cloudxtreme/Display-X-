/*
 * Filename: pa1.h
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Header file that defines global variables and functions to
 * be used in pa1
 * Date: 10/11/14
 * Sources of Help: TODO: List all the people, books, websites, etc. that you
 *                  used to help you write the code in this source file.
 */


#ifndef PA1_H
#define PA1_H

/* Local function prototypes for PA1 (written in Assembly or C) */

long strToLong( char* str, int base );
int checkRange( long value, long minRange, long maxRange );
void displayX( long size, long xChar, long fillerChar, long borderChar );
int isEven( long value );

#define BASE 10
#define X_SIZE_MIN 4
#define X_SIZE_MAX 5000

/*
 * See "man ascii" for ASCII char values
 */
#define ASCII_MIN 32                            /* ' ' */
#define ASCII_MAX 126                           /* '~' */
    
/*
 * void printChar( char ch );
 * int numOfDigits( long num, int base );
 *
 * Only called from an Assembly routine. Not needed in any C routine.
 * Would get a lint message about function declared but not used.
 */
    
#endif /* PA1_H */
