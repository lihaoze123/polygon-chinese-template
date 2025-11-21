\documentclass[12pt,a4paper,oneside]{ctexart}
\usepackage[chinese]{olymp}
\usepackage{lastpage}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{color} % for colored text
\usepackage{import} % for changing current dir
\usepackage{epigraph}
\usepackage{wrapfig} % for having text alongside pictures
\usepackage{verbatim}
\usepackage{indentfirst}
\usepackage[table,xcdraw]{xcolor}
\usepackage{booktabs}
\setlength{\parindent}{2em}
\usepackage{etoolbox}

\def\NoInputFileName{}
\def\NoOutputFileName{}
\def\NoTimeLimit{}
\def\NoMemoryLimit{}

\newcounter{probcount}
\renewcommand{\theprobcount}{\Alph{probcount}}
\def\probtablecontent{}

\newcommand{\addprobtotable}[2]{\gappto\probtablecontent{#1 & #2 \\}}

\makeatletter
\newcommand{\problemtitle}[1]{%
    \stepcounter{probcount}%
    \protected@write\@auxout{}{\string\addprobtotable{\theprobcount}{#1}}%
}
\AtEndDocument{
    \immediate\write\@auxout{\string\gdef\string\TotalProblemCount{\arabic{probcount}}}
}
\makeatother

\newcommand{\makeproblemtable}{%
  \begin{figure}[b!]
    \begin{center}
        {\heiti 试题列表}
        \vspace{0.5em}

        {\small
        \begin{tabular}{|p{1cm}<{\centering}|p{6cm}<{\centering}|}
            \hline
            \probtablecontent
            \hline
        \end{tabular}}
        \vspace{2em}

        {\footnotesize 本试题册共 \ifdefined\TotalProblemCount \TotalProblemCount \else ? \fi \ 题，\pageref{LastPage} 页。}

        {\footnotesize 如果您的试题册缺少页面，请立即通知志愿者。}
    \end{center}
  \end{figure}
}

\title{\vspace{4cm} \heiti ${contest.name!} \\ 试题册}
\author{\kaishu 出题人}
\date{${contest.date!}}


\begin {document}

\maketitle
\thispagestyle{empty}
\setcounter{page}{0}

\makeproblemtable

\clearpage

\contest
{${contest.name!}}%
{${contest.location!}}%
{${contest.date!}}%

<#list statements as statement>
<#if statement.path??>
\graphicspath{{${statement.path}}}
<#if statement.index??>
  \def\ProblemIndex{${statement.index}}
</#if>
\import{${statement.path}}{./${statement.file}}
<#else>
\input ${statement.file}
</#if>
</#list>

\end {document}
