#
# Makefile template for CSE 30 -- PA1
#

#
# You need to change these next lines for each assignment
#

HEADERS		= pa1.h strings.h

C_SRCS		= main.c strToLong.c

ASM_SRCS	= isEven.s printChar.s checkRange.s numOfDigits.s displayX.s

C_OBJS		= main.o strToLong.o

ASM_OBJS	= isEven.o printChar.o checkRange.o numOfDigits.o displayX.o

OBJS		= ${C_OBJS} ${ASM_OBJS}

EXE		= pa1

#
# You should not need to change anything below this line
#

#
# Relevant man pages:
#
# man gcc
# man as
# man lint
#

GCC		= gcc
ASM		= $(GCC)
LINT		= lint

GCC_FLAGS	= -c -g -Wall -D__EXTENSIONS__
LINT_FLAGS1	= -c -err=warn
LINT_FLAGS2	= -u -err=warn
ASM_FLAGS	= -c -g
LD_FLAGS	= -g -Wall

#
# Standard rules
#

.s.o:
	@echo "Assembling each assembly source file separately ..."
	$(ASM) $(ASM_FLAGS) $<
	@echo ""

.c.o:
	@echo "Linting each C source file separately ..."
	$(LINT) $(LINT_FLAGS1) $<
	@echo ""
	@echo "Compiling each C source file separately ..."
	$(GCC) $(GCC_FLAGS) $<
	@echo ""

#
# Simply have our project target be a single default $(EXE) executable.
#

$(EXE):	$(OBJS)
	@echo "2nd phase lint on all C source files ..."
	$(LINT) $(LINT_FLAGS2) *.ln
	@echo ""
	@echo "Linking all object modules ..."
	$(GCC) -o $(EXE) $(LD_FLAGS) $(OBJS)
	@echo ""
	@echo "Done."

${C_OBJS}:      ${HEADERS}


clean:
	@echo "Cleaning up project directory ..."
	/usr/bin/rm -f *.o $(EXE) *.ln core a.out \
	    testcheckRange testisEven testnumOfDigits teststrToLong
	@echo ""
	@echo "Clean."

testcheckRange:	test.h pa1.h checkRange.s testcheckRange.c
	@echo "Compiling testcheckRange.c"
	gcc -g -o testcheckRange testcheckRange.c checkRange.s
	@echo "Done."

runtestcheckRange: testcheckRange
	@echo "Running testcheckRange"
	@./testcheckRange

testisEven: test.h pa1.h isEven.s testisEven.c
	@echo "Compiling testisEven.c"
	gcc -g -o testisEven testisEven.c isEven.s
	@echo "Done."

runtestisEven: testisEven
	@echo "Running testisEven"
	@./testisEven

testdisplayX: test.h pa1.h displayX.s testdisplayX.c printChar.s numOfDigits.s
	@echo "Compiling testdisplayX.c"
	gcc -g -o testdisplayX testdisplayX.c numOfDigits.s displayX.s
	@echo "Done."

runtestdisplayX: testdisplayX
	@echo "Running testdisplayX"
	@./testdisplayX

testnumOfDigits: test.h pa1.h numOfDigits.s testnumOfDigits.c checkRange.s
	@echo "Compiling testnumOfDigits.c"
	gcc -g -o testnumOfDigits testnumOfDigits.c numOfDigits.s checkRange.s
	@echo "Done."

runtestnumOfDigits: testnumOfDigits
	@echo "Running testnumOfDigits"
	@./testnumOfDigits

teststrToLong: test.h pa1.h strToLong.c teststrToLong.c
	@echo "Compiling teststrToLong.c"
	gcc -g -o teststrToLong teststrToLong.c strToLong.c
	@echo "Done."

runteststrToLong: teststrToLong
	@echo "Running teststrToLong"
	@./teststrToLong

testprintChar: test.h pa1.h printChar.s testprintChar.c
	@echo "Compiling testprintChar.c"
	gcc -g -o testprintChar testprintChar.c printChar.s
	@echo "Done."

runtestprintChar: testprintChar
	@echo "Running testprintChar"
	@./testprintChar

new:
	make clean
	make

