# MMIX 2009

## A RISC Computer for the Third Millennium

“Thirty years have passed since the MIX computer was designed [in 1969], and
computer architecture has been converging during those years towards a rather
different style of machine. Therefore it is time to replace MIX with a new
computer that contains even less saturated fat than its predecessor.” — The
successor [MMIX](https://cs.stanford.edu/~knuth/mmix.html) was developed and
published by [Donald E. Knuth](https://cs.stanford.edu/~knuth) in
**1999**. The fully documented source code is available from the
[MMIX home](https://mmix.cs.hm.edu/src/index.html) and in the book
[MMIXware: A RISC Computer for the Third
Millennium](https://cs.stanford.edu/~knuth/mmixware.html)
published by Springer-Verlag in 1999. (This book contains several chapters with
additional information not available in the electronic distribution.)

## Prerequisites

The source code of MMIX is written in accordance with the rules of the
[Literate Programming](https://cs.stanford.edu/~knuth/lp.html)
philosophy, so you need to make sure that your computer supports the
[CWEB](https://cs.stanford.edu/~knuth/cweb.html) system. The CWEB sources are
available for anonymous ftp from [Stanford
University](https://ftp.cs.stanford.edu/pub/cweb/cweb.tar.gz). Bootstrapping CWEB
on Unix systems is elementary and documented in the CWEB distribution;
pre-compiled binary executables of the CWEB tools for Win32 systems are
available from
[www.literateprogramming.com](http://www.literateprogramming.com).

## Getting Started

Details of this software can be found in the [README](README) file.

## Why have yet another project here?

DEK has passed the baton of development to the group behind “MMIX home”.
Besides several “official” releases from DEK in the form of gzipped tarballs,
they provide their working sources through a Web-accessible repository.

The present project on Github is a separate effort and holds all releases by
DEK from 1999 to 2023 in the `master` branch. Much more interesting is the
`local` branch; it provides further improvements to the MMIX sources plus a
“specfile” `mmix.spec` for building installable packages for `rpm` and `deb`
based Linux distributions with the help of the `rpmbuild` and `debbuild`
utilities respectively.

### Major features added

* Fix compiler warnings (`gcc -W -Wall -O`) with a set of changefiles
* Advanced build script `mmix.spec` for rpm and deb packaging
* Modified `Makefile` for target optimization
* Use C99/C++ types `bool`, `uint8_t` and `uint32_t`
* **New in 2023: Completely updated module structure with new header files**
* **New in 2023: Purge `ARGS` macro in preparation for C2x**
* **New in 2024: Build “shared object” `libmmix.so` (again)**

## Postscript

Recently it has come to my attention that the `local` modifications are used
in the
[Cygwin port of MMIXware](https://github.com/cygwinports-extras/mmixware).
