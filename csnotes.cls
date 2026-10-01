% =============================================================================
% Computer Science Notes Class
% =============================================================================
% Custom class for university Computer Science notes
% Author: Riccardo Elena
% Date: 2025
% =============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csnotes}[2025/10/07 Computer Science Notes Class]

% =============================================================================
% CLASS OPTIONS FOR LANGUAGE SELECTION
% =============================================================================

\newif\ifcsnotes@english
\newif\ifcsnotes@italian

\csnotes@englishfalse
\csnotes@italianfalse

\DeclareOption{english}{
  \csnotes@englishtrue
  \csnotes@italianfalse
}

\DeclareOption{italian}{
  \csnotes@englishfalse
  \csnotes@italiantrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\ifcsnotes@english
  \def\csnotes@lang{english}
\else
  \def\csnotes@lang{italian}
\fi

% Base class
\LoadClass[a4paper,11pt,openany]{report}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

% =============================================================================
% ESSENTIAL PACKAGES
% =============================================================================

% Encoding and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[main=\csnotes@lang,english,italian]{babel}
\RequirePackage[\csnotes@lang]{datetime2}

% Mathematics
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bussproofs}
\RequirePackage{proof}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{stmaryrd}
\RequirePackage{centernot}

% Graphics and colors
\RequirePackage{graphicx}
\RequirePackage[dvipsnames,svgnames,x11names]{xcolor}
\RequirePackage{forest}
\RequirePackage{tikz}
\usetikzlibrary{automata,trees,positioning,arrows.meta,calc,cd,shapes.geometric,shapes.symbols}
\RequirePackage{tcolorbox}
\RequirePackage{etoolbox}
\tcbuselibrary{most,theorems}


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

\graphicspath{ {_files/}{template/_files/} }


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
% Extra/Verified symbol (book)
\newcommand{\extrasymbol}{%
    \raisebox{-0.15ex}{%
        \begin{tikzpicture}[baseline=-0.1ex, scale=0.3]
            % Left page
            \fill[csgreen!20] (0,0) -- (0.6,0.1) -- (0.6,1.3) -- (0,1.4) -- cycle;
            \draw[csgreen!70, line width=0.3pt] (0,0) -- (0.6,0.1);
            \draw[csgreen!70, line width=0.3pt] (0,1.4) -- (0.6,1.3);
            \draw[csgreen!70, line width=0.3pt] (0,0) -- (0,1.4);

            \fill[csgreen!5] (0.05,0.1) -- (0.6,0.2) -- (0.6,1.2) -- (0.05,1.3) -- cycle;
            \draw[csgreen!70, line width=0.3pt] (0.1,0.1) -- (0.6,0.2);
            \draw[csgreen!70, line width=0.3pt] (0.1,1.3) -- (0.6,1.2);
            \draw[csgreen!70, line width=0.3pt] (0.1,0.1) -- (0.1,1.3);

            \draw[csgreen!70, line width=0.3pt] (0.05,0.1) -- (0.6,0.2);
            \draw[csgreen!70, line width=0.3pt] (0.05,1.3) -- (0.6,1.2);
            \draw[csgreen!70, line width=0.3pt] (0.05,0.1) -- (0.05,1.3);
            % Right page
            \fill[csgreen!20] (0.6,0.1) -- (1.2,0) -- (1.2,1.4) -- (0.6,1.3) -- cycle;
            \draw[csgreen!70, line width=0.3pt] (0.6,0.1) -- (1.2,0);
            \draw[csgreen!70, line width=0.3pt] (1.2,0) -- (1.2,1.4);
            \draw[csgreen!70, line width=0.3pt] (1.2,1.4) -- (0.6,1.3);

            
            \fill[csgreen!5] (0.6,0.2) -- (1.13,0.1) -- (1.13,1.3) -- (0.6,1.2) -- cycle;
            \draw[csgreen!70, line width=0.3pt] (0.6,0.2) -- (1.1,0.1);
            \draw[csgreen!70, line width=0.3pt] (1.1,0.1) -- (1.1,1.3);
            \draw[csgreen!70, line width=0.3pt] (1.1,1.3) -- (0.6,1.2);
            
            \draw[csgreen!70, line width=0.3pt] (0.6,0.2) -- (1.13,0.1);
            \draw[csgreen!70, line width=0.3pt] (1.13,0.1) -- (1.13,1.3);
            \draw[csgreen!70, line width=0.3pt] (1.13,1.3) -- (0.6,1.2);
            % Central fold
            \draw[csgreen!20, line width=0.4pt] (0.6,0.2) -- (0.6,1.2);
            % Mark (small checkmark)
            \node[csgreen!70, scale=0.7] at (0.6,0.7) {\tiny\textit{\textbf{+}}};
        \end{tikzpicture}%
    }%
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
% LOCALIZATION STRINGS
% =============================================================================
% Pre-define all strings with Italian defaults for backward compatibility.
% Babel caption hooks select the localized strings at \begin{document}.

\makeatletter

% --- Italian defaults ---
\def\csnotes@str@def{Definizione}
\def\csnotes@str@defs{Definizioni}
\def\csnotes@str@thm{Teorema}
\def\csnotes@str@thms{Teoremi}
\def\csnotes@str@lem{Lemma}
\def\csnotes@str@lems{Lemmi}
\def\csnotes@str@prop{Proposizione}
\def\csnotes@str@props{Proposizioni}
\def\csnotes@str@cor{Corollario}
\def\csnotes@str@cors{Corollari}
\def\csnotes@str@ex{Esempio}
\def\csnotes@str@exs{Esempi}
\def\csnotes@str@note{Nota}
\def\csnotes@str@notes{Note}
\def\csnotes@str@obs{Osservazione}
\def\csnotes@str@obss{Osservazioni}
\def\csnotes@str@warn{Attenzione}
\def\csnotes@str@warns{Attenzioni}
\def\csnotes@str@algo{Algoritmo}
\def\csnotes@str@algos{Algoritmi}
\def\csnotes@str@appendix{Appendice}
\def\csnotes@str@appendices{Appendici}
\def\csnotes@str@chap{Capitolo}
\def\csnotes@str@chaps{Capitoli}
\def\csnotes@str@sec{Sezione}
\def\csnotes@str@secs{Sezioni}
\def\csnotes@str@subsec{Sottosezione}
\def\csnotes@str@subsecs{Sottosezioni}
\def\csnotes@str@fig{Figura}
\def\csnotes@str@figs{Figure}
\def\csnotes@str@tab{Tabella}
\def\csnotes@str@tabs{Tabelle}
\def\csnotes@str@eq{Equazione}
\def\csnotes@str@eqs{Equazioni}
\def\csnotes@str@proof{Dimostrazione}
\def\csnotes@str@abstract{Scopo del documento}
\def\csnotes@str@coursetitle{Appunti del corso di}
\def\csnotes@str@students{Studenti:}
\def\csnotes@str@date{Data:}
\def\csnotes@str@endnotes{Fine degli appunti}
\def\csnotes@str@noteswritten{Questi appunti sono stati redatti durante\\ l'anno accademico}
\def\csnotes@str@at{presso}
\def\csnotes@str@listthm{Indice di teoremi e definizioni}
\def\csnotes@str@listex{Indice degli esempi}
\def\csnotes@str@listalgo{Indice degli algoritmi}
\def\csnotes@str@algoname{Scaricabile:}
\def\csnotes@str@end{end}
\def\csnotes@str@do{do}
\def\csnotes@str@while{while}
\def\csnotes@str@for{for}
\def\csnotes@str@if{if}
\def\csnotes@str@then{then}
\def\csnotes@str@else{else}
\def\csnotes@str@return{return}
\def\csnotes@str@function{function}
\def\csnotes@str@procedure{procedure}

% Preserve the default strings before Babel applies a language hook.
\let\csnotes@default@str@def\csnotes@str@def
\let\csnotes@default@str@defs\csnotes@str@defs
\let\csnotes@default@str@thm\csnotes@str@thm
\let\csnotes@default@str@thms\csnotes@str@thms
\let\csnotes@default@str@lem\csnotes@str@lem
\let\csnotes@default@str@lems\csnotes@str@lems
\let\csnotes@default@str@prop\csnotes@str@prop
\let\csnotes@default@str@props\csnotes@str@props
\let\csnotes@default@str@cor\csnotes@str@cor
\let\csnotes@default@str@cors\csnotes@str@cors
\let\csnotes@default@str@ex\csnotes@str@ex
\let\csnotes@default@str@exs\csnotes@str@exs
\let\csnotes@default@str@note\csnotes@str@note
\let\csnotes@default@str@notes\csnotes@str@notes
\let\csnotes@default@str@obs\csnotes@str@obs
\let\csnotes@default@str@obss\csnotes@str@obss
\let\csnotes@default@str@warn\csnotes@str@warn
\let\csnotes@default@str@warns\csnotes@str@warns
\let\csnotes@default@str@algo\csnotes@str@algo
\let\csnotes@default@str@algos\csnotes@str@algos
\let\csnotes@default@str@end\csnotes@str@end
\let\csnotes@default@str@do\csnotes@str@do
\let\csnotes@default@str@while\csnotes@str@while
\let\csnotes@default@str@for\csnotes@str@for
\let\csnotes@default@str@if\csnotes@str@if
\let\csnotes@default@str@then\csnotes@str@then
\let\csnotes@default@str@else\csnotes@str@else
\let\csnotes@default@str@return\csnotes@str@return
\let\csnotes@default@str@function\csnotes@str@function
\let\csnotes@default@str@procedure\csnotes@str@procedure
\let\csnotes@default@str@appendix\csnotes@str@appendix
\let\csnotes@default@str@appendices\csnotes@str@appendices
\let\csnotes@default@str@chap\csnotes@str@chap
\let\csnotes@default@str@chaps\csnotes@str@chaps
\let\csnotes@default@str@sec\csnotes@str@sec
\let\csnotes@default@str@secs\csnotes@str@secs
\let\csnotes@default@str@subsec\csnotes@str@subsec
\let\csnotes@default@str@subsecs\csnotes@str@subsecs
\let\csnotes@default@str@fig\csnotes@str@fig
\let\csnotes@default@str@figs\csnotes@str@figs
\let\csnotes@default@str@tab\csnotes@str@tab
\let\csnotes@default@str@tabs\csnotes@str@tabs
\let\csnotes@default@str@eq\csnotes@str@eq
\let\csnotes@default@str@eqs\csnotes@str@eqs
\let\csnotes@default@str@proof\csnotes@str@proof
\let\csnotes@default@str@abstract\csnotes@str@abstract
\let\csnotes@default@str@coursetitle\csnotes@str@coursetitle
\let\csnotes@default@str@students\csnotes@str@students
\let\csnotes@default@str@date\csnotes@str@date
\let\csnotes@default@str@endnotes\csnotes@str@endnotes
\let\csnotes@default@str@noteswritten\csnotes@str@noteswritten
\let\csnotes@default@str@at\csnotes@str@at
\let\csnotes@default@str@listthm\csnotes@str@listthm
\let\csnotes@default@str@listex\csnotes@str@listex
\let\csnotes@default@str@listalgo\csnotes@str@listalgo
\let\csnotes@default@str@algoname\csnotes@str@algoname

\def\csnotes@restore@default{%
    \let\csnotes@str@def\csnotes@default@str@def
    \let\csnotes@str@defs\csnotes@default@str@defs
    \let\csnotes@str@thm\csnotes@default@str@thm
    \let\csnotes@str@thms\csnotes@default@str@thms
    \let\csnotes@str@lem\csnotes@default@str@lem
    \let\csnotes@str@lems\csnotes@default@str@lems
    \let\csnotes@str@prop\csnotes@default@str@prop
    \let\csnotes@str@props\csnotes@default@str@props
    \let\csnotes@str@cor\csnotes@default@str@cor
    \let\csnotes@str@cors\csnotes@default@str@cors
    \let\csnotes@str@ex\csnotes@default@str@ex
    \let\csnotes@str@exs\csnotes@default@str@exs
    \let\csnotes@str@note\csnotes@default@str@note
    \let\csnotes@str@notes\csnotes@default@str@notes
    \let\csnotes@str@obs\csnotes@default@str@obs
    \let\csnotes@str@obss\csnotes@default@str@obss
    \let\csnotes@str@warn\csnotes@default@str@warn
    \let\csnotes@str@warns\csnotes@default@str@warns
    \let\csnotes@str@algo\csnotes@default@str@algo
    \let\csnotes@str@algos\csnotes@default@str@algos
    \let\csnotes@str@appendix\csnotes@default@str@appendix
    \let\csnotes@str@appendices\csnotes@default@str@appendices
    \let\csnotes@str@chap\csnotes@default@str@chap
    \let\csnotes@str@chaps\csnotes@default@str@chaps
    \let\csnotes@str@sec\csnotes@default@str@sec
    \let\csnotes@str@secs\csnotes@default@str@secs
    \let\csnotes@str@subsec\csnotes@default@str@subsec
    \let\csnotes@str@subsecs\csnotes@default@str@subsecs
    \let\csnotes@str@fig\csnotes@default@str@fig
    \let\csnotes@str@figs\csnotes@default@str@figs
    \let\csnotes@str@tab\csnotes@default@str@tab
    \let\csnotes@str@tabs\csnotes@default@str@tabs
    \let\csnotes@str@eq\csnotes@default@str@eq
    \let\csnotes@str@eqs\csnotes@default@str@eqs
    \let\csnotes@str@proof\csnotes@default@str@proof
    \let\csnotes@str@abstract\csnotes@default@str@abstract
    \let\csnotes@str@coursetitle\csnotes@default@str@coursetitle
    \let\csnotes@str@students\csnotes@default@str@students
    \let\csnotes@str@date\csnotes@default@str@date
    \let\csnotes@str@endnotes\csnotes@default@str@endnotes
    \let\csnotes@str@noteswritten\csnotes@default@str@noteswritten
    \let\csnotes@str@at\csnotes@default@str@at
    \let\csnotes@str@listthm\csnotes@default@str@listthm
    \let\csnotes@str@listex\csnotes@default@str@listex
    \let\csnotes@str@listalgo\csnotes@default@str@listalgo
    \let\csnotes@str@algoname\csnotes@default@str@algoname
    \let\csnotes@str@end\csnotes@default@str@end
    \let\csnotes@str@do\csnotes@default@str@do
    \let\csnotes@str@while\csnotes@default@str@while
    \let\csnotes@str@for\csnotes@default@str@for
    \let\csnotes@str@if\csnotes@default@str@if
    \let\csnotes@str@then\csnotes@default@str@then
    \let\csnotes@str@else\csnotes@default@str@else
    \let\csnotes@str@return\csnotes@default@str@return
    \let\csnotes@str@function\csnotes@default@str@function
    \let\csnotes@str@procedure\csnotes@default@str@procedure
}

% --- Italian babel hook ---
\addto\captionsitalian{
  \def\csnotes@str@def{Definizione}
  \def\csnotes@str@defs{Definizioni}
  \def\csnotes@str@thm{Teorema}
  \def\csnotes@str@thms{Teoremi}
  \def\csnotes@str@lem{Lemma}
  \def\csnotes@str@lems{Lemmi}
  \def\csnotes@str@prop{Proposizione}
  \def\csnotes@str@props{Proposizioni}
  \def\csnotes@str@cor{Corollario}
  \def\csnotes@str@cors{Corollari}
  \def\csnotes@str@ex{Esempio}
  \def\csnotes@str@exs{Esempi}
  \def\csnotes@str@note{Nota}
  \def\csnotes@str@notes{Note}
  \def\csnotes@str@obs{Osservazione}
  \def\csnotes@str@obss{Osservazioni}
  \def\csnotes@str@warn{Attenzione}
  \def\csnotes@str@warns{Attenzioni}
  \def\csnotes@str@algo{Algoritmo}
  \def\csnotes@str@algos{Algoritmi}
  \def\csnotes@str@appendix{Appendice}
  \def\csnotes@str@appendices{Appendici}
  \def\csnotes@str@chap{Capitolo}
  \def\csnotes@str@chaps{Capitoli}
  \def\csnotes@str@sec{Sezione}
  \def\csnotes@str@secs{Sezioni}
  \def\csnotes@str@subsec{Sottosezione}
  \def\csnotes@str@subsecs{Sottosezioni}
  \def\csnotes@str@fig{Figura}
  \def\csnotes@str@figs{Figure}
  \def\csnotes@str@tab{Tabella}
  \def\csnotes@str@tabs{Tabelle}
  \def\csnotes@str@eq{Equazione}
  \def\csnotes@str@eqs{Equazioni}
  \def\csnotes@str@proof{Dimostrazione}
  \def\csnotes@str@abstract{Scopo del documento}
  \def\csnotes@str@coursetitle{Appunti del corso di}
  \def\csnotes@str@students{Studenti:}
  \def\csnotes@str@date{Data:}
  \def\csnotes@str@endnotes{Fine degli appunti}
  \def\csnotes@str@noteswritten{Questi appunti sono stati redatti durante\\ l'anno accademico}
  \def\csnotes@str@at{presso}
  \def\csnotes@str@listthm{Indice di teoremi e definizioni}
  \def\csnotes@str@listex{Indice degli esempi}
  \def\csnotes@str@listalgo{Indice degli algoritmi}
  \def\csnotes@str@algoname{Scaricabile:}
  \def\csnotes@str@end{fine}
  \def\csnotes@str@do{fai}
  \def\csnotes@str@while{mentre}
  \def\csnotes@str@for{per}
  \def\csnotes@str@if{se}
  \def\csnotes@str@then{allora}
  \def\csnotes@str@else{altrimenti}
  \def\csnotes@str@return{restituisci}
  \def\csnotes@str@function{funzione}
  \def\csnotes@str@procedure{procedura}
}

% --- English babel hook ---
\addto\captionsenglish{
  \def\csnotes@str@def{Definition}
  \def\csnotes@str@defs{Definitions}
  \def\csnotes@str@thm{Theorem}
  \def\csnotes@str@thms{Theorems}
  \def\csnotes@str@lem{Lemma}
  \def\csnotes@str@lems{Lemmas}
  \def\csnotes@str@prop{Proposition}
  \def\csnotes@str@props{Propositions}
  \def\csnotes@str@cor{Corollary}
  \def\csnotes@str@cors{Corollaries}
  \def\csnotes@str@ex{Example}
  \def\csnotes@str@exs{Examples}
  \def\csnotes@str@note{Note}
  \def\csnotes@str@notes{Notes}
  \def\csnotes@str@obs{Observation}
  \def\csnotes@str@obss{Observations}
  \def\csnotes@str@warn{Warning}
  \def\csnotes@str@warns{Warnings}
  \def\csnotes@str@algo{Algorithm}
  \def\csnotes@str@algos{Algorithms}
  \def\csnotes@str@appendix{Appendix}
  \def\csnotes@str@appendices{Appendices}
  \def\csnotes@str@chap{Chapter}
  \def\csnotes@str@chaps{Chapters}
  \def\csnotes@str@sec{Section}
  \def\csnotes@str@secs{Sections}
  \def\csnotes@str@subsec{Subsection}
  \def\csnotes@str@subsecs{Subsections}
  \def\csnotes@str@fig{Figure}
  \def\csnotes@str@figs{Figures}
  \def\csnotes@str@tab{Table}
  \def\csnotes@str@tabs{Tables}
  \def\csnotes@str@eq{Equation}
  \def\csnotes@str@eqs{Equations}
  \def\csnotes@str@proof{Proof}
  \def\csnotes@str@abstract{Document overview}
  \def\csnotes@str@coursetitle{Course notes for}
  \def\csnotes@str@students{Students:}
  \def\csnotes@str@date{Date:}
  \def\csnotes@str@endnotes{End of notes}
  \def\csnotes@str@noteswritten{These notes were prepared during\\
    the academic year}
  \def\csnotes@str@at{at}
  \def\csnotes@str@listthm{Index of theorems and definitions}
  \def\csnotes@str@listex{Index of examples}
  \def\csnotes@str@listalgo{Index of algorithms}
  \def\csnotes@str@algoname{Dischargeable:}
  \def\csnotes@str@end{end}
  \def\csnotes@str@do{do}
  \def\csnotes@str@while{while}
  \def\csnotes@str@for{for}
  \def\csnotes@str@if{if}
  \def\csnotes@str@then{then}
  \def\csnotes@str@else{else}
  \def\csnotes@str@return{return}
  \def\csnotes@str@function{function}
  \def\csnotes@str@procedure{procedure}
}

% --- Cleveref names: set at begin document based on language option ---
\AtBeginDocument{
    \ifcsnotes@english
        % English Babel strings are already selected.
    \else
        \ifcsnotes@italian
            % Italian Babel strings are already selected.
        \else
            \csnotes@restore@default
        \fi
    \fi

  \ifcsnotes@english
    \crefname{theorem}{theorem}{theorems}
    \Crefname{theorem}{Theorem}{Theorems}
    \crefname{corollary}{corollary}{corollaries}
    \Crefname{corollary}{Corollary}{Corollaries}
    \crefname{lemma}{lemma}{lemmas}
    \Crefname{lemma}{Lemma}{Lemmas}
    \crefname{proposition}{proposition}{propositions}
    \Crefname{proposition}{Proposition}{Propositions}
    \crefname{definition}{definition}{definitions}
    \Crefname{definition}{Definition}{Definitions}
    \crefname{example}{example}{examples}
    \Crefname{example}{Example}{Examples}
    \crefname{note}{note}{notes}
    \Crefname{note}{Note}{Notes}
    \crefname{observation}{observation}{observations}
    \Crefname{observation}{Observation}{Observations}
    \crefname{warning}{warning}{warnings}
    \Crefname{warning}{Warning}{Warnings}
    \crefname{algorithm}{algorithm}{algorithms}
    \Crefname{algorithm}{Algorithm}{Algorithms}
    \crefname{appendix}{appendix}{appendices}
    \Crefname{appendix}{Appendix}{Appendices}
    \crefname{chapter}{chapter}{chapters}
    \Crefname{chapter}{Chapter}{Chapters}
    \crefname{section}{section}{sections}
    \Crefname{section}{Section}{Sections}
    \crefname{subsection}{subsection}{subsections}
    \Crefname{subsection}{Subsection}{Subsections}
    \crefname{figure}{figure}{figures}
    \Crefname{figure}{Figure}{Figures}
    \crefname{table}{table}{tables}
    \Crefname{table}{Table}{Tables}
    \crefname{equation}{equation}{equations}
    \Crefname{equation}{Equation}{Equations}
  \else
    \ifcsnotes@italian
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
      \crefname{observation}{osservazione}{osservazioni}
      \Crefname{observation}{Osservazione}{Osservazioni}
      \crefname{warning}{attenzione}{attenzioni}
      \Crefname{warning}{Attenzione}{Attenzioni}
      \crefname{algorithm}{algoritmo}{algoritmi}
      \Crefname{algorithm}{Algoritmo}{Algoritmi}
      \crefname{appendix}{appendice}{appendici}
      \Crefname{appendix}{Appendice}{Appendici}
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
      \else
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
        \crefname{observation}{osservazione}{osservazioni}
        \Crefname{observation}{Osservazione}{Osservazioni}
        \crefname{warning}{attenzione}{attenzioni}
        \Crefname{warning}{Attenzione}{Attenzioni}
        \crefname{algorithm}{algoritmo}{algoritmi}
        \Crefname{algorithm}{Algoritmo}{Algoritmi}
        \crefname{appendix}{appendice}{appendici}
        \Crefname{appendix}{Appendice}{Appendici}
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
      \fi
  \fi
}

% =============================================================================
% CUSTOM ALTERNATE REFERENCES
% =============================================================================

\newcommand{\crefalt}[2][black]{{\hypersetup{linkcolor={#1}}\cref{#2}}}
\newcommand{\Crefalt}[2][black]{{\hypersetup{linkcolor={#1}}\Cref{#2}}}

% =============================================================================
% NAMED REFERENCE SYSTEM
% =============================================================================

% Storage for environment names (label -> name)
\ExplSyntaxOn
\prop_new:N \g_envnames_prop

% Internal command called both at runtime and from .aux
\NewDocumentCommand{\csnotesstorelabelname}{m m}{
    \prop_gput:Nnn \g_envnames_prop {#1} {#2}
}

% Command to save label+name
\NewDocumentCommand{\savelabelname}{m m}{
    \tl_if_empty:nF {#2} {
        \csnotesstorelabelname{#1}{#2}
        \protected@write\@auxout{}{
            \string\csnotesstorelabelname{#1}{#2}
        }
    }
}

% Command to retrieve the name
\NewDocumentCommand{\getlabelname}{m}{
    \prop_if_in:NnTF \g_envnames_prop {#1}
        { ~ (\prop_item:Nn \g_envnames_prop {#1})}
        { ~ (\nameref*{#1})}
}

% Specialized commands for named references
% Use these instead of \Cref and \cref when you want to include the name
\NewDocumentCommand{\Namedcref}{m}{
    \cref{#1}\getlabelname{#1}
}

\NewDocumentCommand{\Namedref}{m}{
    \Cref{#1}\getlabelname{#1}
}

\NewDocumentCommand{\Namedonly}{m}{
    \prop_if_in:NnTF \g_envnames_prop {#1}
        {\prop_item:Nn \g_envnames_prop {#1}}
        {\nameref*{#1}}
}
\NewDocumentCommand{\Namedonlyhref}{m}{
    \prop_if_in:NnTF \g_envnames_prop {#1}
        {\hyperref[#1]{\prop_item:Nn \g_envnames_prop {#1}}}
        {\nameref{#1}}
}

\ExplSyntaxOff

% Custom tcolorbox key: saves label and name together
\tcbset{
    namedlabel/.code 2 args={
        \tcbset{label={#1}}
        \savelabelname{#1}{#2}
    }
}

% Ensure chapter titles are used for the header (\leftmark)
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

% -----------------------------------------------------------------------------
% Abstract customization
% The default title is localized; users can override with \setabstracttitle{...}
\newcommand{\abstracttitle}{\csnotes@str@abstract}
\newcommand{\setabstracttitle}[1]{\renewcommand{\abstracttitle}{#1}}

\newcommand{\whitepage}{
  \newpage
  \thispagestyle{empty}
  \mbox{}
  \newpage
}

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
    },
    theoremboxwhite/.style={
        enhanced,
        colback=white,
        colframe=#1!80!black,
        colbacktitle=white,
        coltitle=#1!80!black,
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
\def\csnoteslisttitle{}
\tcbset{listtitle/.store in=\csnoteslisttitle}

% Definition environment
\newtcolorbox[auto counter, number within=section]{definition}[2][]{
    theorembox=defcolor,
    listtitle={#2},
    title={\csnotes@str@def~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{thm.toc}{definition}{\protect\numberline{\thetcbcounter}\csnotes@str@def\ifstrempty{\csnoteslisttitle}{#2}{:\ \csnoteslisttitle}}},
    label type=definition,
    #1
}

% Theorem environment
\newtcolorbox[auto counter, number within=section]{theorem}[2][]{
    theorembox=thmcolor,
    listtitle={#2},
    title={\csnotes@str@thm~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{thm.toc}{theorem}{\protect\numberline{\thetcbcounter}\csnotes@str@thm\ifstrempty{\csnoteslisttitle}{#2}{:\ \csnoteslisttitle}}},
    label type=theorem,
    #1
}

% Lemma environment
\newtcolorbox[auto counter, number within=section]{lemma}[2][]{
    theorembox=lemcolor,
    listtitle={#2},
    title={\csnotes@str@lem~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{thm.toc}{lemma}{\protect\numberline{\thetcbcounter}\csnotes@str@lem\ifstrempty{\csnoteslisttitle}{#2}{:\ \csnoteslisttitle}}},
    label type=lemma,
    #1
}

% Proposition environment
\newtcolorbox[auto counter, number within=section]{proposition}[2][]{
    theorembox=propcolor,
    listtitle={#2},
    title={\csnotes@str@prop~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{thm.toc}{proposition}{\protect\numberline{\thetcbcounter}\csnotes@str@prop\ifstrempty{\csnoteslisttitle}{#2}{:\ \csnoteslisttitle}}},
    label type=proposition,
    #1
}

% Corollary environment
\newtcolorbox[auto counter, number within=section]{corollary}[2][]{
    theorembox=corcolor,
    listtitle={#2},
    title={\csnotes@str@cor~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{thm.toc}{corollary}{\protect\numberline{\thetcbcounter}\csnotes@str@cor\ifstrempty{\csnoteslisttitle}{#2}{:\ \csnoteslisttitle}}},
    label type=corollary,
    #1
}

% Example environment
\newtcolorbox[auto counter, number within=section]{example}[2][]{
    theorembox=excolor,
    title={\csnotes@str@ex~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{ex.toc}{example}{\protect\numberline{\thetcbcounter}\csnotes@str@ex\ifstrempty{#2}{}{:\ #2}}},
    label type=example,
    #1
}  

% Note environment (NO INDEX)
\newtcolorbox[auto counter, number within=section]{note}[2][]{
    theoremboxwhite=notecolor,
    title={\infosymbol{}  \csnotes@str@note~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=note,
    #1
}

% Observation environment
\newtcolorbox[auto counter, number within=section]{observation}[2][]{
    theorembox=notecolor,
    title={\csnotes@str@obs~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=observation,
    #1
}

% Warning/Alert environment (NO INDEX)
\newtcolorbox[auto counter, number within=section]{warning}[2][]{
    theorembox=warncolor,
    title={\csnotes@str@warn~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    label type=warning,
    #1
}

% Algorithm environment
\newtcolorbox[auto counter, number within=section]{algorithmdesc}[2][]{
    theorembox=algocolor,
    title={\csnotes@str@algo~\thetcbcounter\ifstrempty{#2}{}{:~#2}},
    before upper={\addcontentsline{algo.toc}{algorithmdesc}{\protect\numberline{\thetcbcounter}\csnotes@str@algo\ifstrempty{#2}{}{:\ #2}}},
    label type=algorithm,
    #1
}
% Customized proof environment
\renewenvironment{proof}[1][\csnotes@str@proof]
    {\par\vspace{10pt}\noindent\textbf{\color{csblue}#1.}\ \normalfont\color{csblue!45!black}\phantomsection\ignorespaces}
  {\hfill$\square$\par\vspace{10pt}}

% =============================================================================
% CUSTOM COMMANDS
% =============================================================================

% Command for keywords in bold blue
\newcommand{\keyword}[1]{\textcolor{csblue}{\textbf{#1}}}

% Inline code command
\newcommand{\code}[1]{\texttt{\colorbox{codebg}{#1}}}

% Commands for correct quotes (avoid warnings)
\newcommand{\q}[1]{``{#1}''}           % Standard quotes
\newcommand{\qi}[1]{``\textit{#1}''} % Quotes with italic text

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
\newcommand{\st}{:} % such that

% Command for proof rule labels (automatically wraps in parentheses and math mode)
\newcommand{\pool}[1]{\hfill{\footnotesize \csnotes@str@algoname\ #1}}
\NewDocumentCommand{\RuleLabel}{m o}{
  \IfNoValueTF{#2}
    {\RightLabel{(#1)}}
    {\RightLabel{(#1), \pool{#2}}}
}

\newcommand{\bpstrut}{\vphantom{\(\forall_p^q\)}}

\let\oldAxiomC\AxiomC
\let\oldUnaryInfC\UnaryInfC
\let\oldBinaryInfC\BinaryInfC
\let\oldTrinaryInfC\TrinaryInfC

\renewcommand{\AxiomC}[1]{\oldAxiomC{\bpstrut #1}}
\renewcommand{\UnaryInfC}[1]{\oldUnaryInfC{\bpstrut #1}}
\renewcommand{\BinaryInfC}[1]{\oldBinaryInfC{\bpstrut #1}}
\renewcommand{\TrinaryInfC}[1]{\oldTrinaryInfC{\bpstrut #1}}


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
\newcommand{\maketitlepage}{
    \begin{titlepage}
        % --- Sidebar with TikZ ---
        \begin{tikzpicture}[remember picture, overlay]
            % Blue sidebar
            \fill[csblue] 
                (current page.south west) rectangle 
                ([xshift=5cm]current page.north west);
            
            % Background logo in transparency (centered in white area)
            \node[opacity=0.08, inner sep=0pt] at ([xshift=2.75cm]current page.center) {
                \includegraphics[width=15cm]{_images/logo}
            };
        \end{tikzpicture}

        \vspace*{-.5cm}
        \enlargethispage{1cm}
        
        % --- Header (Right-aligned) ---
                \hspace*{5cm}
                \begin{minipage}[t]{\dimexpr\textwidth-5cm\relax}
          \begin{flushright}
              {\Large\textsc{\@university}}\\[0.2cm]
              {\normalsize\textsc{\@department}}\\[0.1cm]
              {\normalsize\textsc{\@course}}
              
              \null\hfill\rule{0.7\linewidth}{1pt}
          \end{flushright}
        \end{minipage}
        
        
        \vfill
        
        % --- Main Title (Left-aligned in white area) ---
        \hspace*{5cm} 
        \begin{minipage}[t]{\dimexpr\textwidth-5cm\relax}
            \begin{flushleft}
                {\Large \csnotes@str@coursetitle}\\[0.5cm]
                {\Huge\bfseries\color{black!80}\@subject}\\[0.2cm]
                
                \vspace{0.1cm}
                \rule{0.6\textwidth}{3pt}
                \vspace{0.1cm}
            \end{flushleft}
        \end{minipage}

        \vfill
        
        % --- Metadata (Students, Date, Academic Year) ---
        \hspace*{5cm} 
        \begin{minipage}[b]{\dimexpr\textwidth-5cm\relax}
            
            % Students on the left
            \begin{minipage}{0.4\linewidth}
                \begin{flushleft}
                    \large
                    \textbf{\csnotes@str@students}\\
                    \@author
                \end{flushleft}
            \end{minipage}
            \hfill
            % Date on the right
            \begin{minipage}{0.4\linewidth}
                \begin{flushright}
                    \large
                    \textbf{\csnotes@str@date}\\
                    \@date
                \end{flushright}
            \end{minipage}
            
            \vspace{2cm}
            
            % Academic Year centered
            \begin{center}
                {\large\@academicyear}
            \end{center}
            
            \vspace{1cm}
        \end{minipage}
        
    \end{titlepage}
}

% Command to create the back cover page
\newcommand{\makebackcover}{
    \clearpage
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        % Blue sidebar (same as front cover)
        \fill[csblue] 
            (current page.south west) rectangle 
            ([xshift=5cm]current page.north west);
        
        % Background logo in transparency (optional, centered in white area)
        \node[opacity=0.05, inner sep=0pt] at ([xshift=2.75cm]current page.center) {
            \includegraphics[width=15cm]{_images/logo}
        };
    \end{tikzpicture}
    
    \vspace*{-2cm}
    \enlargethispage{2cm}
    
    % Back cover content (optional)
    \noindent\hspace*{5.5cm}%
    \begin{minipage}[c][\textheight][c]{\dimexpr\textwidth-6cm\relax}
        \begin{center}
            \vfill
            
            {\large\textit{\csnotes@str@endnotes}}
            
            \vspace{2cm}
            
            {\normalsize
            \csnotes@str@noteswritten\ \@academicyear\\[1cm]
            \csnotes@str@at\ \@university
            }
            
            \vfill
        \end{center}
    \end{minipage}
    
    \clearpage
}

% =============================================================================
% ALGORITHM CONFIGURATION
% =============================================================================

\algrenewcommand\algorithmicend{\csnotes@str@end}
\algrenewcommand\algorithmicdo{\csnotes@str@do}
\algrenewcommand\algorithmicwhile{\csnotes@str@while}
\algrenewcommand\algorithmicfor{\csnotes@str@for}
\algrenewcommand\algorithmicif{\csnotes@str@if}
\algrenewcommand\algorithmicthen{\csnotes@str@then}
\algrenewcommand\algorithmicelse{\csnotes@str@else}
\algrenewcommand\algorithmicreturn{\csnotes@str@return}
\algrenewcommand\algorithmicfunction{\csnotes@str@function}
\algrenewcommand\algorithmicprocedure{\csnotes@str@procedure}

% ==========================
% TODOs 
% ==========================
\RequirePackage[
  colorinlistoftodos,
  prependcaption,
  textsize=small
  ]{todonotes}
% rapid todo commands
\newcommand{\TODO}[1]{\todo[color=warncolor!40]{#1}}         % margin
\newcommand{\TODOinline}[1]{\todo[inline,color=warncolor!20]{#1}} % inline
\newcommand{\FIXME}[1]{\todo[color=csyellow!45]{#1}}

% THEOREM INDEX (LIST) SUPPORT
% Three separate indices: summary (definitions, theorems, lemmas, propositions, corollaries),
% examples, and algorithms. Notes/Observations/Warnings excluded.
\makeatletter
\newcommand{\listtheoremname}{\csnotes@str@listthm}
\newcommand{\listexamplename}{\csnotes@str@listex}
\newcommand{\listalgoname}{\csnotes@str@listalgo}

% Display macros for the three .toc files
\newcommand{\l@definition}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@theorem}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@lemma}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@proposition}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@corollary}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@example}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}
\newcommand{\l@algorithmdesc}[2]{\@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}}

% Three index commands with three separate files
\newcommand{\listoftheorems}{\cleardoublepage\section*{\listtheoremname}\@starttoc{thm.toc}}
\newcommand{\listofexamples}{\cleardoublepage\section*{\listexamplename}\@starttoc{ex.toc}}
\newcommand{\listofalgos}{\cleardoublepage\section*{\listalgoname}\@starttoc{algo.toc}}
\makeatother

% =============================================================================
% END OF CLASS
% =============================================================================

\endinput
