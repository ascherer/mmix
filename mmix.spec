Name: mmix
Summary: The MMIX system
Version: 20110831
Release: 2
Packager: Andreas Scherer <andreas@komputer.de>
License: Copyright 1999 Donald E. Knuth
Group: Productivity/Development
URL: http://www-cs-faculty.stanford.edu/~knuth/programs
BuildRequires:
Distribution: Kubuntu 10.04 (i386)
Source0: %{name}-%{version}.tar.gz
Source1: mmix-sim.ch
Source2: mmix-pipe.ch
Source3: mmixal.ch
Source4: mmix-arith.ch
Source5: mmix-config.ch
Source6: mmix-io.ch
BuildRoot: %{_tmppath}/%{name}-%{version}-root
BuildArch: i386

%description
Here is MMIX, a 64-bit computer that will totally replace MIX in the
'ultimate' editions of 'The Art of Computer Programming' by Don Knuth.

%prep
mkdir -p %{name}-%{version}
cd %{name}-%{version}
tar xzvf %{SOURCE0}
sed "s/CFLAGS = -g/CFLAGS = -g -Wall/" -i Makefile
cp -a %{SOURCE1} .
cp -a %{SOURCE2} .
cp -a %{SOURCE3} .
cp -a %{SOURCE4} .
cp -a %{SOURCE5} .
cp -a %{SOURCE6} .

%build
make doc all mmotype mmmix
ps2pdf mmixal-intro.ps mmixal-intro.pdf
ps2pdf mmix-doc.ps mmix-doc.pdf
ps2pdf mmix-sim-intro.ps mmix-sim-intro.pdf

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/bin
cp mmix mmixal abstime mmotype mmmix $RPM_BUILD_ROOT/usr/bin
mkdir -p $RPM_BUILD_ROOT/usr/share/mmix
cp *.mms *.mmconfig *.mmix $RPM_BUILD_ROOT/usr/share/mmix
mkdir -p $RPM_BUILD_ROOT/usr/share/doc/mmix
cp *.pdf $RPM_BUILD_ROOT/usr/share/doc/mmix

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%attr(755, root, root) /usr/bin/mmix
%attr(755, root, root) /usr/bin/mmixal
%attr(755, root, root) /usr/bin/abstime
%attr(755, root, root) /usr/bin/mmotype
%attr(755, root, root) /usr/bin/mmmix
/usr/share/mmix
%doc /usr/share/doc/mmix

%post

%postun

%changelog
* Wed Nov 30 2011 Andreas Scherer <andreas_tex@freenet.de>
- Eliminate all GCC warnings
* Tue Sep 13 2011 Andreas Scherer <andreas_tex@freenet.de>
- Correct Copyright line (1993 was CWEB, not MMIX)
* Mon Sep 05 2011 Andreas Scherer <andreas_tex@freenet.de>
- Correct URL for source package
* Thu Sep 01 2011 Andreas Scherer <andreas_tex@freenet.de>
- Update for 08/2011 source drop
* Thu Aug 18 2011 Andreas Scherer <andreas_tex@freenet.de>
- Eliminate some GCC warnings
* Mon Aug 01 2011 Andreas Scherer <andreas_tex@freenet.de>
- dpkg complains about missing maintainer
* Sat Jul 23 2011 Andreas Scherer <andreas_tex@freenet.de>
- Update for 07/2011 source drop
* Wed Jun 08 2011 Andreas Scherer <andreas_tex@freenet.de>
- Update for 06/2011 source drop
* Wed May 28 2011 Andreas Scherer <andreas_tex@freenet.de>
- Update for 04/2011 source drop
* Wed Jan 19 2011 Andreas Scherer <andreas_tex@freenet.de>
- Update for 03/2010 source drop
* Sun Feb 28 2010 Andreas Scherer <andreas_tex@freenet.de>
- Update for 01/2010 source drop
* Tue May 05 2009 Andreas Scherer <andreas_tex@freenet.de>
- Update for 03/2009 source drop
* Fri May 02 2008 Andreas Scherer <andreas_tug@freenet.de>
- Create a Debian-compatible package using 'debbuild'
* Wed Sep 12 2007 Andreas Scherer <andreas_tug@freenet.de>
- Create the meta-mmix simulator
* Wed Sep 12 2007 Andreas Scherer <andreas_tug@freenet.de>
- Rely on teTeX's ctangle processor
* Sat Sep 30 2006 Andreas Scherer <andreas_tug@freenet.de>
- Update for 09/2006 source drop
* Fri Jun 09 2006 Andreas Scherer <andreas_tug@freenet.de>
- Update for 03/2006 source drop
* Fri Nov 04 2005 Andreas Scherer <andreas_tug@freenet.de>
- Initial build
