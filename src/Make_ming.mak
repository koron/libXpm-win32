SRCS =	\
	Attrib.c \
	CrBufFrI.c \
	CrDatFrI.c \
	CrIFrBuf.c \
	CrIFrDat.c \
	Image.c \
	Info.c \
	RdFToBuf.c \
	RdFToDat.c \
	RdFToI.c \
	WrFFrBuf.c \
	WrFFrDat.c \
	WrFFrI.c \
	create.c \
	data.c \
	hashtab.c \
	misc.c \
	parse.c \
	rgb.c \
	scan.c \
	simx.c

CFLAGS =	-I../include/X11 -I. \
		-D_CRT_SECURE_NO_WARNINGS=1 \
		-D_BIND_TO_CURRENT_VCLIBS_VERSION=1 \
		-DFOR_MSW=1
OBJS = $(subst .c,.o,$(SRCS))

CC = gcc
AR = ar

all : libXpm.dll libXpm.a
.c.o ::
	$(CC) $(CFLAGS) -c $<

libXpm.dll : $(OBJS)
	$(CC) -shared -o $@ $(OBJS) -lgdi32

libXpm.a : $(OBJS)
	$(AR) r $@ $?

clean :
	rm -f *.o *.dll *.a

