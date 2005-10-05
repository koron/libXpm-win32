if BUILD_SXPM

bin_PROGRAMS = sxpm

sxpm_CFLAGS = $(SXPM_CFLAGS)

INCLUDES = -I$(top_srcdir)/include -I$(top_builddir)/include

dist_man_MANS = sxpm.1

sxpm_SOURCES = sxpm.c

sxpm_LDADD = $(XPM_LIBS) $(SXPM_LIBS) $(top_builddir)/src/libXpm.la

endif

EXTRA_DIST = \
	plaid_ext.xpm \
	plaid_mask.xpm \
	plaid.xpm
