@x
{\eightpoint \let\ninett=\eighttt \editorsnote \vskip7mm}
@y
\def\startpdf{\def\pagemode{/PageMode /UseOutlines}
  \twodigits=\contentspagenumber \advance\twodigits by 1
  \def\pagelabels{/PageLabels << /Nums [ 0 << /S/D/St \the\twodigits >> ] >>}
  \ifpdflua\pdfcatalog{\pagemode\space\pagelabels}
  \else\special{pdf: docview << \pagemode\space\pagelabels >>}\fi}
{\eightpoint \let\ninett=\eighttt \editorsnote \vskip7mm}
@z

@x
@* Index.
@y
@z
