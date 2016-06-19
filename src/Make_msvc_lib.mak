# USAGE:
#
#  Build with MSVCRT:		nmake
#  Build without MSVCRT: 	nmake nomsvcrt=1

SRC =	Attrib.c CrBufFrI.c CrDatFrI.c CrIFrBuf.c CrIFrDat.c Image.c Info.c \
	RdFToBuf.c RdFToDat.c RdFToI.c WrFFrBuf.c WrFFrDat.c WrFFrI.c \
	create.c data.c hashtab.c misc.c parse.c rgb.c scan.c simx.c

OBJ = $(SRC:.c=.obj)

CFLAGS = /nologo /I../include/X11 /Ox /W3 \
	 /wd 4996 \
	 /DFOR_MSW=1 \
	 /D_CRT_SECURE_NO_WARNINGS=1

LFLAGS = /NOLOGO

!IFDEF OPT
CFLAGS = $(CFLAGS) /GL
LFLAGS = $(LFLAGS) /LTCG
!ENDIF

############################################################################

!IFDEF NOMSVCRT
CFLAGS = $(CFLAGS) /MT
!ELSE
CFLAGS = $(CFLAGS) /MD
!ENDIF

default: libXpm.lib

clean:
	-DEL /F $(OBJ)
	-DEL /F libXpm.lib

libXpm.lib: $(OBJ)
	LIB $(LFLAGS) $(OBJ) /OUT:libXpm.lib
