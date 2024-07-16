% This material goes at the beginning of all MMIXware CWEB files

\def\topofcontents{
  \leftline{\sc\today\ at \hours}\bigskip\bigskip
  \centerline{\titlefont\title}}

\font\ninett=cmtt9
\def\botofcontents{\vskip 0pt plus 1filll
    \ninerm\baselineskip10pt
\noindent Editor's Note: The present variant of this {\ninett MMIX}ware file
has been heavily modified with an associated change file.  None of these
modifications have been approved by Prof.~Knuth and neither he nor
Prof.~Ruckert take any responsibility for this incarnation.
\smallskip\noindent Consult the online project
\pdfURL{{\ninett https://github.com/ascherer/mmix}}{https://github.com/ascherer/mmix}
for context and rationale.
\readchanges % The following sections were changed...
\vskip 0pt plus 1filll
    \noindent\copyright\ 1999 Donald E. Knuth
    \bigskip\noindent
    This file may be freely copied and distributed, provided that
    no changes whatsoever are made. All users are asked to help keep
    the {\ninett MMIX}ware files consistent and ``uncorrupted,''
    identical everywhere in the world. Changes are permissible only
    if the modified file is given a new name, different from the names of
    existing files in the {\ninett MMIX}ware package,
    and only if the modified file is clearly identified
    as not being part of that package.
    (The {\ninett CWEB} system has a ``change file'' facility by
    which users can easily make minor alterations without modifying
    the master source files in any way. Everybody is supposed to use
    change files instead of changing the files.)
    The author has tried his best to produce correct and useful programs,
    in order to help promote computer science research,
    but no warranty of any kind should be assumed.}

\def\changedsections{\jobname.chs}
\def\readchanges{\input \changedsections}
\newread\testread \newwrite\writechanges
\openin\testread=\changedsections\relax
\ifeof\testread % First run
  \let\readchanges=\relax
  \let\CH=\ch
  \def\ch#1.{\begingroup
    \let\\=\BS \let\*=\let \let\ch=\relax
    \immediate\openout\writechanges=\changedsections
    \immediate\write\writechanges{\par\noindent\ch#1.}
    \immediate\closeout\writechanges
    \let\ch=\CH \ch#1.
    \endgroup}
\else\closein\testread % Second run
\fi
