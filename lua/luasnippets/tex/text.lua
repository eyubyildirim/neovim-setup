-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local function get_date()
  return os.date '%Y-%m-%d' -- Or os.date('%d %B %Y') for "24 May 2023"
end

return {
  -- User's original custom title snippet
  s(
    'mytitlepage', -- Renamed to be more specific, user's custom title page
    fmta(
      [[
\title{
\includegraphics[width=4in]{./logo.jpg} \\
\vspace*{1in}
\textbf{<>}}
\author{Eyüb Yıldırım - 040190623} 
\date{\today}
%--------------------Make usable space all of page
\setlength{\oddsidemargin}{0in} \setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}     \setlength{\headsep}{-.25in}
\setlength{\textwidth}{6.5in}   \setlength{\textheight}{8.5in}
%--------------------Indention
\setlength{\parindent}{1cm}

\begin{document}
\makeatletter
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
	\hskip -\arraycolsep
	\let\@ifnextchar\new@ifnextchar
	\array{#1}}
\makeatother
\maketitle
\tableofcontents
      ]],
      i(1, 'Report Title')
    )
  ),

  -- User's original 'se' snippet
  s('se', {
    t '&=',
  }),

  -- Basic Article (enhanced from user's 'doc')
  s(
    'article', -- Changed trigger from 'doc' to 'article' for clarity
    fmta(
      [[
\documentclass[11pt, a4paper]{article}

%% Language and Font Encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel} % Or your preferred language

%% Math Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}

%% Graphics and Colors
\usepackage{graphicx}
\usepackage{xcolor} % For colors

%% Hyperlinks
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
    pdftitle={Overleaf Example},
    pdfpagemode=FullScreen,
}

%% Page Layout (optional, geometry is powerful)
% \usepackage{geometry}
% \geometry{a4paper, margin=1in}

\title{<>}
\author{<>}
\date{<>}

\begin{document}

\maketitle

% \begin{abstract}
% <>
% \end{abstract}

% \tableofcontents % Optional for longer articles
% \newpage

\section{<>}
<>

\end{document}
]],
      {
        i(1, 'Document Title'),
        i(2, 'Your Name'),
        f(get_date, {}),
        i(3, 'Abstract Text (uncomment if needed)'),
        i(4, 'Introduction'),
        i(0, 'Start writing here...'),
      }
    )
  ),

  -- Report Class
  s(
    'report',
    fmta(
      [[
\documentclass[11pt, a4paper]{report}

%% Language and Font Encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

%% Math Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}

%% Graphics and Colors
\usepackage{graphicx}
\usepackage{xcolor}

%% Hyperlinks
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}

%% Other useful packages
% \usepackage{listings} % For code listings
% \usepackage{booktabs} % For better tables
% \usepackage{siunitx}  % For SI units

\title{<>}
\author{<>}
\date{<>}

\begin{document}

\maketitle
\tableofcontents
\newpage

\chapter{<>}
\section{<>}
<>

\end{document}
]],
      {
        i(1, 'Report Title'),
        i(2, 'Author Name'),
        f(get_date, {}),
        i(3, 'First Chapter Title'),
        i(4, 'First Section Title'),
        i(0, 'Content of the first section...'),
      }
    )
  ),

  -- Book Class
  s(
    'book',
    fmta(
      [[
\documentclass[11pt, a4paper, twoside]{book} % twoside is common for books

%% Language and Font Encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

%% Math Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}

%% Graphics and Colors
\usepackage{graphicx}
\usepackage{xcolor}

%% Hyperlinks
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}

%% Other useful packages
% \usepackage{fancyhdr} % For custom headers/footers
% \usepackage{lipsum}   % For dummy text

\title{<>}
\author{<>}
\date{<>}

\begin{document}

\frontmatter % For title page, toc, preface, etc.
\maketitle
\tableofcontents
% \chapter{Preface} % Optional
% <>

\mainmatter % Main content starts here
\chapter{<>}
\section{<>}
<>

% \backmatter % For appendix, bibliography, index
% \appendix
% \chapter{Additional Data}
% <>

\end{document}
]],
      {
        i(1, 'Book Title'),
        i(2, 'Author Name'),
        f(get_date, {}),
        i(3, 'Preface content (uncomment if needed)'),
        i(4, 'First Chapter Title'),
        i(5, 'First Section Title'),
        i(0, 'Content...'),
        i(6, 'Appendix Content (uncomment if needed)'),
      }
    )
  ),

  -- Beamer Presentation Class
  s(
    'beamer',
    fmta(
      [[
\documentclass[aspectratio=169]{beamer} % aspectratio=169 for widescreen

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}
\usepackage{xcolor} % For custom colors

%% Beamer Theme
\usetheme{<>} % e.g., Madrid, Warsaw, Singapore, Boadilla
\usecolortheme{default} % or dolphin, whale, beaver

\title[Short Title]{<>}
\author{<>}
\institute{<>}
\date{<>}

\begin{document}

\frame{\titlepage}

\begin{frame}
    \frametitle{Table of Contents}
    \tableofcontents
\end{frame}

\section{<>}
\begin{frame}
    \frametitle{<>}
    <>
\end{frame}

\end{document}
]],
      {
        i(1, 'Madrid'),
        i(2, 'Presentation Title'),
        i(3, 'Author Name'),
        i(4, 'Your Institution'),
        f(get_date, {}),
        i(5, 'Introduction Section'),
        i(6, 'First Slide Title'),
        i(0, 'Content of the first slide...'),
      }
    )
  ),

  -- Letter Class
  s(
    'letter',
    fmta(
      [[
\documentclass[11pt, a4paper]{letter}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}

% Optional: For a more modern look
% \usepackage{marvosym} % For symbols like \Letter, \Mobilefone
% \usepackage{lmodern} % Latin Modern fonts

\signature{<>}
\address{<> \\ <> \\ <>} % Your address, new line for each part
\date{<>}

\begin{document}

\begin{letter}{%
<> \\ % Recipient Name
<> \\ % Recipient Address Line 1
<> % Recipient Address Line 2 (City, Postal Code)
}

\opening{Dear <>,}

<>

\closing{Sincerely,}

% \ps{P.S. <>} % Postscript (optional)
% \encl{<>} % Enclosures (optional)

\end{letter}

\end{document}
]],
      {
        i(1, 'Your Name (for signature)'),
        i(2, 'Your Street Address'),
        i(3, 'Your City, Postal Code'),
        i(4, 'Your Country'),
        f(get_date, {}),
        i(5, 'Recipient Name'),
        i(6, 'Recipient Street Address'),
        i(7, 'Recipient City, Postal Code'),
        i(8, 'Mr./Ms. Lastname'),
        i(0, 'Body of the letter...'),
        i(9, 'P.S. Text (uncomment if needed)'),
        i(10, 'List of Enclosures (uncomment if needed)'),
      }
    )
  ),
}
