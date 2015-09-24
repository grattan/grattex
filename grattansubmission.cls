\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattansubmission}[2015/08/29 Submissions of the Grattan Institute, Melbourne]

\LoadClass[a4paper, 11pt, chapterprefix=false, parskip=half-]{scrreprt}

\RequirePackage{cmap}
\RequirePackage{scrhack}
\RequirePackage{acronym}
\RequirePackage{makeidx}
  \makeindex
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}
\RequirePackage{tikz,adjustbox}
  \usetikzlibrary{positioning}
  \usetikzlibrary{decorations.text}
  \usetikzlibrary{decorations.pathmorphing}
  \usetikzlibrary{patterns,arrows,decorations.pathreplacing} % for waterfalls
\RequirePackage{float}
\RequirePackage{placeins}
\RequirePackage{afterpage}
% needs to be switched off for copying and pasting
\RequirePackage[activate={true,nocompatibility},final,expansion,tracking=true,kerning=true, spacing=false,selected=true,letterspace=-4]{microtype}
% Arial font looks a little bit spaced. One way to do it is to adjust the letterspace 
% option to microtype.  Another is to adjust the spaceskip
% \spaceskip=1.5\fontdimen2\font plus 1.5\fontdimen3\font
% minus 1.5\fontdimen4\font
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
% See http://tex.stackexchange.com/questions/8510/reduce-size-of-bullet-character-in-lists
% Purpose to enlarge and subsequently raise the bullet
% see also \renewcommand{\labelitemi}{\raise .5ex\hbox{\tiny$\bullet$}}
\renewcommand{\labelitemi}{\color{Orange}\parbox[c]{.5em}{\ensuremath{\bullet}}}
\renewcommand{\labelenumi}{\color{Orange}{\bfseries \arabic{enumi}.~}}
% ------
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage{tablefootnote} % for footnotes within tables
\newcommand{\myhline}{\noalign{\global\arrayrulewidth1pt}\hline
                      \noalign{\global\arrayrulewidth1pt}}


\RequirePackage{graphicx}
% Arial font
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{uarial}
  \renewcommand{\familydefault}{\sfdefault}
  

% Captions in general
\RequirePackage{caption}
\DeclareCaptionFont{theGrey}{\color{theGrey}}
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}}
% suppress hyphenation in caption
\DeclareCaptionJustification{nohyphen}{\hyphenpenalty=10000}
\captionsetup{justification=nohyphen}

\newcommand{\captionwithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false,position=top,skip=0pt}
\caption{#1}
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

\newcommand{\source}[1]{\footnotesize\textit{Source:~#1}}
\newcommand{\notes}[1]{\footnotesize\textit{Notes:~#1}}

\setkomafont{disposition}{\color{Orange}}
\addtokomafont{chapter}{\bfseries\Large}
\addtokomafont{section}{\bfseries\normalsize}
\addtokomafont{subsection}{\bfseries\normalsize}
\addtokomafont{subsubsection}{\normalsize}

% Spacing
% \RedeclareSectionCommand[
%   beforeskip=1.5\baselineskip,
%   afterskip=1.5\baselineskip]{chapter}
% \RedeclareSectionCommand[
%   beforeskip=0.5\baselineskip,
%   afterskip=1sp]{section}
% \RedeclareSectionCommand[
%   beforeskip=-.75\baselineskip,
%   afterskip=1sp]{subsection}
% \RedeclareSectionCommand[
%   beforeskip=-.5\baselineskip,
%   afterskip=1sp]{subsubsection}
% \RedeclareSectionCommand[
%   beforeskip=.5\baselineskip,
%   afterskip=-1em]{paragraph}
% \RedeclareSectionCommand[
%   beforeskip=-.5\baselineskip,
%   afterskip=-1em]{subparagraph}

  
% \renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{1.25em}}

%% BIBLIOGRAPHY
\RequirePackage[backend=biblatex, style=apa, ibidtracker=strict, autocite=footnote]{biblatex}
\renewcommand*{\bibfont}{\raggedright}