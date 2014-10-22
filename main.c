/*
 * Filename: main.c
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: C main file that initializes all functions used.
 * Date: 10/11/14
 * Sources of Help: Tutors, lecture notes, CforProgrammers.com 
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

/* Local Headers */
#include "pa1.h"
#include "strings.h"

/*
 * Function name: main()
 * Function prototype: int main(int argc, char *argv[])
 * Description: C main driver which calls C and SPARC assembly routines to
 * print out to stdout an X shape with bordering.
 *
 * Parameters: int x_size, int x_char, int filler_char, int border_char
 * Side Effects: Outputs a visual x shape with bordering chosen chars
 * Error Conditios: arguments chosen are not within the allowed range
 * of ANSCI-II chars
 * Return Value: 0 indicating successful execution
 *
 *
 */



int main(int argc , char *argv[])
{
    /*Number of arguments needed for the 
     * program
     */
    int ARGS_NUM = 5;

     /*
     * Error indicator
     */
    int ERROR = 0;
    int errorOne = 0;
    int errorTwo = 0;
    int errorThree = 0;
    int errorFour = 0;

    if (argc != ARGS_NUM)
    { 
      (void) fprintf(stderr, STR_USAGE);
      ERROR++;
      
      return 1;

    }

    long firstArg = strToLong(argv[1], BASE);
    long secondArg = strToLong(argv[2], BASE);
    long thirdArg = strToLong(argv[3], BASE);
    long fourthArg = strToLong(argv[4], BASE);

    

    if (errno != 0)
    {
      ERROR++;
    }

   /*
    * Check range of first arg
    */

   if ((checkRange(firstArg, X_SIZE_MIN, X_SIZE_MAX)== 0) && ERROR == 0)
   {
   
      (void) fprintf(stderr, STR_ERR_XSIZE_RANGE, firstArg, X_SIZE_MIN, X_SIZE_MAX);

      errorOne++;
   }

   /*
    * check first arg is even
    */

  if (isEven(firstArg) == 0)
  {
    (void) fprintf(stderr, STR_ERR_XSIZE_EVEN, firstArg);
    errorOne++;

  }

  /*
   * Check Range of X_char arg
   */

  if ((checkRange(secondArg, ASCII_MIN, ASCII_MAX) == 0) && ERROR == 0)
  {
    (void) fprintf(stderr, STR_ERR_XCHAR_RANGE, secondArg, ASCII_MIN, ASCII_MAX);
    errorTwo++;
  }

 
 /*
  * Check Range of filler char
  */
  if ((checkRange(thirdArg, ASCII_MIN, ASCII_MAX) == 0) && ERROR == 0)
  {
    (void) fprintf(stderr, STR_ERR_FILLERCHAR_RANGE, thirdArg, ASCII_MIN, ASCII_MAX);
    errorThree++;
  }


/*
 * Checks if second and third args are the same
 */
  if (secondArg == thirdArg)
  {
    (void) fprintf(stderr, STR_ERR_XCHAR_FILLERCHAR_DIFF, secondArg, thirdArg);
    ERROR++;

  }

  /*
   *
   * Checks range of fourth argument
   */

  if ((checkRange(fourthArg, ASCII_MIN, ASCII_MAX) == 0) && ERROR == 0)
  {
    (void) fprintf(stderr, STR_ERR_BORDERCHAR_RANGE, fourthArg, ASCII_MIN, ASCII_MAX);
    errorFour++;
  }

  /*
   * Checks if second and fourth are the same, outputs error if they are
   */

  if (secondArg == fourthArg)
  {
    (void) fprintf(stderr, STR_ERR_XCHAR_BORDERCHAR_DIFF, secondArg, fourthArg);
    ERROR++;

  }

   

  if(ERROR == 0 && errorOne == 0 && errorTwo == 0
          && errorThree == 0 && errorFour == 0 )
  {
    displayX(firstArg, secondArg, thirdArg, fourthArg);  
  }

  else {

   return 1;

   }

return 0;


}



      
   



