#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright (c) 2014 Joyent, Inc.  All rights reserved.
#

LIBRARY =	libvarpd.a
VERS =		.1
OBJECTS =	libvarpd.o \
		libvarpd_client.o \
		libvarpd_door.o \
		libvarpd_overlay.o \
		libvarpd_prop.o \
		libvarpd_plugin.o \
		libvarpd_util.o

include ../../../Makefile.lib

LIBS =		$(DYNLIB) $(LINTLIB)
LDLIBS +=	-lc -lavl -lumem -lidspace
CPPFLAGS +=	-I../common

SRCDIR =	../common

.KEEP_STATE:

all:	$(LIBS)

lint:	lintcheck

include ../../../Makefile.targ
