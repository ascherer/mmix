@x
\ifx\undefined\eightpoint \input pdfwebtocfront \else
@y
\ifx\undefined\eightpoint \input pdfwebtocfront \else
\def\startpdf{\def\pagemode{/PageMode /UseOutlines}
  \ifpdflua\pdfcatalog{\pagemode}
  \else\special{pdf: docview << \pagemode >>}\fi}
@z

@x
@* Index.
@y
@z
