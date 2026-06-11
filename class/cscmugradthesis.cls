\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugradthesis}[2026/06/10 Graduate Thesis and Proposal Class]

% Default options
\LoadClass[12pt,a4paper]{report}

% Margins & Geometry
\RequirePackage{geometry}
\geometry{
  a4paper,
  left=25mm,
  right=25mm,
  top=25mm,
  bottom=25mm
}

% Spacing
\RequirePackage{setspace}
\singlespacing % Default single spacing for Thai

% Indentation
\setlength{\parindent}{1.0cm} % Default paragraph indent
\RequirePackage{array}

% Bilingual Support (Thai and English)
% Requires compiling with XeLaTeX or LuaLaTeX
\RequirePackage[thaifont = TH Sarabun New, thaicaption=false]{thaispec}

% English is the default language — Times New Roman applies to all untagged text
% (section headings, body paragraphs, etc.).
% Thai content must be explicitly wrapped in {\thaifont ...} or \begin{otherlanguage}{thai}.
\setdefaultlanguage{english}
\setotherlanguage{thai}



% Line spacing hooks for language switches
\addto\captionsenglish{\setstretch{1.05}}
\addto\captionsthai{\setstretch{1.0}}

% Enable XeTeX Thai line-breaking (required for Thai text to wrap in p{} columns)
\XeTeXlinebreaklocale "th_TH"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0pt
\XeTeXlinebreakpenalty = 10

% Font declarations
% Note: TH SarabunPSK does not carry Script=Thai OpenType metadata, so we load
% it without that tag. XeTeX handles Thai line-breaking via its built-in engine.
%
% Polyglossia uses \thaifont when Thai is active, \englishfont when English is active.
% \setmainfont sets the base/fallback font — use Times New Roman so any untagged
% text and English environments both render in Times New Roman.
\setmainfont{Times New Roman}[
  BoldFont={Times New Roman Bold},
  ItalicFont={Times New Roman Italic},
  BoldItalicFont={Times New Roman Bold Italic}
]

% Thai font — activated automatically by polyglossia for Thai-language environments


% English font — activated automatically by polyglossia for English-language environments
\newfontfamily\englishfont{Times New Roman}[
  BoldFont={Times New Roman Bold},
  ItalicFont={Times New Roman Italic},
  BoldItalicFont={Times New Roman Bold Italic}
]

% Page numbering and styles
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\cfoot{\thepage} % Page number bottom center
\renewcommand{\headrulewidth}{0pt} % No line at header

% Redefine plain style for chapter pages (bottom-center)
\fancypagestyle{plain}{
  \fancyhf{}
  \cfoot{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% Heading Styles — explicitly use \englishfont (Times New Roman) for all headings
% so they are always in Times New Roman regardless of the active language environment.
\RequirePackage{titlesec}

\titleformat{\chapter}[display]
  {\englishfont\bfseries\huge\centering}
  {\chaptertitlename\ \thechapter}
  {20pt}
  {\huge}

\titleformat{\section}
  {\englishfont\large\bfseries}
  {\thesection.\quad}
  {-5pt}
  {}
\titlespacing*{\section}
  {0pt}
  {2.0ex plus 0.5ex minus 0.2ex}
  {1.0ex plus 0.2ex}

\titleformat{\subsection}
  {\englishfont\normalsize\bfseries}
  {\thesubsection.\quad}
  {-5pt}
  {}
\titlespacing*{\subsection}
  {0pt}
  {1.5ex plus 0.3ex minus 0.2ex}
  {0.8ex plus 0.2ex}


% Class variables for Title Page
% Thai-language fields bake in {\thaifont ...} so they render correctly even
% when called inside an English-language environment.
\newcommand{\thetitleth}{}
\newcommand{\titleth}[1]{\renewcommand{\thetitleth}{{\thaifont #1}}}
\newcommand{\thetitleen}{}
\newcommand{\titleen}[1]{\renewcommand{\thetitleen}{#1}}

\newcommand{\theauthorth}{}
\newcommand{\authorth}[1]{\renewcommand{\theauthorth}{{\thaifont #1}}}
\newcommand{\theauthoren}{}
\newcommand{\authoren}[1]{\renewcommand{\theauthoren}{#1}}
\newcommand{\thestudentcode}{}
\newcommand{\studentcode}[1]{\renewcommand{\thestudentcode}{#1}}

\newcommand{\theadvisor}{}
\newcommand{\advisor}[1]{\renewcommand{\theadvisor}{#1}}
\newcommand{\thecoadvisor}{}
\newcommand{\coadvisor}[1]{\renewcommand{\thecoadvisor}{#1}}

\newcommand{\thedegree}{}
\newcommand{\degree}[1]{\renewcommand{\thedegree}{#1}}
\newcommand{\theprogram}{}
\newcommand{\program}[1]{\renewcommand{\theprogram}{#1}}
\newcommand{\thefaculty}{}
\newcommand{\faculty}[1]{\renewcommand{\thefaculty}{#1}}
\newcommand{\theuniversity}{}
\newcommand{\university}[1]{\renewcommand{\theuniversity}{#1}}
\newcommand{\theacademicyear}{}
\newcommand{\academicyear}[1]{\renewcommand{\theacademicyear}{#1}}
