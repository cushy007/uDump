TARGET = udump.tos

CROSS = yes
LIBCMINI_INCLUDE = ../libcmini/include
LIBCMINI_BUILD = ../libcmini/build

ifeq ($(CROSS),yes)
  CROSSPREFIX=m68k-atari-mint-
else
  CROSSPREFIX=
endif

CC = $(CROSSPREFIX)gcc
LD = $(CROSSPREFIX)ld

CFLAGS = -m68000 -O2 -fomit-frame-pointer -Wall -I$(LIBCMINI_INCLUDE) -nostdlib
LDFLAGS = -s -L$(LIBCMINI_BUILD) -lcmini -nostdlib -lgcc

$(TARGET): udump.c
	$(CC) $(CFLAGS) -o $@ $(LIBCMINI_BUILD)/startup.o  $< $(LDFLAGS)

clean:
	rm -f *~ *.o $(TARGET)
