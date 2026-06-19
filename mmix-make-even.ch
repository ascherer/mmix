@x
@* Index.
@y
@* Names of the sections.

\vskip2ex

  \def\note#1#2.{\quad{\eightrm#1~{\sevenrm\pdfnote#2.}.}}
  \def\Q{\note{Cited in section}} % crossref for mention of a section
  \def\Qs{\note{Cited in sections}} % crossref for mentions of a section
  \def\U{\note{Used in section}} % crossref for use of a section
  \def\Us{\note{Used in sections}} % crossref for uses of a section
  \def\I{\par\hangindent 2em\noindent}\let\*=*

\def\fin{\ifacro \message{Section names:} \let\Xpdf\X
  \def\note##1##2.{\quad{\eightrm##1~{\sevenrm\pdfnote##2.}.}}
  \def\Q{\note{Cited in section}} % crossref for mention of a section
  \def\Qs{\note{Cited in sections}} % crossref for mentions of a section
  \def\U{\note{Used in section}} % crossref for use of a section
  \def\Us{\note{Used in sections}} % crossref for uses of a section
  \def\I{\par\hangindent 2em\noindent}\let\*=*
  %\def\rlhead{NAMES OF THE SECTIONS} % running left headline
  %\let\rrhead=\rlhead % running right headline
  %\output={\normaloutput\page\rightheadline\leftheadline}
  \setpage \startpdf
  \def\outsecname{Names of the sections}
  \ifpdflua \makebookmarks \countsections
    %\pdfdest name {NOS} fith
    %\pdfoutline goto name {NOS} count -\the\countNOS {\outsecname}
  \else \special{pdf: outline -1 << /Title (\outsecname)
      /Dest [ @@thispage /FitH @@ypos ] >>}\fi
  \def\X##1:##2\X{\Xpdf##1:##2\X \firstsecno##1.%
    %{\makeoutlinetoks##2\outlinedone}%
    %\ifpdflua \pdfoutline goto num \the\toksA \expandafter{\the\toksE}
    %\else \special{pdf: outline 0 << /Title (\the\toksE)
        %/A << /S /GoTo /D (\romannumeral\the\toksA) >> >>}
    \fi}
  %\readsections
  \fi}

\readsections
@z
