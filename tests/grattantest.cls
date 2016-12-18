\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grattan}[2016/10/05 Reports of the Grattan Institute, Melbourne]

\LoadClass[%
a4paper,
11pt,
titlepage,
headings=big,
chapterprefix=false,
headsepline,
twocolumn,
numbers=noenddot,
]{scrreprt}

% Continuous numbering
\RequirePackage{chngcntr}

% avoid non-discretionary hyphens 
\exhyphenpenalty=100
\RequirePackage{cmap}
\RequirePackage{scrhack}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{tikz}
\RequirePackage{adjustbox}
  \usetikzlibrary{positioning}
  \usetikzlibrary{decorations.text}
  \usetikzlibrary{decorations.pathmorphing}
  \usetikzlibrary{patterns,arrows,decorations.pathreplacing} % for waterfalls
\RequirePackage{float}
\RequirePackage{placeins}
\RequirePackage{afterpage}
\nonfrenchspacing
\RequirePackage[activate=true, expansion, final, kerning=true, spacing=true]{microtype}
\microtypecontext{spacing=nonfrench}
% http://tex.stackexchange.com/questions/303457/setprotrusion-with-helvetica-on-specific-characters
\SetProtrusion
   [ name     = T1-phv,      % the name is optional
     load     = T1-default ] % first load `T1-default` settings
   { encoding = T1,
     family   = phv }        % use for Helvetica family
   {
     \textendash = {-25, }, \textemdash = {-25, }  % cancel out left protrusion
   }
\RequirePackage{footmisc}
\RequirePackage[document]{ragged2e}
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


% Bullets and numbered items
\RequirePackage{enumitem}
% Eliminate left margin
% \setlist[itemize]{leftmargin=*}
% \setlist[enumerate]{leftmargin=*}
% See http://tex.stackexchange.com/questions/8510/reduce-size-of-bullet-character-in-lists
% Purpose to enlarge and subsequently raise the bullet
% see also \renewcommand{\labelitemi}{\raise .5ex\hbox{\tiny$\bullet$}}
\renewcommand{\labelitemi}{\color{Orange}\parbox[c]{.5em}{\small\ensuremath{\bullet}}{\normalsize\strut}}
\renewcommand{\labelenumi}{\color{Orange}{\bfseries \arabic{enumi}.~}}
% ------
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage{tablefootnote} % for footnotes within tables
\newcommand{\myhline}{\noalign{\global\arrayrulewidth1pt}\hline
                      \noalign{\global\arrayrulewidth1pt}}


\RequirePackage{graphicx}
\RequirePackage{booktabs}
% No widows
\RequirePackage[all]{nowidow}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
  
%\RequirePackage{uarial}
%  \linespread{1.04}
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
\RequirePackage[colorlinks, colorlinks = true, urlcolor=blue, linkcolor=black,citecolor=blue, hypertexnames=false, hidelinks]{hyperref}
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

\counterwithout{boxe}{chapter}
\counterwithout{footnote}{chapter}

\mdfdefinestyle{GrattanFrameBox}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=0.5\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }
    
\mdfdefinestyle{GrattanFrameBoxUltra}{%
    linecolor=Orange,
    nobreak=true, % prevents page breaking
    outerlinewidth=0.5pt,
    innertopmargin=0.5\baselineskip,
    innerbottommargin=0.5\baselineskip,
    innerrightmargin=11pt,
    innerleftmargin=11pt,
    backgroundcolor=OrangeBackground
    }

\newcommand{\@boxcaption}[1]{%
\captionsetup{labelfont={bf,Orange},font={bf,Orange},format=plain,justification=raggedright,singlelinecheck=false, skip=0ex, position=above}
\caption{#1}
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, position=above, skip=0pt}
}

% The verysmallbox is intended to be a fraction of one column.
\newenvironment{verysmallbox}[3][htb]{%
\setlength{\currentparskip}{\parskip}% save the value
\begin{boxe}[#1]
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\parskip}{\currentparskip} % restore the value
\@boxcaption{#2\label{#3}}
\RaggedRight
}{\end{mdframed}\end{boxe}} 
    
% The smallbox is a box intended for onecolumn.
\newenvironment{smallbox}[3][p]{%
\setlength{\currentparskip}{\parskip}% save the value
\begin{boxe}[#1]
\begin{minipage}[\textheight]{\linewidth}
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\parskip}{\currentparskip} % restore the value
\@boxcaption{#2\label{#3}}
\RaggedRight
}{\end{mdframed}\null\vfill\null\end{minipage}\end{boxe}} 



% Big boxes -- over the whole page
% It is recommended to surround this with an \afterpage{% 
\newenvironment{bigbox}[2]{\onecolumn\setlength{\currentparskip}{\parskip}
\begin{boxe}
\begin{mdframed}[style=GrattanFrameBox]%
\setlength{\columnsep}{33pt}
\begin{multicols}{2}
\setlength{\parskip}{\currentparskip}% restore the value
 \captionsetup{labelfont={bf,Orange}, font={bf,Orange}, format=plain,justification=raggedright,singlelinecheck=false}
 \caption{#1}\label{#2}%
 %\RaggedRight
 } {\end{multicols}\end{mdframed}\end{boxe}\twocolumn}

% dbl floats
\newenvironment{bigbox*}[2]{%
  \setlength{\currentparskip}{\parskip}
  \@dblfloat{boxe}%
  \begin{mdframed}[style=GrattanFrameBox]
  \@boxcaption{#1\label{#2}}%
  % Reduced column sep 
  \addtolength{\columnsep}{-23.8pt}%
  \begin{multicols}{2}
  \setlength{\parskip}{\currentparskip}% restore the value
  \RaggedRight
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

\newcommand{\units}[1]{%
\captionsetup{font={small,color=theGrey}}
\caption*{#1}
}

\newcommand{\captionwithunits}[2]{%
\captionsetup{format=plain,font={small,bf,theGrey},labelfont={small,bf,theGrey}, justification=raggedright,
singlelinecheck=false,position=top,skip=0pt}
\caption{#1}
\units{#2}
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

\newcommand*{\source}[1]{%
\captionsetup{format=plain, font={footnotesize, it}, skip=3pt, justification=RaggedRight, singlelinecheck=false, position=below}
\caption*{Source:\ #1}
}
\newcommand*{\notes}[1]{%
\captionsetup{format=plain, font={footnotesize, it}, skip=3pt, justification=RaggedRight, singlelinecheck=false, position=below}
\caption*{Notes:\ #1}
}

\newcommand*{\noteswithsource}[2]{%
\ifstrempty{#2}{\ClassWarning{'\noteswithsource' has second argument empty}}{}%
\captionsetup{format=plain, font={footnotesize, it}, skip=2.5pt, justification=RaggedRight, singlelinecheck=false, position=below}
\caption*{Notes:\ #1}
\caption*{Source:\ #2}
}

\newcommand*{\boxsources}[1]{\footnotesize\textit{#1}}

\setkomafont{disposition}{\color{Orange}}
\addtokomafont{chapter}{\bfseries\Large}
\addtokomafont{section}{\bfseries\normalsize}
\addtokomafont{subsection}{\bfseries\normalsize}
\addtokomafont{subsubsection}{\normalsize}

% Spacing
\RedeclareSectionCommand[
  beforeskip=1\baselineskip,
  afterskip=1\baselineskip]{chapter}
\RedeclareSectionCommand[
  beforeskip=0.5\baselineskip plus 0.25\baselineskip,
  afterskip=1sp]{section}
\RedeclareSectionCommand[
  beforeskip=0.25\baselineskip plus 0.25\baselineskip,
  afterskip=1sp]{subsection}
\RedeclareSectionCommand[
  beforeskip=0.6ex plus 1.5ex,
  afterskip=0.1ex]{subsubsection}
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
left=2.30cm,right=2.30cm,
top=2.70cm, bottom=2.65cm,
 headheight=24pt, footskip=24pt
]{geometry}

\setlength{\columnsep}{55pt}  

% Spacing between paragraphs
% <indent> <distance> <last line end space>
\setparsizes{0pt}{0.6\baselineskip plus 0.25\baselineskip minus 0.1\baselineskip}{5pt plus 1fil}

% Space between body text and footnote area:
\addtolength{\skip\footins}{1pt plus 15.5pt}

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
     \edef\@currentHref{page.\thepage}%
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

\g@addto@macro\@floatplacement{%
\if@firstcolumn
\@fpmin\textheight
\fi
}
  
%% ---------------------------------
%  Headers and footers
%% ---------------------------------
\RequirePackage[headsepline=1pt,plainheadsepline,footsepline=1pt,plainfootsepline]{scrlayer-scrpage}

% Footnote layout (koma)
% \makebox left-aligned numbers.
\deffootnote{2.0em}{1.5em}{\makebox[2.0em][l]{\thefootnotemark.\ }}
\addtokomafont{footnotereference}{\small}

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
\lehead[\normalfont\textcolor{theGrey}{\mytitle}{\huge\strut}]{\normalfont\textcolor{theGrey}{\mytitle}{\huge\strut}}
\lohead[\normalfont\textcolor{theGrey}{\mytitle}{\huge\strut}]{\normalfont\textcolor{theGrey}{\mytitle}{\huge\strut}}
\cehead[\classification]{\classification}
\cohead[\classification]{\classification}
\ifoot[{\textcolor{theGrey}{\normalfont Grattan Institute \@YEAR {\Large\strut}}}]{\textcolor{theGrey}{\normalfont Grattan Institute \@YEAR}{\Large\strut}}
\cfoot[\classification]{\classification}
\ofoot[\normalfont\textcolor{theGrey}{\thepage}]{\normalfont\textcolor{theGrey}{\thepage}}

\setkomafont{headsepline}{\color{Orange}}
\setkomafont{footsepline}{\color{Orange}}
\RequirePackage{eso-pic}

% Figure parameters -----------------------
%\renewcommand{\floatpagefraction}{0.75}

% length of fptop is magical: equal to the 
\newlength{\@chaproom}
\setlength{\@chaproom}{33.64366pt}
\setlength{\@fptop}{36.64366pt minus 36.64366pt}
\let\oldtryfcolumn=\@tryfcolumn
\def\@tryfcolumn{\addtolength{\@fptop}{\dimexpr \@colht-\textheight}%
  \oldtryfcolumn}
\setlength{\@fpbot}{36.64366pt plus 1fil minus 36.64366pt}
\setlength{\textfloatsep}{11pt plus 22pt minus 11pt}
\setkeys{Gin}{width=\columnwidth}

\newenvironment{figureTop}{
\begin{figure}
\begin{minipage}[\textheight]{\linewidth}
}{%
\end{minipage}
\end{figure}
}

% Ensure pdfs are used first
\DeclareGraphicsExtensions{%
    .pdf,.PDF,%
    .png,.PNG,%
    .jpg,.mps,.jpeg,.jbig2,.jb2,.JPG,.JPEG,.JBIG2,.JB2}

%% FrontPage options
%% First, the default, plain front page with a title.
\newcommand*{\titleTH}{\begingroup % Create the command for including the title page in the document
\raggedleft % Right-align all text
\vfil
\phantom{.}\hfill 
\includegraphics[width=0.225\paperwidth,keepaspectratio]{GrattanSVGLogo}
\vspace{30pt}
\vfil % Whitespace at the top of the page
{\bfseries\textcolor{Orange}{\fontsize{30}{30}\selectfont \mytitle}}\\[\baselineskip] % Title page font size

{\LARGE \myauthor}

\vfill% Whitespace at the bottom of the page
\endgroup}
\newcommand{\BackgroundPic}{}

% Alternatively, if FrontPage is declared, the file there is used as the frontpage picture
\DeclareOption{FrontPage}{
	\IfFileExists{./FrontPage/FrontPage.pdf}{%
	    %\includegraphics[width=\paperwidth,keepaspectratio]{./FrontPage/FrontPage}%
	  }{
	    \ClassError{grattanAlpha}{%
			'./FrontPage/FrontPage.pdf' does not exist
	    }{%
			You have asked for a fullpicture option, but we can't find 
			a file at './FrontPage/FrontPage.pdf'. Try placing the image
			there or not using the fullpicture option.
		}
	  }
	\renewcommand\BackgroundPic{%
		\put(0,0){%
		\parbox[b][\paperheight]{\paperwidth}{%
		\vfill
		\centering
		% Amend
		\IfFileExists{./FrontPage/FrontPage.pdf}{%
			\includegraphics[width=\paperwidth,keepaspectratio]{./FrontPage/FrontPage.pdf}%
		}{
			\ClassError{grattanAlpha}{%
				'./FrontPage/FrontPage' does not exist
			}{%
				You have asked for a fullpicture option, but we can't find 
				a file at './FrontPage/FrontPage'. Try placing the image
				there or not using the fullpicture option.
			}
		}
	\vfill
	}}}
	\renewcommand{\titleTH}{} % FrontPage should be entire.

}

\DeclareOption{continuous}{%
  \KOMAoption{listof}{nochaptergap}
  \addtocontents{lof}{\linespread{1.3}\selectfont}% optical
  \addtocontents{lot}{\linespread{1.3}\selectfont}% optical
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
}

\ProcessOptions\relax

\RequirePackage{multicol}
\newcommand{\logoskip}{\par\vspace{16pt}}

\newcommand*{\ReportOrWorkingPaper}[1]{\renewcommand*{\@Report}{#1}}
\newcommand{\@Report}{Report}

\newcommand*{\GrattanReportNumber}[1]{\renewcommand*{\@GrattanReportNumber}{#1}}
\newcommand{\@GrattanReportNumber}{}

\AtBeginDocument{%
  \ifdefempty{\@GrattanReportNumber}%
    {\ClassError{You have not provided a Grattan Report Number}}%
    {}%
}

% Allow MONTH/YEAR to be defined; otherwise by default the date of compilation
\newcommand*{\MONTH}[1]{\renewcommand*{\@MONTH}{#1}}
\newcommand{\@MONTH}{%
  \ifcase\the\month
  \or January% 1
  \or February% 2
  \or March% 3
  \or April% 4
  \or May% 5
  \or June% 6
  \or July% 7
  \or August% 8
  \or September% 9
  \or October% 10
  \or November% 11
  \or December% 12
  \fi}

\newcommand*{\YEAR}[1]{\renewcommand*{\@YEAR}{#1}}
\newcommand{\@YEAR}{\the\year}

\newcommand\acknowledgements[1]{\renewcommand\@acknowledgements{#1}}
\newcommand\@acknowledgements{}

\newcommand*{\ISBN}[1]{\renewcommand*{\@ISBN}{#1}}
\newcommand{\@ISBN}{}

\RequirePackage{tabularx}
\AtBeginEnvironment{tabular}{\small}
\AtBeginEnvironment{tabularx}{\small}
  
\AtBeginDocument{%
\pagestyle{empty}
	\let\mytitle\@title
	\let\myauthor\@author
	
	% TitlePage
	\onecolumn
	\AddToShipoutPicture*{\BackgroundPic}
	\phantom{.}\hfill\titleTH
	\ClearShipoutPicture
	\clearpage
	\twocolumn
  % use microtype
  
	%
% Following page.
\pagestyle{scrheadings}
\begin{minipage}[t][0.85\textheight][t]{\columnwidth}
  \subsection*{Grattan Institute Support}  
  \begin{multicols}{2}
  \setlength{\parskip}{5pt plus 8pt minus 5pt}
  \textbf{\textcolor{theGrey}{\normalsize Founding members}}\hfill\par
  \vspace{-5pt} 
  {\centering  
  
  {\includegraphics[width=3.75cm]{aus-gov-logo-stacked-black}}
  
  {\includegraphics[width=3.25cm]{Vic_Gov_Logo-2016}}
  
  % Too much whitespace on top:
  % l t r b
  {\includegraphics[trim = {0 2cm 0 2cm}, clip, width=3.5cm]{UOM-Pos_S_PMS}}
  
  % Bhp original a little too much whitespace on bottom:
  {\includegraphics[trim = {0 3.8cm 0 0}, clip, width=3.5cm]{Bhp}}
  }
  \columnbreak\par
  \textbf{\textcolor{theGrey}{\normalsize Affiliate Partners}}
  \footnotesize 

  Google 

  Medibank Private

  Susan McKinnon Foundation

  \vspace{27pt}

  \textbf{\textcolor{theGrey}{\normalsize Senior Affiliates}}

  EY

  PwC

  The Scanlon Foundation

  Wesfarmers

  \vspace{27pt}

  \textbf{\textcolor{theGrey}{\normalsize Affiliates}}

  Ashurst

  Corrs

  Deloitte

  GE ANZ

  The Myer Foundation

  Urbis

  Westpac\rule[-1.5ex]{0pt}{0pt} % for BHp
  \end{multicols}
  \end{minipage} 
  \eject \normalsize
  \begin{minipage}[t][0.85\textheight][t]{\columnwidth}
  \setlength{\parskip}{5.5pt plus 2pt}
  \subsection*{Grattan Institute \@Report\ No. \@GrattanReportNumber, \@MONTH\ \@YEAR}
  \raggedright\@acknowledgements
  \end{minipage}
  \twocolumn
}

% Table of contentss
\setcounter{tocdepth}{0}

\newlength{\currentparskip}

% Designing the overview
% ---
% We define a new environment that take as its contents the text of the 
% overview, placing it with a chapter* heading 'Overview' all on the same
% page. 
\newlength{\overviewExtra}
\setlength{\overviewExtra}{0pt}
\newenvironment{overview}[1][]%
  {\onecolumn\vtop to 0pt\bgroup\ifstrempty{#1}{\vspace{-23.4pt}}{\vspace{#1}}\addchap{Overview}\addtolength{\columnsep}{\overviewExtra}\begin{multicols}{2}}%
  {\end{multicols}\addtolength{\columnsep}{-\overviewExtra}\vss\egroup\hfill\twocolumn}
  
\newenvironment{summary}%
  {\onecolumn\vtop to 0pt\bgroup\vspace{-25pt}\chapter*{Summary}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}
  
\newenvironment{onepager}[1]%  
  {\onecolumn\vtop to 0pt\bgroup\vspace{-25pt}\chapter*{#1}\begin{multicols}{2}}%
  {\end{multicols}\vss\egroup\hfill\twocolumn}


% Bibliography
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=authoryear-ibid,ibidtracker=strict, autocite=footnote, maxcitenames=2, maxbibnames=9, uniquelist=false, uniquename=init, giveninits=true]{biblatex}
\DeclareLanguageMapping{english}{british-apa}
\DeclareNameAlias{author}{last-first} % for last name, first name in bibliography

%% Bibliography formatting
% separating entries
\setlength\bibitemsep{1.5\itemsep}
% format bibliography
\renewcommand*{\bibfont}{\small\raggedright}
\DeclareFieldFormat{url}{\textcolor{blue}{\url{#1}}}
% Increase penalty for page-breaks within entry from 5000 to 10,000 (infinity)
\patchcmd{\bibsetup}{\interlinepenalty=5000}{\interlinepenalty=10000}{}{}

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

% Patch for issue 
\AtBeginDocument{%
  \apptocmd\@floatboxreset
    {\booltrue{citetracker}%
     \booltrue{pagetracker}}
    {}
    {\blx@err@patch{floats}}
}

\RequirePackage{tocloft}
\renewcommand{\cftchapfont}{\normalsize\normalfont}
\renewcommand{\cftchapdotsep}{4.5}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftdot}{\normalfont .}
\renewcommand{\@pnumwidth}{1em}

% indent of list of figures
\renewcommand{\cftfigindent}{0em}

\AtBeginDocument{\renewcommand{\contentsname}{Table of contents}}
\newcommand{\contentspage}{%
\onecolumn
\begin{multicols}{2}
\phantom{.}
\vfill
\columnbreak
\begingroup
\raggedright
\tableofcontents
\endgroup
\end{multicols}
\twocolumn%
}

\newcommand{\oneraggedpage}{\let\mytextbottom\@textbottom
  \let\mytexttop\@texttop
  \raggedbottom
  \afterpage{%
  \global\let\@textbottom\mytextbottom
  \global\let\@texttop\mytexttop}}

