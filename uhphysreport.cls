% Standard preamble for homework and tests
% Written by Allyson Robert

% Declares itself
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uhphysreport}[2022/12/04 This class is for student reports written in LaTeX in the physics department at Hasselt university]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Class definitions     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pass remaining options to the article class
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% The custom class builds on the article class
\LoadClass[12pt, a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Language package
\RequirePackage[dutch]{babel}

% Aesthetics, layout and font
\RequirePackage{titlesec} % to add a dot after section number
\RequirePackage{fancyhdr} % easy header and footer
\RequirePackage{mathptmx} % Times New Roman font
\RequirePackage{titlecaps}% http://ctan.org/pkg/titlecaps
\RequirePackage{parskip} % blank space (single line) between paragraphs
\RequirePackage{setspace} % for setstretch command (line spacing)
\RequirePackage[export]{adjustbox}
\RequirePackage{emptypage}
% Open Sans font is easier to read
\RequirePackage[default,oldstyle]{opensans}

% Good defaults to have
\RequirePackage{graphicx} % import images

% Math and physics packages ... you will need them
\RequirePackage{amsmath}
\RequirePackage{physics}

% References and links (these should be last and in this order)
\RequirePackage{csquotes}
\RequirePackage{biblatex}
\RequirePackage[colorlinks=true, linktoc=all]{hyperref}
\RequirePackage[noabbrev,dutch]{cleveref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       New Elements       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\course}[1]{\gdef\thecourse{#1}}
\newcommand*{\major}[1]{\gdef\themajor{#1}}
\newcommand*{\acyear}[1]{\gdef\theacyear{#1}}

\newcommand*{\thementor}{}
\newcommand*{\mentor}[1]{\ifx\empty#1\empty  \else \gdef\thementor{\textbf{Begeleider(s):} \\ #1} \fi
}

\newcommand*{\thepromotor}{}
\newcommand*{\promotor}[1]{\ifx\empty#1\empty  \else \gdef\thepromotor{\textbf{Promotor(s):} \\ #1} \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of the header %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhf{}
\rhead{\hspace*{1cm}\vspace*{0.05cm}\textit{\thecourse ~-~ \themajor}}
\lhead{\includegraphics[width=0.25\textwidth]{Figures/Logos/logo_uhasselt.png}}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
% For open sans use:
\setlength{\headheight}{30pt}
\setlength{\textheight}{564pt}
% % For the default font use:
% \setlength{\headheight}{42pt}
% \setlength{\textheight}{524pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Functional Definitions  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\numberlesssection}[1]{
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
}

% Shorthand for new paragraph
\newcommand{\npar}{\par\medskip} 
\addbibresource{references.bib}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Title Header       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@maketitle{%
    % \newgeometry{top=7.75cm, bottom=10mm, left=1in, right=1in}
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{minipage}[b]{\textwidth}
            \includegraphics[width=6cm, right]{Figures/Logos/logo_uhasselt.png}
            \flushright \Large Academiejaar \theacyear \\
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
            \centering
            {\Large \selectfont\textit{\textsf{\thecourse}}} \\
            \Huge \textbf{\@title} \\
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright 
                \large 
                \textbf{Auteur(s):} \\ \@author 
                \npar
                % \textbf{Begeleider(s):} \\ 
                \thementor 
                \npar
                % \textbf{Promotor(s):} \\ 
                \thepromotor
        \end{minipage}
    \end{titlepage}
    \cleardoublepage
}
\makeatother