% =============================================================================
% Computer Science Notes Class
% =============================================================================
% Custom class for university Computer Science notes
% Author: Riccardo Elena
% Date: 2025
% =============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csnotes}[2025/10/07 Computer Science Notes Class]

% Classe base: usare report per supporto ai \chapter
\LoadClass[a4paper,11pt,openany]{report}
% Numerazione e TOC
\setcounter{secnumdepth}{3} % numerazione fino a subsubsection
\setcounter{tocdepth}{2}    % TOC: mostra fino a subsection

% =============================================================================
% ESSENTIAL PACKAGES
% =============================================================================

% Encoding and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,italian]{babel}
\RequirePackage[italian]{datetime2}

% Mathematics
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}

% Graphics and colors
\RequirePackage{graphicx}
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{cd}
\usetikzlibrary{shapes.geometric}
\RequirePackage{tcolorbox}
\RequirePackage{etoolbox}
\tcbuselibrary{most}


% Layout and geometry
\RequirePackage[margin=2.5cm, top=3cm, bottom=3cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}

% Utilities
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}

% Fonts and typography
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{csquotes}

% Bibliography
\RequirePackage[
    backend=biber,
    style=numeric,
    sorting=none,
    natbib=true,
    doi=true,
    url=true,
    isbn=false
]{biblatex}

% Code
\RequirePackage{listings}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% =============================================================================
% GRAPHICS CONFIGURATION
% =============================================================================

\graphicspath{ {_files/} }


% =============================================================================
% CUSTOM SYMBOLS
% =============================================================================

% warning symbol (yellow triangle with exclamation mark)
\newcommand{\warningsymbol}{%
    \raisebox{-0.15ex}{\tikz[baseline=-0.5ex]\node[draw=yellow!70!black,fill=yellow!30,regular polygon,regular polygon sides=3,inner sep=0.8pt,line width=0.6pt,minimum size=0.9em]{%
        \textnormal{\textbf{\textcolor{yellow!70!black}{\tiny !}}}%
    };}%
}
% Info symbol (blue circle with i)
\newcommand{\infosymbol}{%
    \raisebox{-0.15ex}{\tikz[baseline=-1ex]\node[draw=blue!70,fill=blue!10,circle,inner sep=1.5pt,line width=0.8pt,minimum size=1.2em]{%
        \textnormal{\textbf{\textcolor{blue!70}{\footnotesize i}}}%
    };}%
}

% =============================================================================
% COLOR DEFINITIONS
% =============================================================================

% Main colors
\definecolor{csblue}{RGB}{0,102,204}         % Main blue
\definecolor{csred}{RGB}{220,50,47}          % Red
\definecolor{csgreen}{RGB}{133,153,0}        % Green
\definecolor{csorange}{RGB}{203,75,22}       % Orange
\definecolor{cspurple}{RGB}{108,113,196}     % Purple
\definecolor{csteal}{RGB}{42,161,152}        % Teal
\definecolor{csyellow}{RGB}{181,137,0}       % Yellow
\definecolor{csdarkgreen}{RGB}{46,139,87}    % Dark green (alternative)
\definecolor{codestring}{RGB}{42,161,152}

% Colors for environments
\definecolor{defcolor}{RGB}{0,102,204}       % Definitions - Blue
\definecolor{thmcolor}{RGB}{46,139,87}       % Theorems - Dark green
\definecolor{lemcolor}{RGB}{203,75,22}       % Lemmas - Orange
\definecolor{propcolor}{RGB}{108,113,196}    % Propositions - Purple
\definecolor{corcolor}{RGB}{133,153,0}       % Corollaries - Green
\definecolor{excolor}{RGB}{42,161,152}       % Examples - Teal
\definecolor{notecolor}{RGB}{181,137,0}      % Notes - Yellow
\definecolor{warncolor}{RGB}{220,50,47}      % Warnings - Red
\definecolor{algocolor}{RGB}{88,110,117}     % Algorithms - Blue gray

% Code colors
\definecolor{codebg}{RGB}{248,248,248}
\definecolor{codecomment}{RGB}{147,161,161}
\definecolor{codekeyword}{RGB}{38,139,210}
\definecolor{codestring}{RGB}{42,161,152}

% =============================================================================
% HEADER AND FOOTER CONFIGURATION
% =============================================================================

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\leftmark}
\fancyhead[R]{\small\@title}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% Style for chapter pages
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% =============================================================================
% TITLE FORMATTING
% =============================================================================

% Sections, subsections, subsubsections
\titleformat{\section}
  {\Large\bfseries\color{csblue}}
  {\thesection}{1em}{}
  [\titlerule]

\titleformat{\subsection}
  {\large\bfseries\color{csblue!80}}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalsize\bfseries\color{csblue!60}}
  {\thesubsubsection}{1em}{}

% Chapter formatting (for report class) - styled similarly to sections
	\titleformat{\chapter}
  {\huge\bfseries\color{csblue}}
  {\thechapter}{1em}{}
  [\titlerule]
	\titlespacing*{\chapter}{0pt}{-10pt}{20pt}

% =============================================================================
% CLEVER-REFERENCE NAMES CONFIGURATION
% =============================================================================
\crefname{theorem}{teorema}{teoremi}
\Crefname{theorem}{Teorema}{Teoremi}
\crefname{corollary}{corollario}{corollari}
\Crefname{corollary}{Corollario}{Corollari}
\crefname{lemma}{lemma}{lemmi}
\Crefname{lemma}{Lemma}{Lemmi}
\crefname{proposition}{proposizione}{proposizioni}
\Crefname{proposition}{Proposizione}{Proposizioni}
\crefname{definition}{definizione}{definizioni}
\Crefname{definition}{Definizione}{Definizioni}
\crefname{example}{esempio}{esempi}
\Crefname{example}{Esempio}{Esempi}
\crefname{note}{nota}{note}
\Crefname{note}{Nota}{Note}
\crefname{warning}{attenzione}{attenzioni}
\Crefname{warning}{Attenzione}{Attenzioni}
\crefname{algorithm}{algoritmo}{algoritmi}
\Crefname{algorithm}{Algoritmo}{Algoritmi}
\crefname{chapter}{capitolo}{capitoli}
\Crefname{chapter}{Capitolo}{Capitoli}
\crefname{section}{sezione}{sezioni}
\Crefname{section}{Sezione}{Sezioni}
\crefname{subsection}{sottosezione}{sottosezioni}
\Crefname{subsection}{Sottosezione}{Sottosezioni}
\crefname{figure}{figura}{figure}
\Crefname{figure}{Figura}{Figure}
\crefname{table}{tabella}{tabelle}
\Crefname{table}{Tabella}{Tabelle}
\crefname{equation}{equazione}{equazioni}
\Crefname{equation}{Equazione}{Equazioni}


\newcommand{\crefalt}[2][black]{{\hypersetup{linkcolor={#1}}\cref{#2}}}
\newcommand{\Crefalt}[2][black]{{\hypersetup{linkcolor={#1}}\Cref{#2}}}

% Ensure chapter titles are used for the header (\leftmark)
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% -----------------------------------------------------------------------------
% Abstract customization
% By default use an Italian descriptive title instead of the English "Abstract".
% Users can override with \setabstracttitle{...}
\newcommand{\abstracttitle}{Scopo del documento}
\newcommand{\setabstracttitle}[1]{\renewcommand{\abstracttitle}{#1}}

\renewenvironment{abstract}
  {%
   % ensure abstract sits on its own page and is vertically centered
   \cleardoublepage
   \thispagestyle{plain}%
   \vspace*{\fill}%
   \begin{center}\bfseries\large\abstracttitle\end{center}\medskip
   \begin{center}\itshape
  }
  {%
   \end{center}%
   \vspace*{\fill}%
   \clearpage
  }


% =============================================================================
% HYPERREF CONFIGURATION
% =============================================================================

\hypersetup{
    colorlinks=true,
    linkcolor=csblue,
    filecolor=csblue,
    urlcolor=csblue,
    citecolor=csgreen,
    bookmarksdepth=3,
    pdfpagemode=UseOutlines,
}

% =============================================================================
% LISTINGS (CODE) CONFIGURATION
% =============================================================================

\lstdefinestyle{csstyle}{
    backgroundcolor=\color{codebg},
    commentstyle=\color{codecomment}\itshape,
    keywordstyle=\color{codekeyword}\bfseries,
    numberstyle=\tiny\color{codecomment},
    stringstyle=\color{codestring},
    basicstyle=\ttfamily\small,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=8pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=single,
    rulecolor=\color{black!20},
    xleftmargin=15pt,
    xrightmargin=5pt,
    framexleftmargin=10pt,
  % UTF-8 support for accented characters
    inputencoding=utf8,
    extendedchars=true,
    literate=
    {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
    {À}{{\`A}}1 {È}{{\`E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
    {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
    {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
    {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
    {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
    {ã}{{\~a}}1 {õ}{{\~o}}1 {ñ}{{\~n}}1
    {Ã}{{\~A}}1 {Õ}{{\~O}}1 {Ñ}{{\~N}}1
    {ç}{{\c{c}}}1 {Ç}{{\c{C}}}1
    {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1
    {€}{{\euro}}1 {£}{{\pounds}}1
    {│}{{|}}1
    {├}{{|--}}1
    {└}{{`--}}1
    {─}{{-}}1
}

\lstset{style=csstyle}

% =============================================================================
% THEOREM-LIKE ENVIRONMENTS
% =============================================================================

% Base style for theorem boxes
\tcbset{
    theorembox/.style={
        enhanced,
        colback=#1!5,
        colframe=#1!80!black,
        colbacktitle=#1!80!black,
        coltitle=white,
        fonttitle=\bfseries,
        top=8pt,
        bottom=8pt,
        left=8pt,
        right=8pt,
        arc=3pt,
        boxrule=1pt,
        titlerule=0pt,
        toptitle=4pt,
        bottomtitle=4pt,
        drop fuzzy shadow,
        before skip=15pt plus 2pt,
        after skip=15pt plus 2pt,
    }
}

% Definition environment
\newtcolorbox[auto counter, number within=section]{definition}[2][]{
    theorembox=defcolor,
    title={Definizione~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=definition,
    #1
}

% Theorem environment
\newtcolorbox[auto counter, number within=section]{theorem}[2][]{
    theorembox=thmcolor,
    title={Teorema~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=theorem,
    #1
}

% Lemma environment
\newtcolorbox[auto counter, number within=section]{lemma}[2][]{
    theorembox=lemcolor,
    title={Lemma~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=lemma,
    #1
}

% Proposition environment
\newtcolorbox[auto counter, number within=section]{proposition}[2][]{
    theorembox=propcolor,
    title={Proposizione~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=proposition,
    #1
}

% Corollary environment
\newtcolorbox[auto counter, number within=section]{corollary}[2][]{
    theorembox=corcolor,
    title={Corollario~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=corollary,
    #1
}

% Example environment
\newtcolorbox[auto counter, number within=section]{example}[2][]{
    theorembox=excolor,
    title={Esempio~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=example,
    #1
}  

% Note environment
\newtcolorbox[auto counter, number within=section]{note}[2][]{
    theorembox=notecolor,
    title={Nota~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=note,
    #1
}

% Warning/Alert environment
\newtcolorbox[auto counter, number within=section]{warning}[2][]{
    theorembox=warncolor,
    title={Attenzione~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=warning,
    #1
}

% Algorithm environment
\newtcolorbox[auto counter, number within=section]{algorithmdesc}[2][]{
    theorembox=algocolor,
    title={Algoritmo~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=algorithm,
    #1
}
% Customized proof environment
\renewenvironment{proof}[1][Dimostrazione]
  {\par\vspace{10pt}\noindent\textbf{\color{csblue}#1.}\ \itshape\phantomsection}
  {\hfill$\square$\par\vspace{10pt}}

% =============================================================================
% CUSTOM COMMANDS
% =============================================================================

% Command for keywords in bold blue
\newcommand{\keyword}[1]{\textcolor{csblue}{\textbf{#1}}}

% Inline code command
\newcommand{\code}[1]{\texttt{\colorbox{codebg}{#1}}}

% Commands for correct quotes (avoid warnings)
\newcommand{\q}[1]{\enquote{#1}}           % Standard quotes
\newcommand{\qi}[1]{\enquote{\textit{#1}}} % Quotes with italic text

% Commands for computational complexity
\newcommand{\BigO}[1]{\mathcal{O}\left(#1\right)}
\newcommand{\BigOmega}[1]{\Omega\left(#1\right)}
\newcommand{\BigTheta}[1]{\Theta\left(#1\right)}

% Math commands
\newcommand{\N}{\mathbb{N}}   % Natural numbers
\newcommand{\Z}{\mathbb{Z}}   % Integers
\newcommand{\Q}{\mathbb{Q}}   % Rational numbers
\newcommand{\R}{\mathbb{R}}   % Real numbers
\newcommand{\C}{\mathbb{C}}   % Complex numbers
\newcommand{\abs}[1]{\left|#1\right|} % Absolute value
\NewDocumentCommand{\set}{m o}{
  \IfNoValueTF{#2}
    {\left\{ #1 \right\}} % No condition
    {\left\{\,#1\,\middle|\,#2\,\right\}} % With condition
}
\newcommand{\st}{:\;} % such that

% =============================================================================
% TITLE PAGE
% =============================================================================

% Variables for the title page
\newcommand{\@university}{Università degli Studi}
\newcommand{\@department}{Dipartimento di Informatica}
\newcommand{\@course}{Corso di Laurea Magistrale}
\newcommand{\@subject}{Informatica}
\newcommand{\@academicyear}{Anno Accademico 2024/2025}

\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}

% Command to create the title page
% filepath: /Users/riccardoelena/Desktop/Università/Magistrale/Primo_Anno/E_E/Notes/csnotes.cls
% Command to create the title page
\newcommand{\maketitlepage}{
    \begin{titlepage}
        % --- Disegno della Barra Laterale con TikZ ---
        \begin{tikzpicture}[remember picture, overlay]
            % Barra laterale blu
            \fill[csblue] 
                (current page.south west) rectangle 
                ([xshift=5cm]current page.north west);
            
            % Logo di sfondo in trasparenza (centrato nell'area bianca)
            \node[opacity=0.08, inner sep=0pt] at ([xshift=2.75cm]current page.center) {
                \includegraphics[width=15cm]{_images/logo}
            };
        \end{tikzpicture}

        \vspace*{-.5cm}
        \enlargethispage{1cm}
        
        % --- Intestazione (Allineata a Destra) ---
        \begin{minipage}[t]{\dimexpr\textwidth\relax}
          \begin{flushright}
              %\vspace*{0.2cm} % Spazio dall'alto
              
              {\Large\textsc{\@university}}\\[0.2cm]
              {\normalsize\textsc{\@department}}\\[0.1cm]
              {\normalsize\textsc{\@course}}
              
              \null\hfill\rule{0.7\linewidth}{1pt} % Linea di separazione
          \end{flushright}
        \end{minipage}
        
        
        \vfill % Spazio centrale
        
        % --- Titolo Principale (Allineato a Sinistra nell'area bianca) ---
        \hspace*{5.5cm} 
        \begin{minipage}[t]{\dimexpr\textwidth-5.5cm\relax}
            \begin{flushleft}
                {\Large Appunti del corso di}\\[0.5cm]
                {\Huge\bfseries\color{black!80}\@subject}\\[0.2cm]
                
                \vspace{0.1cm}
                % Sezione di rinforzo del titolo
                \rule{0.6\textwidth}{3pt} % Linea spessa che sottolinea il titolo
                \vspace{0.1cm}
            \end{flushleft}
        \end{minipage}

        \vfill % Spinge il resto del contenuto in basso
        
        % --- Metadati (Studente, Data, Anno Accademico) ---
        \hspace*{5.5cm} 
        \begin{minipage}[b]{\dimexpr\textwidth-5.5cm\relax}
            
            % Studente a Sinistra
            \begin{minipage}{0.4\linewidth}
                \begin{flushleft}
                    \large
                    \textbf{Studenti:}\\
                    \@author
                \end{flushleft}
            \end{minipage}
            \hfill
            % Data a Destra
            \begin{minipage}{0.4\linewidth}
                \begin{flushright}
                    \large
                    \textbf{Data:}\\
                    \@date
                \end{flushright}
            \end{minipage}
            
            \vspace{2cm}
            
            % Anno Accademico al Centro (dell'area bianca)
            \begin{center}
                {\large\@academicyear}
            \end{center}
            
            \vspace{1cm} % Margine finale
        \end{minipage}
        
    \end{titlepage}
}

% filepath: /Users/riccardoelena/Desktop/Università/Magistrale/Primo_Anno/E_E/Notes/csnotes.cls

% Command to create the back cover page
\newcommand{\makebackcover}{
    \clearpage
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        % Barra laterale blu (identica alla copertina)
        \fill[csblue] 
            (current page.south west) rectangle 
            ([xshift=5cm]current page.north west);
        
        % Logo di sfondo in trasparenza (opzionale, centrato nell'area bianca)
        \node[opacity=0.05, inner sep=0pt] at ([xshift=2.75cm]current page.center) {
            \includegraphics[width=15cm]{_images/logo}
        };
    \end{tikzpicture}
    
    \vspace*{-2cm}
    \enlargethispage{2cm}
    
    % Contenuto della quarta di copertina (opzionale)
    \noindent\hspace*{5.5cm}%
    \begin{minipage}[c][\textheight][c]{\dimexpr\textwidth-6cm\relax}
        \begin{center}
            \vfill
            
            % Puoi aggiungere qui informazioni come:
            % - Ringraziamenti
            % - Note aggiuntive
            % - Informazioni di contatto
            % - O lasciare vuoto per una pagina pulita
            
            {\large\textit{Fine degli appunti}}
            
            \vspace{2cm}
            
            {\normalsize
            Questi appunti sono stati redatti durante\\
            l'anno accademico \@academicyear\\[1cm]
            presso \@university
            }
            
            \vfill
        \end{center}
    \end{minipage}
    
    \clearpage
}

% =============================================================================
% ALGORITHM CONFIGURATION
% =============================================================================

\algrenewcommand\algorithmicend{\textbf{end}}
\algrenewcommand\algorithmicdo{\textbf{do}}
\algrenewcommand\algorithmicwhile{\textbf{while}}
\algrenewcommand\algorithmicfor{\textbf{for}}
\algrenewcommand\algorithmicif{\textbf{if}}
\algrenewcommand\algorithmicthen{\textbf{then}}
\algrenewcommand\algorithmicelse{\textbf{else}}
\algrenewcommand\algorithmicreturn{\textbf{return}}
\algrenewcommand\algorithmicfunction{\textbf{function}}
\algrenewcommand\algorithmicprocedure{\textbf{procedure}}

% ==========================
% TODOs 
% ==========================
\RequirePackage[colorinlistoftodos,prependcaption,textsize=small]{todonotes}
% rapid todo commands
\newcommand{\TODO}[1]{\todo[color=warncolor!40]{#1}}         % margin
\newcommand{\TODOinline}[1]{\todo[inline,color=warncolor!20]{#1}} % inline
\newcommand{\FIXME}[1]{\todo[color=csyellow!45]{#1}}

% =============================================================================
% END OF CLASS
% =============================================================================

\endinput
