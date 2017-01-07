#
#   Makefile for MMIXware
#

#   Be sure that CWEB version 3.0 or greater is installed before proceeding!
#   In fact, CWEB 3.61 is recommended for making hardcopy or PDF documentation.

#   If you prefer optimization to debugging, change -g to something like -O:
CFLAGS = -g -fpic
LDFLAGS = -L.
LDLIBS = -lmmix

#   Uncomment the second line if you use pdftex to bypass .dvi files:
PDFTEX = dvipdfm
#PDFTEX = pdftex

.SUFFIXES: .dvi .tex .w .ps .pdf .mmo .mmb .mms

.tex.dvi:
	tex $*.tex

.dvi.ps:
	dvips $* -o $*.ps

.w.c:
	if test -r $*.ch; then ctangle $*.w $*.ch; else ctangle $*.w; fi

.w.tex:
	if test -r $*.ch; then cweave $*.w $*.ch; else cweave $*.w; fi

.w.o:
	make $*.c
	make $*.o

.w:
	make $*.c
	make $*

.w.dvi:
	make $*.tex
	make $*.dvi

.w.ps:
	make $*.dvi
	make $*.ps

.w.pdf:
	make $*.tex
	case "$(PDFTEX)" in \
	 dvipdfm ) tex "\let\pdf+ \input $*"; dvipdfm $* ;; \
	 pdftex ) pdftex $* ;; \
	esac

.mmo.mmb:
	mmix -D$*.mmb $*.mmo

.mms.mmo:
	mmixal -x -b 250 -l $*.mml $*.mms

WEBFILES = abstime.w boilerplate.w mmix-arith.w mmix-config.w mmix-doc.w \
	mmix-io.w mmix-mem.w mmix-pipe.w mmix-sim.w mmixal.w mmmix.w mmotype.w
CHANGEFILES =
TESTFILES = *.mms silly.run silly.out *.mmconfig *.mmix
MISCFILES = Makefile makefile.dos README mmix.mp mmix.1
ALL = $(WEBFILES) $(TESTFILES) $(MISCFILES)

basic:  lib mmixal mmix

doc:    mmix-doc.ps mmixal.dvi mmix-sim.dvi
	dvips -pp 0-13 mmixal.dvi -o mmixal-intro.ps
	dvips -pp 0-8 mmix-sim.dvi -o mmix-sim-intro.ps

all:    basic mmotype mmmix

clean:
	rm -f *~ *.o *.c *.h *.tex *.log *.dvi *.toc *.idx *.scn *.ps core

lib: libmmix.so

libmmix.so: mmix-arith.o mmix-config.o mmix-io.o mmix-mem.o mmix-pipe.o
	$(CC) -shared $^ -o $@

.SECONDEXPANSION:
mmix-pipe.o mmix-sim.o: $$(subst .o,.c,$$@)
	perl -pe "s/(#define ABSTIME)/\1 `date +%s`/" -i $<
	$(CC) $(CFLAGS) -c $<

mmix-config.o: mmix-pipe.o

mmix: mmix-sim.o lib
	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS)

tarfile: $(ALL)
	tar cvf /tmp/mmix.tar $(ALL)
	gzip -9 /tmp/mmix.tar
