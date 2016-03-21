\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattansb}[2016/03/20 Small books of the Grattan Institute, Melbourne]

\LoadClass[b5paper, 11pt,headings=big,chapterprefix=false,headsepline,
parskip=half-,numbers=noenddot]{scrreprt}

\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}


\RequirePackage{varioref}
\RequirePackage[colorlinks,colorlinks = true, urlcolor=blue, linkcolor=black,citecolor=black]{hyperref}
\RequirePackage{cleveref}
% Make url formatting the same
\urlstyle{same}

\RequirePackage{booktabs}

% Must be after cleveref
\RequirePackage[headheight=22pt, tmargin=0mm, includehead]{geometry}



% ------
% Grattan colors
\definecolor{Orange}{HTML}{F68B33}
\definecolor{OrangeBackground}{RGB}{254,240,222}  % for boxes
\definecolor{Color1}{RGB}{255,224,127}
\definecolor{Color2}{RGB}{255,195,90}
\definecolor{Color3}{RGB}{246,139,51}
\definecolor{Color4}{RGB}{212,88,42}
\definecolor{Color5}{RGB}{160,34,38}
\definecolor{Color6}{RGB}{98,18,20}
\definecolor{theGrey}{HTML}{6A737B}
\definecolor{AuthorPage}{RGB}{160,34,38}
\definecolor{AuthorGrey}{RGB}{174,174,174}
\setkomafont{disposition}{\color{Orange}}
\addtokomafont{chapter}{\bfseries\Large}
\addtokomafont{section}{\bfseries\normalsize}
\addtokomafont{subsection}{\bfseries\normalsize}
\addtokomafont{subsubsection}{\normalsize}

% -----
% Grattan typeface
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{helvet}
\RequirePackage{microtype}
\LoadMicrotypeFile{helvet}
\renewcommand{\familydefault}{\sfdefault}


% ------
% Headers and footers
\RequirePackage[headsepline,plainheadsepline,footsepline,plainfootsepline]{scrlayer-scrpage}

\clearscrheadings
\clearscrplain
\clearscrheadfoot
\newcommand{\classification}{}

% \lehead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
% \lohead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
% \cehead[\classification]{\classification}
% \cohead[\classification]{\classification}
% \ifoot[{\textcolor{theGrey}{\normalfont Grattan Institute 2016\phantom{\Large X}}}]{\textcolor{theGrey}{\normalfont Grattan Institute 2016\phantom{\Large X}}}
% \cfoot[\classification]{\classification}
\ofoot[\normalfont\textcolor{theGrey}{\thepage}]{\normalfont\textcolor{theGrey}{\thepage}}

\setkomafont{headsepline}{\color{Orange}}
\setkomafont{footsepline}{\color{Orange}}
%\setheadtopline{0pt}  
\pagestyle{scrheadings}

% -----
% captions
\RequirePackage{caption}
% Captions in general
\DeclareCaptionFont{theGrey}{\color{theGrey}}
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}}
% suppress hyphenation in caption
\DeclareCaptionJustification{nohyphen}{\hyphenpenalty=10000}
\captionsetup{justification=nohyphen}

\newcommand{\captionwithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false,position=top,skip=0pt}
\caption{#1}
%\vspace{-11pt}
\captionsetup{font={small,color=theGrey}}
\caption*{#2}
}

\newcommand{\captionoffigurewithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false}
\captionof{figure}{#1}
\vspace{-11pt}
\captionsetup{font={small,color=theGrey}}
\caption*{#2}
}

% New user friendly (less typing) \Caption?
\newcommand{\Caption}[3]{\captionwithunits{#1}{#2}\label{#3}}

\RequirePackage{biblatex}

\newcommand{\source}[1]{\footnotesize\textit{Source:~#1}}
\newlength{\noteswidth}
\newlength{\LengthOfNotes}
\newcommand{\notes}[1]{\makebox[\textwidth][l]{%
\setlength{\noteswidth}{\textwidth}%
\settowidth{\LengthOfNotes}{\footnotesize\textit{Notes:}}%
\addtolength{\noteswidth}{-2\LengthOfNotes}%
\addtolength{\noteswidth}{0\tabcolsep}%
\footnotesize%
\begin{tabular}{p{\LengthOfNotes}p{\noteswidth}}
\textit{Notes:}&\textit{#1}
\end{tabular}
}}

% Spacing
\RedeclareSectionCommand[
  beforeskip=1.5\baselineskip,
  afterskip=1.5\baselineskip]{chapter}
\RedeclareSectionCommand[
  beforeskip=0.5\baselineskip,
  afterskip=1sp]{section}
\RedeclareSectionCommand[
  beforeskip=-.75\baselineskip,
  afterskip=1sp]{subsection}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=1sp]{subsubsection}
\RedeclareSectionCommand[
  beforeskip=.5\baselineskip,
  afterskip=-1em]{paragraph}
\RedeclareSectionCommand[
  beforeskip=-.5\baselineskip,
  afterskip=-1em]{subparagraph}
