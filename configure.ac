AC_PREREQ(2.57)
AC_INIT([libXpm], 3.5.2, [https://bugs.freedesktop.org/enter_bug.cgi?product=xorg], libXpm)
AC_CONFIG_SRCDIR([Makefile.am])
AM_INIT_AUTOMAKE([dist-bzip2])

AM_MAINTAINER_MODE

AM_CONFIG_HEADER([config.h])

# Checks for programs.
AC_PROG_LIBTOOL
AC_PROG_CC

# Checks for pkg-config packages
PKG_CHECK_MODULES(XPM, xproto x11)
AC_SUBST(XPM_CFLAGS)
AC_SUBST(XPM_LIBS)

# Checks for header files.
AC_HEADER_STDC

# Checks for functions
AC_CHECK_FUNCS([strlcat])

# Checks for typedefs, structures, and compiler characteristics.

if test "x$GCC" = "xyes"; then
	GCC_WARNINGS="-Wall -Wpointer-arith -Wstrict-prototypes \
	-Wmissing-prototypes -Wmissing-declarations \
	-Wnested-externs -fno-strict-aliasing"
	CFLAGS="$GCC_WARNINGS $CFLAGS"
fi


PKG_CHECK_MODULES(SXPM, xt xext, build_sxpm=true, build_sxpm=false)

AM_CONDITIONAL(BUILD_SXPM, test x$build_sxpm = xtrue)

XORG_RELEASE_VERSION

AC_OUTPUT([Makefile
           src/Makefile
	   sxpm/Makefile
	   cxpm/Makefile
	   xpm.pc])
