/*
 * Filename: strToLong.c
 * Author: Eric Tran
 * Userid: cs30xjy
 * Description: Function that converts strings to the
 * long format and returns that number value
 * Date: 10/11/14
 * Sources of Help: CforProgrammers.com, man strtol
 *                  
 *
 */

#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include "strings.h"
#include "pa1.h"



long strToLong( char *str, int base )
{

  /* Variable declaration */
  char *endptr;
  errno = 0;            
  long num = 0;

  /* function call */
  num = strtol( str, &endptr, base);

  return num;

}
    



    

  

