% muthesis Class for LaTeX2e.

% A class file for postgraduate theses at Massey University
% Stephen Marsland, July 2009 
% Based on the University of Manchester class by Graham Gough 

% See the thesis.tex file for usage information

\NeedsTeXFormat{LaTeX2e} \ProvidesClass{muthesis}

\RequirePackage{setspace}
\newif\ifsinglesp@
\newif\ifdoublesp@
\doublesp@false

\DeclareOption{singlespace}{\singlesp@true}
\DeclareOption{doublespace}{\doublesp@true}
\DeclareOption{PhD}{\def\degreetitle{Doctor of Philosophy}}
\DeclareOption{MSc}{\def\degreetitle{Master of Science}}
\DeclareOption{ME}{\def\degreetitle{Master of Engineering}}
\DeclareOption{MPhil}{\def\degreetitle{Master of Philosophy}}
\DeclareOption{MTech}{\def\degreetitle{Master of Technology}}
\DeclareOption{PGDip}{\def\degreetitle{Postgraduate Diploma in Science}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

%\ExecuteOptions{PhD}

\ProcessOptions

\LoadClass[a4paper]{report}

%% We need >15mm  margins except on the binding edge, where it is >40mm
\oddsidemargin 14.6truemm \evensidemargin 0truemm
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0truemm \headsep 10truemm
\textheight 224truemm \textwidth 145truemm

%% Disallow page breaks at hyphens (this will give some underfull vbox's,
%% so an alternative is to use \brokenpenalty=100 and manually search
%% for and fix such page breaks)
\brokenpenalty=10000

%% Set up line spacing
\AtBeginDocument{%
\ifdoublesp@%
  \doublespacing%
\else\ifsinglesp@%
  \singlespacing%
\else%
  \onehalfspacing%
\fi%
\fi
}

%% \author, \title are defined in report; here are the rest of the
%% front matter defining macros
%% Note: If you really want, you can define your own macro for, say
%% \supervisor , just by copying the definitions of \principaladvisor
%%
\def\dept#1{\gdef\@dept{#1}}
\def\school#1{\gdef\@dept{#1}}
\def\faculty#1{\gdef\@faculty{#1}}

\def\@title{}\def\@author{}
\newcommand{\campus}[1]{\ifx\empty#1\else\gdef\@campus{#1}\fi}
\newcommand{\subject}[1]{\ifx\empty#1\else\gdef\@subject{#1}\fi}
\def\@submitdate{\number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifsigpage
\copyrighttrue \figurespagetrue \tablespagetrue \sigpagefalse

\def\titlep{%
  \thispagestyle{empty}%
  \null\vskip1in%
  \begin{center}
    \Huge\uppercase\expandafter{\@title}
  \end{center}
  \vfill
  \begin{center}
    \textsc{A thesis presented in partial fulfilment of the requirements for the degree of\\
    {\degreetitle} \\
    in \\
    {\@subject}\\
    at Massey University, {\@campus},\\
    New Zealand.}
       \end{center}
  \vfill
  \begin{center}
    \normalfont  \@author
  \end{center}
    \vfill
  \begin{center}
    \@submitdate
  \end{center}\vskip.5in
  \newpage
  \cleardoublepage
}

\def\beforeabstract{
        \pagenumbering{roman}
        \pagestyle{plain}
        \titlep
}

\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}
  
\def\afterpreface{
        \pagenumbering{arabic}}



