SRC =	Attrib.c CrBufFrI.c CrDatFrI.c CrIFrBuf.c CrIFrDat.c Image.c Info.c \
	RdFToBuf.c RdFToDat.c RdFToI.c WrFFrBuf.c WrFFrDat.c WrFFrI.c \
	create.c data.c hashtab.c misc.c parse.c rgb.c scan.c simx.c

OBJ = $(SRC:.c=.obj)

CFLAGS = /nologo /I../include/X11 /DFOR_MSW=1 /Ox /MD
LFLAGS = /NOLOGO

!IFDEF OPT
CFLAGS = $(CFLAGS) /GL
LFLAGS = $(LFLAGS) /LTCG
!ENDIF

############################################################################

default: libXpm.lib

clean:
	-DEL /F $(OBJ)
	-DEL /F libXpm.lib
	-DEL /F libXpm.exp
	-DEL /F libXpm.map

libXpm.lib: $(OBJ)
	LIB $(LFLAGS) $(OBJ) /OUT:libXpm.lib