\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattan}[2015/02/27 Reports of the Grattan Institute, Melbourne]

\LoadClass[a4paper,11pt,titlepage,headings=big,chapterprefix=false,headsepline,
parskip=half-,twocolumn,numbers=noenddot]{scrreprt}
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
\RequirePackage{microtype}
%% defaults are far too flamboyant. Indeed, zero protrusion with the 
%% Helvetica font appears to be protruding slightly (even though it 
%% is simply flush with the box).
%% encoding = T1 as in \usepackage[T1]{fontenc}
\SetProtrusion
   [ name     = T1-phv,      % the name is optional
     load     = T1-default ] % first load `T1-default` settings
   { encoding = T1,
     family   = phv }        % use for Helvetica family
   {
     \textendash = {-25, }, \textemdash = {-25, }  % cancel out left protrusion
   }
% ------
% Grattan colors
\definecolor{Orange}{HTML}{F68B33}
\definecolor{DarkOrange}{HTML}{D4582A}
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

% No widows
\RequirePackage[all]{nowidow}

% Arial font
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
%\RequirePackage{uarial}
\RequirePackage[scaled]{helvet}
  \renewcommand{\familydefault}{\sfdefault}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{newfloat}
\RequirePackage{caption}
% Cross references.
\RequirePackage{varioref}
% \RequirePackage{navigator}
% \newcommand\Chapter[1]{%
%   \chapter[\protect\jumplink{ch\thechapter}{#1}]{#1}%
%   \outline[fit=fitv]{1}[ch\thechapter]{#1}%
% }
\RequirePackage[colorlinks,colorlinks = true, urlcolor=blue, linkcolor=black,citecolor=blue]{hyperref}
\RequirePackage{cleveref}

% Make url formatting the same
\urlstyle{same}

\DeclareCaptionFont{Orange}{\color{Orange}}
\DeclareCaptionJustification{nohyphen}{\hyphenpenalty=10000}
\captionsetup{justification=nohyphen, singlelinecheck=false}

% Boxes
\crefname{boxe}{Box}{Boxes}
\Crefname{boxe}{Box}{Boxes}
\DeclareFloatingEnvironment[listname={List of boxes}, name = {Box}]{boxe}
\mdfdefinestyle{GrattanFrameBox}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }
    
\mdfdefinestyle{GrattanFrameBoxUltra}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }
    
% The smallbox is a box intended for onecolumn.
\newenvironment{smallbox}[3][p]{%
\setlength{\currentparskip}{\parskip}% save the value
\begin{boxe}[#1]
\vfill
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\parskip}{\currentparskip}% restore the value
\captionsetup{labelfont={bf,Orange},font={bf,Orange},format=plain,justification=justified,singlelinecheck=false}
\caption{#2}\label{#3}
\vspace{-1.5ex}
}{\end{mdframed}\vfill\end{boxe}} 



% Big boxes -- over the whole page
% It is recommended to surround this with an \afterpage{% 
\newenvironment{bigbox}[2]{\onecolumn\setlength{\currentparskip}{\parskip}
\begin{boxe}
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\columnsep}{10mm}
\begin{multicols}{2}
\setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}%
 } {\end{multicols}\end{mdframed}\end{boxe}\twocolumn}

% dbl floats
\newenvironment{bigbox*}[2]{%
  \setlength{\currentparskip}{\parskip}
  \@dblfloat{boxe}%
  \begin{mdframed}[style=GrattanFrameBox]
  \setlength{\columnsep}{10mm}
  \begin{multicols}{2}
  \setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}%
}{%
  \end{multicols}\end{mdframed}
  \end@dblfloat
}
 
\newenvironment{ultrabox}[2]{\onecolumn\setlength{\currentparskip}{\parskip}
\begin{boxe}
\pagecolor{OrangeBackground}
\begin{mdframed}[style=GrattanFrameBoxUltra]%
\setlength{\columnsep}{10mm}
\begin{minipage}[t][\textheight][t]{\textwidth} % textheight
\begin{multicols}{2}
\setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=justified,singlelinecheck=false}
 \caption{#1}\label{#2}%
 } {\end{multicols}\end{minipage}\end{mdframed}\end{boxe}%
 \clearpage\twocolumn\nopagecolor}
 

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

\newcommand{\source}[1]{\footnotesize\textit{Source:~#1}}
\newcommand{\notes}[1]{\footnotesize\textit{Notes:~#1}}

\setkomafont{disposition}{\color{Orange}}
\addtokomafont{chapter}{\bfseries\Large}
\addtokomafont{section}{\bfseries\normalsize}
\addtokomafont{subsection}{\bfseries\normalsize}
\addtokomafont{subsubsection}{\normalsize}

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

  
\renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{1.25em}}

  
% --------------
%
% Grattan twocolumn
%
%---------------

% N.B. geometry must be after hyperref, and hence cleveref


\RequirePackage[landscape,twocolumn,
% orig Word specify 2.3 and 2.5
left=2.75cm,right=2.75cm
]{geometry}
  %\addtolength{\columnwidth}{50pt}
  \setlength{\columnsep}{15mm}  
  %\addtolength{\columnwidth}{0.2\columnwidth}

% Ensures hyperlinked chapter headings refer to their referent headings
% not the preceding baseline
\RequirePackage{etoolbox}
% Add extra hyper target for chapter: chapter..\thechapter
\renewcommand*{\chapterformat}{%
  \mbox{\raisebox{25pt}[0pt][0pt]{\hypertarget{chapter..\thechapter}{}}% Add 
    \chapappifchapterprefix{\nobreakspace}\thechapter\hspace{1em}\autodot\enskip}%
}

% Update \addcontentsline to jump to new hyper target _only_ if \chapter is used
\patchcmd{\addcontentsline}% <cmd>
  {\Hy@writebookmark}% <search>
  {\ifnum\pdfstrcmp{chapter}{#2}=0 % Chapter mark
     \edef\@currentHref{chapter..\thechapter}%
   \fi
   \Hy@writebookmark}% <replace>
  {}{}% <success><failure>

  
 % Requests forcefully that figures refrain from
% appearing in the first column.  This will fail
% should a \clearpage be experienced.
  \g@addto@macro\@floatplacement{%
  \if@firstcolumn
  \global\@colnum\z@
  \fi
  }
  
%% ---------------------------------
%  Headers and footers
%% ---------------------------------
\RequirePackage[headsepline=1pt,plainheadsepline,footsepline=1pt,plainfootsepline]{scrlayer-scrpage}

\addtolength{\textheight}{40pt}
\addtolength{\footskip}{-10pt}

\clearscrheadings
\clearscrplain
\clearscrheadfoot
% -------
% Heads and footers
%
\newcommand{\classification}{}
% Avoid spaces or newlines in the following commands' arguments: they 
% may cause errors.
% Furthermore, optional arguments are required: they appear in Chapter 
% heading pages. Leaving them out will reset the titles on pages with 
% \chapter{}
\lehead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
\lohead[\normalfont\textcolor{theGrey}{\mytitle}]{\normalfont\textcolor{theGrey}{\mytitle}}
\cehead[\classification]{\classification}
\cohead[\classification]{\classification}
\ifoot[{\textcolor{theGrey}{\normalfont Grattan Institute 2016\phantom{\Large X}}}]{\textcolor{theGrey}{\normalfont Grattan Institute 2016\phantom{\Large X}}}
\cfoot[\classification]{\classification}
\ofoot[\normalfont\textcolor{theGrey}{\thepage}]{\normalfont\textcolor{theGrey}{\thepage}}

\setkomafont{headsepline}{\color{Orange}}
\setkomafont{footsepline}{\color{Orange}}

\pagestyle{scrheadings}
\RequirePackage{eso-pic}
%% Title pages
\newtoggle{makefullpicture}
\togglefalse{makefullpicture}

\DeclareOption{fullpicture}{
  \toggletrue{makefullpicture}
}

%% For a full picture:
\iftoggle{makefullpicture}{
	\newcommand\BackgroundPic{%
	\put(0,0){%
	\parbox[b][\paperheight]{\paperwidth}{%
	\vfill
	\centering
	% Amend
	%\includegraphics[width=\paperwidth,keepaspectratio]{./FrontPage/GrattanSVGLogo}
	\vfill
	}}}

}{
%% For a logo only:
	\newcommand\BackgroundPic{%
	\put(0,0){%
	\parbox[b][\paperheight]{\paperwidth}{%
	\hfill
	% // Do nothing
	% \includegraphics[width=0.2\paperwidth,keepaspectratio]{./FrontPage/GrattanSVGLogo}
	\vfill
	}}}
}

\ProcessOptions\relax

\RequirePackage{epstopdf}
\newcommand{\logoskip}{\par\vspace{16pt}}
\newcommand{\includegraphicsmaybe}[1]{\IfFileExists{#1}{\includegraphics{#1}}{\includegraphics{dummy.pdf}}}
\newcommand{\noimage}{%
  \setlength{\fboxsep}{-\fboxrule}%
  \fbox{\phantom{\rule{150pt}{100pt}}}% Framed box
}
\patchcmd{\Gin@ii}
  {\begingroup}% <search>
  {\begingroup\renewcommand{\@latex@error}[2]{\noimage}}% <replace>
  {}% <success>
  {}% <failure>


\newcommand*{\titleTH}{\begingroup % Create the command for including the title page in the document
\raggedleft % Right-align all text
\vfil
\phantom{.}\hfill 
\includegraphics[width=0.225\paperwidth,keepaspectratio]{./FrontPage/GrattanSVGLogo}
\vspace{30pt}
\vfil % Whitespace at the top of the page

{\bfseries\textcolor{Orange}{\fontsize{30}{30}\selectfont \mytitle}}\\[\baselineskip] % Title page font size
%% This is a working paper.
{\Large {Grattan Insitute Working Paper}}\\[2\baselineskip] % Tagline or further description

{\LARGE \myauthor}

\vfill% Whitespace at the bottom of the page
\endgroup}
  
\AtBeginDocument{%
\let\mytitle\@title
\let\myauthor\@author
% TitlePage
\onecolumn
\AddToShipoutPicture*{\BackgroundPic}
\phantom{.}\hfill\titleTH
\ClearShipoutPicture
\clearpage
\twocolumn
%
% Following page.
  \subsection*{Grattan Institute Support}
  %\begin{minipage}[t][0.7\textheight][t]{\columnwidth}
  \begin{minipage}{\columnwidth}
  \begin{multicols}{2}
  \textbf{\textcolor{theGrey}{Founding members}}\logoskip
  \begin{center}
  \includegraphics[width=4cm]{./logos/aus-gov-logo-stacked-black.eps}\logoskip
  \includegraphics[width=3.5cm]{./logos/Vic_Gov_Logo.eps}\logoskip
  \includegraphics[width=3.5cm]{./logos/UOM-Pos_S_PMS.eps}\logoskip
  \includegraphics[width=3.5cm]{./logos/Bhp.pdf}
  \end{center}
  \columnbreak
  
  \textbf{\textcolor{theGrey}{Program support}}
  
  {\footnotesize Higher Education}
  \begin{center}
  \includegraphics[width=2.5cm]{./logos/TMF_logo_green.eps}
  \end{center}
  \textbf{\textcolor{theGrey}{Affiliate Partners}}\\[3pt]
  {\footnotesize%
  Google \\[3pt]
  Origin Foundation
  }\\[8pt]
  \textbf{\textcolor{theGrey}{Senior Affiliates}}\\[3pt]
  {\footnotesize
  EY\\[3pt]
  PwC\\[3pt]
  Stockland\\[3pt]
  The Scanlon Foundation\\[3pt]
  Wesfarmers
  }\\[8pt]
  \textbf{\textcolor{theGrey}{Affiliates}}\\[3pt]
  {\footnotesize
  Ashurst\\[3pt]
  Corrs\\[3pt]
  Deloitte\\[3pt]
  Jacobs\\[3pt]
  Mercy Health\\[3pt]
  Sinclair Knight Merz\\[3pt]
  Urbis\\[3pt]
  Westpac
  }
  \end{multicols}
  \end{minipage} 
  \vfill
  \phantom{.}
  \eject
  %\subsection*{Grattan Institute Support}
  \input{Acknowledgements}
  \twocolumn
}

% Table of contentss
\setcounter{tocdepth}{0}

\RequirePackage{multicol}
\newlength{\currentparskip}

% Designing the overview
% ---
% We define a new environment that take as its contents the text of the 
% overview, placing it with a chapter* heading 'Overview' all on the same
% page. 
\newenvironment{overview}[1][]%
  {\onecolumn\vtop to 0pt\bgroup\vspace{#1}\chapter*{Overview}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}
  
\newenvironment{overview*}[1][]%
  {\onecolumn\vtop to 0pt\bgroup\vspace{#1}\chapter*{\phantom{Overview}}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}
  
\newenvironment{summary}%
  {\onecolumn\vtop to 0pt\bgroup\vspace{-25pt}\chapter*{Summary}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}
  
\newenvironment{onepager}[1]%  
  {\onecolumn\vtop to 0pt\bgroup\vspace{-25pt}\chapter*{#1}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}


% Bibliography
\RequirePackage[british]{babel}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=authoryear-ibid,ibidtracker=strict, autocite=footnote]{biblatex}
\renewcommand*{\bibfont}{\raggedright}
\DeclareLanguageMapping{british}{british-apa}


%% Bibliography formatting
% separating entries
\setlength\bibitemsep{1.5\itemsep}
% format bibliography
\renewcommand*{\bibfont}{\small}
\DeclareFieldFormat{url}{\url{#1}}

%% Citation tweaking
\DeclareFieldFormat{titlecase}{#1}
\setlength\bibhang{.5in}
\renewcommand*{\bibnamedash}{%
  \ifdimless{\leftmargin}{0.75em}
    {\mbox{\textemdash\space}}
    {\makebox[\leftmargin][l]{%
       \ifdimless{\leftmargin}{1.25em}
         {\textendash}
         {\rule{0.8\bibhang}{.2pt}}}}}
% Hyperlinks entire citation label for most citaiton commands 
% http://tex.stackexchange.com/questions/15951/hyperlink-name-with-biblatex-authoryear-biblatex-1-4b
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}

\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}

\savebibmacro{cite}
\savebibmacro{textcite}

\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}

\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}

% The following lines give the correct footcite Author (Year) but make the ibid erroneous
% Author (ibid) % use ifciteibid
\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\boolfalse{cbx:parens}}
  {\usebibmacro{citeindex}%
  \ifciteibid{Ibid.}{%  % for ibidem
   \iffirstcitekey
     {\setcounter{textcitetotal}{1}}
     {\stepcounter{textcitetotal}%
      \textcitedelim}%
   \usebibmacro{textcite}}%
   }
  {\ifbool{cbx:parens}
     {\bibcloseparen\global\boolfalse{cbx:parens}}
     {}}
  {\usebibmacro{textcite:postnote}}
\newcommand{\gcite}[1]{{\citeauthor{#1} (\citedate{#1})}}

\RequirePackage{tocloft}
\renewcommand{\cftchapfont}{\normalsize}
\renewcommand{\cftchapdotsep}{.}
\AtBeginDocument{\renewcommand{\contentsname}{Table of contents}}
\newcommand{\contentspage}{%
\onecolumn
\begin{multicols}{2}
\phantom{.}
\vfill
\columnbreak
\tableofcontents
\end{multicols}
\clearpage
\listoffigures
% This is necessary for the box list to actually appear
\setcounter{tocdepth}{2}
\listofboxes
\twocolumn%
}


