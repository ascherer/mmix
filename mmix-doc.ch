@x [0] l.5
\input epsf % input macros for dvips to include METAPOST illustrations
@y
\input graphicx % input macros to include METAPOST illustrations
@z

@x [0] l.28
\def\9#1{} % this is used for sort keys in the index via @@:sort key}{entry@@>
@y
\def\fin{\par\vfill\eject % this is done when we are ending the index
  \ifpdf \ifpdflua \makebookmarks \fi\fi}
\input pdfwebtocfront
@z

@x [10] l.563
\bull\<NXOR \$X,\$Y,\0 `bitwise not-exclusive-or'.\>
@.NAND@>
@y
\bull\<NXOR \$X,\$Y,\0 `bitwise not-exclusive-or'.\>
@.NXOR@>
@z

@x [42] l.2623
$$\epsfbox{mmix.1}$$
@y
$$\includegraphics{mmix-1}$$
@z
