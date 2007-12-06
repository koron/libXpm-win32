# Daniel Stone disowns all copyright on this file; no warranty is given as to its
# suitability or otherwise.

SUBDIRS = src sxpm cxpm

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = xpm.pc
EXTRA_DIST = \
	xpm.pc.in \
	xpm.PS.gz \
	CHANGES \
	COPYRIGHT \
	FAQ.html \
	FILES \
	README.AMIGA \
	README.html \
	README.MSW

EXTRA_DIST += ChangeLog
MAINTAINERCLEANFILES = ChangeLog

.PHONY: ChangeLog

ChangeLog:
	(GIT_DIR=$(top_srcdir)/.git git-log > .changelog.tmp && mv .changelog.tmp ChangeLog; rm -f .changelog.tmp) || (touch ChangeLog; echo 'git directory not found: installing possibly empty changelog.' >&2)

dist-hook: ChangeLog
