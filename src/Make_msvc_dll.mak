# USAGE:
#  Build debug version:		nmake
#  Build release version:	nmake nodebug=1

############################################################################
# PROJECT SETTINGS.

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

DLLDEF 		= libXpm.def

RESSRCS =
LIBS = gdi32.lib

OUTPUT_NAME = libXpm
OUTPUT = $(OUTPUT_NAME).dll

DEFINES =	/D_CRT_SECURE_NO_WARNINGS=1 \
		/DFOR_MSW=1

INCLUDES =	/I ..\include\X11

CCFLAGS =	$(DEFINES) $(INCLUDES) /wd 4996
CPPFLAGS =	$(DEFINES) $(INCLUDES)

LINKFLAGS =	/MAP:libXpm.map

!ifdef USE_STATIC_CRT
CVARS =		$(cvarsmt)
!else
CVARS =		$(cvarsdll)
DEFINES =	$(DEFINES) /D_BIND_TO_CURRENT_VCLIBS_VERSION=1
!endif

############################################################################
# WINDOWS BUILD SETTINGS.

APPVER = 5.0
TARGET = WINNT
TARGETLANG = LANG_JAPANESE
_WIN32_IE = 0x0600
!INCLUDE <Win32.Mak>

############################################################################
# DON'T CHANGE BELOW.

OBJS1 = $(SRCS:.cpp=.obj)
OBJS = $(OBJS1:.c=.obj)
RESOBJS = $(RESSRCS:.rc=.res)

# TARGETS

build : $(OUTPUT)

clean :
	del /F *.obj
	del /F *.res
	del /F *.exe
	del /F *.exe.manifest
	del /F *.dll
	del /F *.dll.manifest
	del /F *.pdb
	del /F tags

tags: *.c *.h
	ctags -R . ..\include

rebuild : clean tags build

.PHONY: build clean rebuild

.c.obj ::
	$(CC) $(cdebug) $(cflags) $(CVARS) $(CCFLAGS) /c $<

.cpp.obj ::
	$(CC) $(cdebug) $(cflags) $(CVARS) $(CPPFLAGS) /c $<

$(OUTPUT_NAME).exe : $(OBJS) $(RESOBJS)
	$(link) $(ldebug) $(guilflags) $(guilibs) \
		/OUT:$@ $(LINKFLAGS) $(OBJS) $(RESOBJS) $(LIBS)
	IF EXIST $@.manifest \
	    mt -nologo -manifest $@.manifest -outputresource:$@;1

$(OUTPUT_NAME).dll : $(OBJS) $(RESOBJS) $(DLLDEF)
	$(link) /NOLOGO $(ldebug) $(dlllflags) $(conlibs) \
		/OUT:$@ /DEF:$(DLLDEF) $(LINKFLAGS) $(OBJS) $(RESOBJS) $(LIBS)
	IF EXIST $@.manifest \
	    mt -nologo -manifest $@.manifest -outputresource:$@;2

