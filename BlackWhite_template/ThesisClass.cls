\ProvidesClass{ThesisClass}
\LoadClass[twoside,openright,11pt,a4paper]{report}


% random packages
	\usepackage{todonotes}									% Add to-do notes 
	\linespread{1.5}										% line spacing set to 1.5
	\usepackage[hyphens]{url}	
	\usepackage{siunitx}									% for SI units
	\usepackage{color,soul}									% for highligths
	\usepackage{units}
	
	
% Glossaries
	\usepackage[acronym]{glossaries}
	\robustify{\gls}

	
% Equations
	\usepackage{amsmath}
	\abovedisplayskip=16pt
	\belowdisplayskip=16pt
	\abovedisplayshortskip=30pt
	\belowdisplayshortskip=30pt

% Colors
	\usepackage{color}
	\definecolor{AzulCiencias}{RGB}{147,191,235}
	\definecolor{preto}{RGB}{0,0,0}
	\definecolor{cinza}{RGB}{192,192,192}
	\definecolor{AzulEscuro}{RGB}{0,0,235}
	\definecolor{AzulmaisEscuro}{RGB}{25,25,112}

	
% References
%	\usepackage[colorlinks, linkcolor=AzulEscuro,citecolor=AzulmaisEscuro]{hyperref}
%	\usepackage{hyperref}
% References
	\usepackage[colorlinks, allcolors=preto]{hyperref}
	\usepackage{hyperref}
		
% Bibliography
	%\usepackage{natbib}										% BibTeX style bibliography
	%\usepackage{aastex_hack}								% Hack to enable AASTeX abbreviations 
	

% Configure page and set margins manually
	\usepackage[paperwidth=210mm, paperheight=297mm, top=2.5cm, bottom=2.5cm, left=2cm, right=2cm, headsep=1cm]{geometry}

% Use chapter number in figures and equations
	\usepackage{amsmath}
	\numberwithin{equation}{chapter}
	\numberwithin{figure}{chapter}
	\numberwithin{table}{chapter}
	
% Set fonts
	%\usepackage[scaled]{uarial}
	%\renewcommand*\familydefault{\sfdefault}
	%\usepackage[T1]{fontenc}
	\newcommand{\tablesize}{\fontsize{11pt}{13pt}\selectfont}
	\renewcommand{\normalsize}{\fontsize{11pt}{16pt}\selectfont}	
	\renewcommand{\footnotesize}{\fontsize{8}{12}\selectfont}
	\renewcommand\tiny{\fontsize{5}{7.5}\selectfont}
	\renewcommand\scriptsize{\fontsize{8}{12}\selectfont}
	\renewcommand\small{\fontsize{9}{7}\selectfont}
	\renewcommand\normalsize{\fontsize{12}{16}\selectfont}
	\renewcommand\large{\fontsize{12}{18}\selectfont}
	\renewcommand\Large{\fontsize{14}{21}\selectfont}
	\renewcommand\LARGE{\fontsize{16}{24}\selectfont}
	\renewcommand\huge{\fontsize{20}{25}\selectfont}
	\renewcommand\Huge{\fontsize{24}{25}\selectfont}


	
	
%----------------------------------------------------------------------------------------
%	FLOATS
%----------------------------------------------------------------------------------------

% Change table font size
\let\oldtabular\tabular
\renewcommand{\tabular}{\tablesize\oldtabular}

% Figures
	\usepackage{graphicx} 													% Pictures and images
	\usepackage{epstopdf}
	\graphicspath{{./figures/}} 											% Specifies the directory where pictures are stored
	\usepackage{subcaption}													% Allows subfigures
	\setlength{\belowcaptionskip}{-10pt}
	\usepackage{paralist}									% lists
	\usepackage{indentfirst}
	\usepackage{tikz}										% For flow charts
	\usetikzlibrary{shapes,arrows,positioning}
	\usepackage{pdfpages}
	\usepackage[section]{placeins}
	
% Setup default graphicx figure width
\setkeys{Gin}{width=0.75\textwidth}

% Center figures on page
\let\origfigure\figure
\let\endorigfigure\endfigure
\renewenvironment{figure}[1][tbph]{%
	\origfigure[#1]\centering}{%
    \endorigfigure}
	
% Float Placement
% Alter some LaTeX defaults for better treatment of figures:
    % See p.105 of "TeX Unbound" for suggested values.
    % See pp. 199-200 of Lamport's "LaTeX" book for details.
    %   General parameters, for ALL pages:
    \renewcommand{\topfraction}{0.99}	% max fraction of floats at top
    \renewcommand{\bottomfraction}{0.5}	% max fraction of floats at bottom
    %   Parameters for TEXT pages (not float pages):
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}     % 2 may work better
    \setcounter{dbltopnumber}{2}    % for 2-column pages
    %\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
    \renewcommand{\textfraction}{0.1}	% allow minimal text w. figs
    %   Parameters for FLOAT pages (not text pages):
    \renewcommand{\floatpagefraction}{0.95}	% require fuller float pages
	% N.B.: floatpagefraction MUST be less than topfraction !!
    %\renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages

	% remember to use [htp] or [htpb] for placement
	
% Captions setup
	\usepackage[labelfont={color=AzulEscuro,bf},width=0.7\textwidth, size=small]{caption}

%----------------------------------------------------------------------------------------
%	TITLE PAGE
%----------------------------------------------------------------------------------------
	\usepackage[noblocks]{authblk}									
	\renewcommand\Authands{ and }
	\renewcommand\Authsep{ and }

% Define \supervisor command
	\newcounter{supervisors}
	\def\@supervisor{}
	\newcommand\AB@supervisorslist{}
	\newcommand\AB@supervisors{}
	
	\xdef\AB@supervisor{\noexpand\AB@blk@and\@supervisor}
	
	\newcommand\supervisor[2][]%
            {\ifnewaffil\addtocounter{affil}{1}%
       \edef\AB@thenote{\arabic{affil}}\fi
      \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \ifnum\value{supervisors}>1\relax
      \@namedef{@sep\number\c@supervisors}{\Authsep}\fi
      \addtocounter{supervisors}{1}%
      \begingroup
          \let\protect\@unexpandable@protect \let\and\AB@pand
          \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
         \@temptokena=\expandafter{\AB@supervisors}%
         {\def\\{\protect\\[\@affilsep]\protect\Affilfont
              \protect\AB@resetsep}%
              \xdef\AB@supervisor{\AB@blk@and#2}%
       \ifnewaffil\gdef\AB@las{}\gdef\AB@lasx{\protect\Authand}\gdef\AB@as{}%
           \xdef\AB@supervisors{\the\@temptokena\AB@blk@and}%
       \else
          \xdef\AB@supervisors{\the\@temptokena\AB@as\AB@au@str}%
          \global\let\AB@las\AB@lasx\gdef\AB@lasx{\protect\Authands}%
          \gdef\AB@as{\Authsep}%
       \fi
       \gdef\AB@au@str{#2}}%
         \@temptokena=\expandafter{\AB@supervisorslist}%
         \let\\=\supervisorcr
         \xdef\AB@supervisorslist{\the\@temptokena
           \protect\@nameuse{@sep\number\c@supervisors}%
           \protect\Authfont#2\AB@authnote{\AB@note}}%
      \endgroup
      \ifnum\value{supervisors}>2\relax
      \@namedef{@sep\number\c@supervisors}{\Authands}\fi
      \newaffilfalse
}

% redefine \author command
	\def\@author{}
	\renewcommand\@author{\ifx\AB@affillist\AB@empty\AB@author\else
		  \ifnum\value{affil}>\value{Maxaffil}\def\rlap##1{##1}%
		\AB@authlist\\
		\else  \AB@authors\fi\fi}

% Define \supervisor command	
	\def\@supervisor{}
	\renewcommand\@supervisor{\ifx\AB@affillist\AB@empty\AB@supervisor\else
		  \ifnum\value{affil}>\value{Maxaffil}\def\rlap##1{##1}%
		\AB@supervisorslist\\
		\else  \AB@supervisors\fi\fi}

% Define \institutes command	
	\def\@institutes{}
	\renewcommand\@institutes{\AB@affillist}

% Define command to print author list only (without affiliation)
	\newcommand{\printauthorlist}{{%
		\expandafter\let\csname textsuperscript \endcsname\@gobble% Remove \textsuperscript 
		\AB@authlist}% Print list
		}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for the horizontal lines, change thickness here

% Define \university command
	\def\@university{}
	\newcommand{\university}{
		\def\@university
		}

% Define \degree command
	\def\@degree{}
	\newcommand{\degree}{
		\def\@degree
		}
		
% Define \logo command
	\def\@logo{}
	\newcommand{\logo}{
		\includegraphics{./figures/\@logo}
		}

		
% Title Page
	\renewcommand{\maketitle}{
% 		\thispagestyle{empty}
% 			
% 			\begin{figure}
% 				\vcenter\centerline{\includegraphics[width=210mm,keepaspectratio=True,page=1]{./figures/FolhaRostoTese.pdf}}
% 			\end{figure}
% 
% 		\clearpage
% 		\thispagestyle{empty}
% 			\begin{figure}
% 				\vcenter\centerline{\includegraphics[width=210mm,keepaspectratio=True,page=2]{./figures/FolhaRostoTese.pdf}}
% 			\end{figure}
% 		\clearpage
		\thispagestyle{empty}
			\begin{minipage}[t][0.3\textheight][t]{0.9\textwidth}
				\begin{center}
					\includegraphics[height=0.2\textheight]{FCUP_Logo_positive.jpg}
				\end{center}
			\end{minipage}
			
			\begin{minipage}[c][0.3\textheight][c]{\textwidth}
				{\center{
					\HRule\\[1cm]
					\fontsize{20pt}{24pt}\selectfont{\@title}\\[0.5cm]
					{\fontsize{14pt}{16pt}\selectfont{\@degree}}
					\HRule\\[1cm]
					}
					}
				
			\end{minipage}
			
			\begin{minipage}[b][0.3\textheight][b]{\textwidth}
				\vfill
				
				{\fontsize{11pt}{22pt}{
					{\textbf{Author:\\}}
					{\@author\\}				
					{\textbf{Supervisors:\\}}
					{\@supervisor\\}					
					{\textbf{Affiliations:\\}}
					{\@institutes}
				}}
				
			\end{minipage}
			
		\newpage{}
		}


%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\headrulewidth}{0pt}
	%\renewcommand{\footrulewidth}{0.4pt}% default is 0pt
	\setlength{\headheight}{36pt}
	\setlength{\headsep}{12pt}
	%\setlength{\footskip}{24pt}
	\fancyhead{} 
	\def\@FCUPHead{}
	\newcommand\FCUPHead{
		\scriptsize{
			\begin{tabular}{r|l}
				FCUP	&	\thepage	\\
				\@title	&				\\
			\end{tabular}
			}}
	\fancyhead[R]{\FCUPHead}
	%\fancyfoot{} 
	%\fancyfoot[R]{\small \printauthorlist}
		
		
						% Right Odd, Left Even
	%\fancyhead[LO]{\small Chapter \thechapter: \chaptername}			% Left Odd
	%\fancyhead[RE]{\small Direct Detection of Reflected Light}			% Right Even
	
	\fancyfoot[C]{}

%----------------------------------------------------------------------------------------
%	CHAPTERS AND SECTIONS
%----------------------------------------------------------------------------------------
	\usepackage[uppercase]{titlesec}
	\usepackage{textcase}
	\newcommand{\sstrut}{\vrule width 0pt height 14pt depth 4pt}
	\newcommand{\ColorSection}[1]{%
		\colorbox{cinza}{\parbox[c]{\dimexpr\textwidth-2\fboxsep}
		{\raggedright\sstrut\MakeUppercase{\myslabel #1}\sstrut}}}
		
		
% Chapter
	\titleformat{\chapter}[display]
		{\sffamily\Huge\bfseries\color{preto}\raggedright}	% Define Chapter title format
		{\chaptername\ \thechapter.}{5pt}{\Huge}	% Define Chapter Title text
	\titlespacing*{\chapter}{0pt}{40pt}{30pt} 



% Section	
	\titlespacing*{\section}{0pt}{\baselineskip}{\baselineskip} 
	\titleformat{\section}
		{\gdef\myslabel{}\sffamily\Large\bfseries\raggedright\fontsize{25pt}{0pt}}
		{\gdef\myslabel{\thesection\ }}{0pt}{\thesection\ }       
	%\let\stdsection\section
	%\renewcommand\section{\newpage\stdsection}

% SubSection
	\newcommand{\ColorSubSection}[1]{
		\colorbox{cinza}{\parbox[c][1.5em][c]{0.5cm}{}}
		\colorbox{white}{\parbox[c][1.5em][c]{0.5cm}{}}}
	\titleformat{\subsection}		
		{\gdef\myslabel{}\sffamily\large\bfseries\raggedright\fontsize{12pt}{0pt}}			% Define Subsection title format
		{\gdef\myslabel{\thesubsection\ }}{0pt}{\thesubsection\ }		% Define Subsection title text
	
% SubSubSection	
	\titleformat{\subsubsection}
		{\normalfont\sffamily\raggedright}											% Define Subsubsection title format
		{}{1em}{\normalfont}

	\setlength{\parindent}{1em}

