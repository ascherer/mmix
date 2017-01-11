%bcond_without tex
%bcond_without patches
%bcond_with debuginfo

Name: mmix
Summary: The MMIX system
License: Copyright 1999 Donald E. Knuth
URL: http://mmix.cs.hm.edu/

Version: 20160804
Release: 2
Packager: Andreas Scherer <andreas@komputer.de>

%if %{_vendor} == "debbuild"
Group: science
Distribution: Kubuntu 16.04 (x86_64)
%else
Group: Productivity/Scientific/Electronics
Distribution: openSUSE 42 (x86_64)
%endif

BuildRoot: %{_tmppath}/%{name}-%{version}-root
BuildArch: amd64
%if %{with tex}
BuildRequires: texlive
%endif

Source0: http://mmix.cs.hm.edu/src/%{name}-%{version}.tgz
Source1: mmix-sim.ch
Source2: mmix-pipe.ch
Source3: mmixal.ch
Source4: mmix-arith.ch
Source5: mmix-config.ch
Source6: mmix-io.ch
Source7: mmmix.ch
Source8: mmotype.ch
Source9: mmix-mem.ch

%if %{with patches}
Patch29: 0029-DRY-up-the-Makefile.patch
Patch43: 0043-Build-and-apply-shared-library.patch
%endif

%description
Here is MMIX, a 64-bit computer that will totally replace MIX in the
'ultimate' editions of 'The Art of Computer Programming' by Don Knuth.

%prep
%autosetup -c %{!?with_patches:-N}
%if %{_vendor} == "debbuild"
%{perl:for (1..9) { print "%{__cp} %{S:$_} .\n" }}
%else
%{lua:for i=1,9 do print(rpm.expand("%{__cp} %{S:"..i.."} .").."\n") end}
%endif
%if %{with patches}
%{__sed} "s/CFLAGS = -g/& -W -Wall/" -i Makefile
%else
%{__sed} "s/@d ABSTIME/& 123456789/" -i mmix-pipe.ch
%{__sed} "s/@d ABSTIME/& 123456789/" -i mmix-sim.ch
%endif
%if ! %{with debuginfo}
%{__sed} "s/CFLAGS = -g/CFLAGS = -O/" -i Makefile
%{?with_patches:%{__sed} "s/LDFLAGS =/& -s/" -i Makefile}
%endif

%build
%{__make} basic mmotype mmmix
%if %{with tex}
%{__make} doc
for i in al-intro -doc -sim-intro; do %{__ps2pdf} mmix$i.ps; done
%endif

%check
%{?with_patches:export LD_LIBRARY_PATH=.}

./mmixal -x -b 250 -l copy.mml copy.mms
./mmix copy copy.mms > copy.out
diff -u copy.mms copy.out

./mmixal -x -b 250 -l hello.mml hello.mms
./mmix -Dhello.mmb hello.mmo
printf "10000\nq" | ./mmmix plain.mmconfig hello.mmb

./mmixal -x -b 250 -l silly.mml silly.mms
./mmix -Dsilly.mmb silly.mmo
printf "10000\nq" | ./mmmix plain.mmconfig silly.mmb

%install
%{__rm} -rf %{buildroot}
%{__mkdir_p} %{buildroot}%{_bindir}
%{__cp} mmix mmixal mmotype mmmix %{buildroot}%{_bindir}
%if %{with patches}
%{__mkdir_p} %{buildroot}%{_libdir}/%{name}
%{__cp} libmmix.so %{buildroot}%{_libdir}/%{name}
%endif
%{__mkdir_p} %{buildroot}%{_datadir}/%{name}
%{__cp} *.mms *.mmconfig *.mmix %{buildroot}%{_datadir}/%{name}
%if %{with tex}
%{__mkdir_p} %{buildroot}%{_docdir}/%{name}
%{__cp} *.pdf %{buildroot}%{_docdir}/%{name}
%endif

%clean

%files
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/mmix
%attr(755,root,root) %{_bindir}/mmixal
%attr(755,root,root) %{_bindir}/mmotype
%attr(755,root,root) %{_bindir}/mmmix
%{?with_patches:%{_libdir}/%{name}/libmmix.so}
%{_datadir}/%{name}
%{?with_tex:%doc %{_docdir}/%{name}}

%post
%{?with_patches:%{__ldconfig} %{_libdir}/%{name}}

%postun
%{?with_patches:%{__ldconfig} %{_libdir}/%{name}}

%changelog
* Sat Jan 07 2017 Andreas Scherer <andreas_tex@freenet.de>
- Build shared library from common modules

* Sat Dec 31 2016 Andreas Scherer <andreas_tex@freenet.de>
- Use C99 standard types

* Thu Nov 26 2015 Andreas Scherer <andreas_tex@freenet.de>
- Conditional Build Stuff

* Thu Oct 29 2015 Andreas Scherer <andreas_tex@freenet.de>
- Fully parametrized specfile

* Fri Sep 11 2015 Andreas Scherer <andreas_tex@freenet.de>
- Do not install the utility program 'abstime'

* Wed Sep 02 2015 Andreas Scherer <andreas_tex@freenet.de>
- Build from latest release plus intermediate fixes

* Sat Aug 15 2015 Andreas Scherer <andreas_tex@freenet.de>
- Provide consistent information in URL and Source0

* Mon Jul 06 2015 Andreas Scherer <andreas_tex@freenet.de>
- Update mmix.spec by using %setup more properly

* Mon Oct 07 2013 Andreas Scherer <andreas_tex@freenet.de>
- Update for 10/2013 source drop

* Thu Sep 26 2013 Andreas Scherer <andreas_tex@freenet.de>
- Update for 09/2013 source drop

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

* Sat May 28 2011 Andreas Scherer <andreas_tex@freenet.de>
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
