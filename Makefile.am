# Daniel Stone disowns all copyright on this file; no warranty is given as to its
# suitability or otherwise.

SUBDIRS = src sxpm cxpm

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = xpm.pc
MAINTAINERCLEANFILES = ChangeLog INSTALL
EXTRA_DIST = \
	xpm.PS.gz \
	CHANGES \
	COPYRIGHT \
	FAQ.html \
	FILES \
	README.AMIGA \
	README.html \
	README.MSW


.PHONY: ChangeLog INSTALL

INSTALL:
	$(INSTALL_CMD)

ChangeLog:
	$(CHANGELOG_CMD)

dist-hook: ChangeLog INSTALL
