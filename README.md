# Display-X-
Written in C and SPARC Assembly

/*
 * Filename: README
 * Author: Eric Tran
 * UserId: cs30xjy
 * Date: 10/21/2014
 */

Description:
	This program takes in 4 integer arguments as input and displays an X
	pattern. These 4 integers specifies the size of the pattern, the characters
	used and the border characters. 

How To Compile:
	Navigate to the directory containing the files for PA1 and type 'make'.

How To Run:
	Type the executable name followed by the integer argument. For example:
		
			./pa1 8 32 45 35
Normal Output:
	Normal Output is printed out to stdout and should look similar in 
	format to:
	
	[cs30xjy@ieng9]:pa1:539$ ./pa1 8 32 45 35
	##########
	# ------ #
	#- ---- -#
	#-- -- --#
	#---  ---#
	#---  ---#
	#-- -- --#
	#- ---- -#
	# ------ #
	##########
	

Error Output:
	Error Output will be printed to stderr and should look similar in
	format to: 

[cs30xjy@ieng9]:pa1:565$ ./pa1

Usage:  X_size X_char filler_char border_char
    X_size      (must be within the range of [-14865856 - -13209408])
                (must be even)
    X_char      (must be an ASCII value within the range [137872 - 0])
    filler_char (must be an ASCII value within the range [0 - 0])
                (must be different than X_char)
    border_char (must be an ASCII value within the range [3 - -4198260])
                (must be different than X_char)
	
Testing the program:
	The program was tested against a individual unit test programs for
	each specific function. Only when a function worked correctly did
	I move onto the next function and tested it extensively with unit
	tests devised specifally fo that function. 
