% Simple diary format 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diary}[2013/08/28 Diary Class]
\LoadClassWithOptions{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CITATIONS (must come after \LoadClassWithOptions 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\@internalcite\cite
\def\cite{\def\citename##1{##1}\@internalcite}
\def\shortcite{\def\citename##1{}\@internalcite}
\makeatletter
\newlength{\bibhang}
\setlength{\bibhang}{1em}
\def\@biblabel#1{}
\def\thebibliography#1{%
  \section*{%
    \refname\@mkboth{\sl\uppercase{\refname}}{\sl\uppercase{\refname}}}
  \list{\relax}{\setlength{\labelsep}{0em}
                \setlength{\itemindent}{-\bibhang}
                \setlength{\leftmargin}{\bibhang}}
  \def\newblock{\hskip .11em plus .33em minus .07em}
  \sloppy\clubpenalty4000\widowpenalty4000
  \sfcode`\.=1000\relax}
\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{; }\@ifundefined
      {b@\@citeb}{{\bf ?}\@warning
      {Citation '\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET TEXT AREA SIZE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[vcentering,dvips]{geometry}
\geometry{verbose,tmargin=1.0in,bmargin=1.0in,lmargin=1.0in,rmargin=1.0in,headsep=1.0in} % 1.0
%\geometry{papersize={8.5in,11in},total={8.5in,11in}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET SPACE BETWEEN PARAGRAPH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[parfill]{parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET PARAGRAPH INDENTATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0in} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{datetime}
%http://www.howtotex.com/packages/customize-the-date-format-in-your-latex-documents/
\newdateformat{gregorian}{\THEDAY~\monthname[\THEMONTH] \THEYEAR}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LESS MARGIN ON TOP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setlength{\voffset}{-0.75in}
\setlength{\headsep}{20pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{times}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMAGES, GRAPHICS, FIGURES AND CAPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{graphicx}
\newcommand{\figures}{figures}
\usepackage[font={small,it},labelfont=bf]{caption}
\usepackage{wrapfig}
% \wf{10}{r}{2.0in}{width=\linewidth}{annulus-domain}{\caption{Annulus domain}}
\newcommand{\wf}[6]{%
  \begin{wrapfigure}[#1]{#2}{#3}%
  \centering%
  \includegraphics[#4]{#5}
  #6%
\end{wrapfigure}}
\newcommand{\ig}[2][]{\includegraphics[#1]{#2}}
%\newcommand{\fig}{2}{%
%\begin{figure}%
%\centering%
%#1%
%\caption{#2}%
%\end{figure}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNICODE SYMBOLS IN FORMULAE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[mathletters]{ucs}
\usepackage[utf8x]{inputenc}
\usepackage{coloremoji}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HYPERREF LINKS COLORS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{hyperref}
\hypersetup{
  colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH (should come at end of diary.cls)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General
\let\mat = \mathbf
\usepackage{xfrac}
\newcommand{\onehalf}{\sfrac{1}{2}}
% Need this for cases
\usepackage{amsmath} 
\usepackage{amssymb}    % need for things like varnothing
\usepackage{cancel}
%http://tex.stackexchange.com/a/53829/13600
\usepackage[T1]{fontenc}
% Specialized symbols ranging from general to specific
\newcommand*{\dittostraight}{\textquotesingle\textquotesingle}
\let\Lap = \Delta
\let\Grad = \nabla
\newcommand{\R}{\mathbb{R}}
\newcommand{\vc}[1]{\mathbf{#1}}
\newcommand{\C}{\mathcal{C}}
\newcommand{\transpose}{{\mathsf T}}
% directional derivative
\newcommand{\dd}[2]{\frac{\partial#1}{\partial#2}}
% Defined on/Defined over: x|_{∂Ω}
\newcommand{\defon}[2]{\left.{#1}\right|_{#2}}
% **(RE)DEFINE** all \a to be \vc{a}. In the comments I reveal what I'm
% overwriting. Because of this you're likely to get mysterious errors when
% typesetting foreign words:
%
% ! LaTeX Error: \mathbf allowed only in math mode.
%
% Seems like this is used to create an accent mark \a'
\renewcommand{\a}{\vc{a}}
% Used to put a little bar under a letter
\renewcommand{\b}{\vc{b}}
% Used to spell fa\c{c}ade
\renewcommand{\c}{\vc{c}}
% Used to put a little dot under a letter
\renewcommand{\d}{\vc{d}}
\newcommand{\e}{\vc{e}}
\newcommand{\f}{\vc{f}}
\newcommand{\g}{\vc{g}}
\newcommand{\h}{\vc{h}}
% Used to make Dotless i like in Turkish
\renewcommand{\i}{\vc{i}}
% Used to make Dotless i like in Turkish
\renewcommand{\j}{\vc{j}}
% Used to spell Polish and Native American words
\renewcommand{\k}{\vc{k}}
% Used to draw an l with a stroke (Polish?)
\renewcommand{\l}{\vc{l}}
\newcommand{\m}{\vc{m}}
\newcommand{\n}{\vc{n}}
% Used to place a little 
\renewcommand{\o}{\vc{o}}
\newcommand{\p}{\vc{p}}
\newcommand{\q}{\vc{q}}
% Used to put a little "ring" ontop of a letter like \r{a} = \aa --> å
\renewcommand{\r}{\vc{r}}
\newcommand{\s}{\vc{s}}
% Used to put a "tie" (inverted U) over two letters
\renewcommand{\t}{\vc{t}}
% Little u over a letter 
\renewcommand{\u}{\vc{u}}
% Used for putting a little upside down hat on Slavic words \v{Z}eljko
%\renewcommand{\v}{\vc{v}}
\newcommand{\vv}{\vc{v}}
\newcommand{\w}{\vc{w}}
\newcommand{\x}{\vc{x}}
\newcommand{\y}{\vc{y}}
\newcommand{\z}{\vc{z}}
%\newcommand{\A}{\mat{A}}
\newcommand{\B}{\mat{B}}
%\renewcommand{\C}{\mat{C}}
\newcommand{\D}{\mat{D}}
\newcommand{\E}{\mat{E}}
\newcommand{\F}{\mat{F}}
\newcommand{\G}{\mat{G}}
%\renewcommand{\H}{\mat{H}}
\newcommand{\I}{\mat{I}}
\newcommand{\J}{\mat{J}}
\newcommand{\K}{\mat{K}}
%\renewcommand{\L}{\mat{L}}
\newcommand{\M}{\mat{M}}
\newcommand{\N}{\mat{N}}
%\newcommand{\O}{\mat{O}}
\renewcommand{\P}{\mat{P}}
%\newcommand{\R}{\mat{R}}
%\newcommand{\S}{\mat{S}}
\newcommand{\T}{\mat{T}}
\newcommand{\U}{\mat{U}}
\newcommand{\V}{\mat{V}}
\newcommand{\W}{\mat{W}}
\newcommand{\X}{\mat{X}}
\newcommand{\Y}{\mat{Y}}
\newcommand{\Z}{\mat{Z}}

\newcommand{\0}{\vc{0}}
% unit normal
\newcommand{\un}{\hat{\vc{n}}}
\newcommand{\argmin}{\mathop{\text{argmin }}}
% Bold \ell
\newcommand*\Bell{\ensuremath{\boldsymbol\ell}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLORFUL NOTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{color}
\newcommand{\alec}[1]{{\bf\textcolor[rgb]{0.2,0.8,0.2}{Alec: #1}}}
\newcommand{\greynote}[1]{\textcolor[rgb]{0.6,0.6,0.6}{#1}}
\newcommand{\todo}[1]{{\textcolor{red}{\textsc{TODO}: \emph{#1}}}}
\newcounter{question}
\newcommand{\Question}[1]%
{%
  \stepcounter{question}%
  \textbf{\textcolor[rgb]{0.9,0.5,0.3}{\textsc{Question \thequestion}:}} %
  \emph{#1}%
}
% needs to come after fontenc is included
\newcommand{\Hypothesis}[1]%
{%
  \textbf{\textcolor[rgb]{0.3,0.3,0.7}{\textsc{Hypothesis \thequestion}:}} {#1}
}
\newcommand{\Answer}[1]%
{%
  \textbf{\textcolor[rgb]{0.3,0.7,0.3}{\textsc{Answer \thequestion}:}} {#1}
}
%shortcuts
\newcommand{\Q}[1]{\Question{#1}}
\renewcommand{\H}[1]{\Hypothesis{#1}}
\newcommand{\A}[1]{\Answer{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ACCESS TITLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{verbatim}
% http://stackoverflow.com/a/2523209/148668
\makeatletter
\def\title#1{\gdef\@title{#1}\gdef\THETITLE{#1}}
\def\author#1{\gdef\@author{#1}\gdef\THEAUTHOR{#1}}
\def\date#1{\gdef\@date{#1}\gdef\THEDATE{#1}}
% Default title,author,date (must come after COLORS)
\title{\jobname~\emph{\footnotesize{\greynote{(Define \texttt{\textbackslash{}title\{\}})}}}}
\author{\footnotesize{\greynote{(Define \texttt{\textbackslash{}author\{\}})}}}
\date{\gregorian\today{}~\footnotesize{\greynote{(Define \texttt{\textbackslash{}date\{\}})}}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SET PAGE NUMBERS AND HEADER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lastpage}
\usepackage{fancyhdr}
\pagestyle{fancy}
\headheight 1.2in
\rhead{\thepage\ of \pageref{LastPage}}
\lhead{\emph{\THETITLE}\\\small{\THEAUTHOR\\\THEDATE}}
\fancyfoot{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFERENCES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\refequ}[1] {Equation~(\ref{equ:#1})} % odkaz na rovnici v zavorkach
\newcommand{\reffig}[1] {Figure~\ref{fig:#1}} % odkaz na obrazek
\newcommand{\refoutsidefig}[1] {Figure~#1} % odkaz na obrazek
\newcommand{\reftab}[1] {Table~\ref{tab:#1}} % odkaz na tabulku
\newcommand{\reflem}[1] {Lemma~\ref{lem:#1}} % odkaz na lemma
\newcommand{\refsec}[1] {Section~\ref{sec:#1}} % odkaz na sekci 
\newcommand{\refalg}[1] {Algorithm~\ref{alg:#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HORIZONTAL LINE IN TEXT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\hr}{\noindent\rule[0.5ex]{\linewidth}{1pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE, VERBATIM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{listings}
\makeatletter
\newcommand*\verbfont{\normalfont\ttfamily
\hyphenchar\font\m@ne
\@noligs}
\makeatother
\definecolor{listinggray}{gray}{0.9}
\lstset{
 basicstyle=\verbfont\footnotesize,
 language=matlab,
 upquote=true,
 frame=single,
 %identifierstyle=\ttfamily,
 keywordstyle=\color[rgb]{0,0,1},
 commentstyle=\color[rgb]{0.133,0.545,0.133},
 stringstyle=\color[rgb]{0.627,0.126,0.941},
}
\makeatletter
%% 
%% Maple definitions (c) 2008 Alexander Shapiro 
%% 
\lstdefinelanguage{Maple}% 
{morekeywords={and,assuming,break,by,catch,description,do,done,% 
elif,else,end,error,export,fi,finally,for,from,global,if,% 
implies,in,intersect,local,minus,mod,module,next,not,od,% 
option,options,or,proc,quit,read,return,save,stop,subset,then,% 
to,try,union,use,uses,while,xor,dsolve,solve,diff,eval,assign,%
constants},% 
sensitive=true,% 
morecomment=[l]\#,% 
morestring=[b]",% 
morestring=[d]"% 
}[keywords,comments,strings]% 
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pull out sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{changepage}
\usepackage[framemethod=tikz]{mdframed}
% Colored box with padding and margin
\newenvironment{pullout}
{%
  \begin{adjustwidth}{0.5in}{0.5in}%
    \begin{mdframed}[hidealllines=true,backgroundcolor=blue!10]%
}
{%
    \end{mdframed}%
  \end{adjustwidth}%
}

%% end of file
\endinput
