% Standard preamble for homework and tests
% Written by Allyson Robert

% Declares itself
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uhphysreport}[2022/11/27 This class is for reports written in LaTeX in the physics department at Hasselt university]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[12pt, a4paper, twoside]{article}

%% Language package
\RequirePackage[dutch]{babel}


% Aesthetics, layout and font
\RequirePackage{titlesec} % to add a dot after section number
\RequirePackage{fancyhdr} % easy header and footer
\RequirePackage{mathptmx} % Times New Roman font
\RequirePackage{sectsty} % font sizes of (sub)sections
\RequirePackage{titlecaps}% http://ctan.org/pkg/titlecaps
\RequirePackage{parskip} % blank space (single line) between paragraphs
\RequirePackage{setspace} % for setstretch command (line spacing)
\RequirePackage[export]{adjustbox}
\RequirePackage{emptypage}

% Good defaults to have
\RequirePackage{graphicx} % import images

% Math and physics packages ... you will need them
\RequirePackage{amsmath}
\RequirePackage{physics}

% References and links (these should be last and in this order)
\RequirePackage{biblatex}
\RequirePackage[colorlinks=true, linktoc=all]{hyperref}
\RequirePackage[noabbrev,dutch]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       New Elements       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\course}[1]{\gdef\thecourse{#1}}
\newcommand*{\runningtitle}[1]{\gdef\therunningtitle{#1}}
\newcommand*{\major}[1]{\gdef\themajor{#1}}
\newcommand*{\acyear}[1]{\gdef\theacyear{#1}}
\newcommand*{\mentor}[1]{\gdef\thementor{#1}}
\newcommand*{\promotor}[1]{\gdef\thepromotor{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of the header %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{42pt}
\setlength{\textheight}{524pt}
\rhead{\hspace*{1cm}\vspace*{0.05cm}\textit{\thecourse ~-~ \themajor}}
\lhead{\includegraphics[width=0.25\textwidth]{Figures/Logos/logo_uhasselt.png}}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}


\sectionfont{\fontsize{11}{10}\selectfont} % the font size for (sub)sections and the spacings

% Puts a dot in the section number, avoids it in references
\makeatletter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\quad}
\makeatother

% Edit spacing defaults
\titlespacing{\section}{0pt}{2ex}{0ex} % this one is important, especially last box
\titlespacing{\subsection}{0pt}{1ex}{0ex}
\titlespacing{\subsubsection}{0pt}{0.5ex}{0ex}

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
            % Logo of the faculty in question
            \includegraphics[width=6cm, right]{Figures/Logos/logo_uhasselt.png}
            \flushright \Large Academiejaar \theacyear \\
        \end{minipage}
        
        \vfill
        \begin{center}
                {\LARGE \selectfont\textbf{\textsf{\thecourse}}} \\
                \Huge \textbf{\@title} \\
        \end{center}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright 
                \large 
                \textbf{Auteur(s):} \\ \@author 
                \npar
                \textbf{Begeleider(s):} \\ \thementor 
                \npar
                \textbf{Promotor(s):} \\ \thepromotor
        \end{minipage}
    \end{titlepage}
    \cleardoublepage
}
\makeatother