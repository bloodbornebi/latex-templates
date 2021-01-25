\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}

\RequirePackage{xparse}

% Options
%% Options not used
\DeclareOption{partheadings}{\OptionNotUsed}
\DeclareOption{lowerhead}{\OptionNotUsed}

%% General options
%%% Coloring/themes
\newif\if@dark
\@darkfalse
\DeclareOption{dark}{\@darktrue}

\newif\if@printable
\@printablefalse
\newcommand{\textsize}{14pt}
\DeclareOption{printable}{\@printabletrue\renewcommand{\textsize}{10pt}}

\newif\if@ashes
\@ashesfalse
\DeclareOption{ashes}{\@ashestrue}

\newif\if@espresso
\@espressofalse
\DeclareOption{espresso}{\@espressotrue}

\newif\if@nord
\@nordfalse
\DeclareOption{nord}{\@nordtrue}

\newif\if@solarized
\@solarizedfalse
\DeclareOption{solarized}{\@solarizedtrue}

\newif\if@tomorrow
\@tomorrowfalse
\DeclareOption{tomorrow}{\@tomorrowtrue}

%% Subject options
\newif\if@anth
\@anthfalse
\DeclareOption{anth}{\@anthtrue}

\newif\if@chem
\@chemfalse
\DeclareOption{chem}{\@chemtrue}

\newif\if@cse
\@csefalse
\DeclareOption{cse}{\@csetrue}

\newif\if@ling
\@lingfalse
\DeclareOption{ling}{\@lingtrue}

\newif\if@math
\@mathfalse
\DeclareOption{math}{\@mathtrue}

%% Processing options/loading class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{aesthetic}}
\ProcessOptions\relax
\LoadClass[lowerhead,\textsize]{aesthetic}

% Loading packages
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{tikz}

\if@anth
  \RequirePackage{biocon}
\fi

\if@chem
  \RequirePackage{chemfig}
  \RequirePackage[version=4]{mhchem}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
  \RequirePackage{amsthm}
  \RequirePackage{thmtools}
\fi

\if@cse % Loading cse option loads minted which requires minted to be properly configured.
  \RequirePackage[chapter]{minted}
  \usemintedstyle{bw}
  \if@printable
    \usemintedstyle{bw}
  \else
    \if@ashes
      \if@dark
        \usemintedstyle{native}
      \else
        \usemintedstyle{colorful}
      \fi
    \fi

    \if@espresso
      \usemintedstyle{nord}
    \fi

    \if@nord
      \usemintedstyle{nord}
    \fi

    \if@solarized
      \if@dark
        \usemintedstyle{solarized-dark}
      \else
        \usemintedstyle{solarized-light}
      \fi
    \fi

    \if@tomorrow
      \if@dark
        \usemintedstyle{tomorrow-night}
      \else
        \usemintedstyle{tomorrow}
      \fi
    \fi
  \fi
\fi

\if@math
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
  \RequirePackage{amsthm}
  \RequirePackage{thmtools}
  \RequirePackage{physics}
  \RequirePackage{jkmath}
\fi

\if@ling
  \RequirePackage{tipa}
  \RequirePackage{tipx}
  \RequirePackage{gb4e}
  \noautomath
  \usetikzlibrary{trees}
  \RequirePackage{forest}
\fi

\RequirePackage{hyperref}
\RequirePackage{varioref}
\RequirePackage{cleveref}

% Formatting, etc
%% General purpose
%%% Numbering, etc.
\setsecnumdepth{subparagraph}
\maxsecnumdepth{subparagraph}

%%% Colors
%%%% Convience macros
\newcommand{\@backgroundcolor}[1]{\definecolor{backgroundcolor}{named}{#1}}
\newcommand{\@accentcolor}[1]{\definecolor{accentcolor}{named}{#1}}
\newcommand{\@colorfour}[1]{\definecolor{color4}{named}{#1}}
\newcommand{\@colortwo}[1]{\definecolor{secondaryaccentcolor}{named}{#1}}
\newcommand{\@colorthree}[1]{\definecolor{tertiaryaccentcolor}{named}{#1}}

%%%% Color definitions
\definecolor{textcolor}{named}{black}
\definecolor{pagecolor}{named}{white}
\definecolor{backgroundcolor}{named}{white}

\definecolor{accentcolor}{named}{white}
\definecolor{accenttextcolor}{named}{black}
\definecolor{subtletextcolor}{named}{black}

\definecolor{secondaryaccentcolor}{named}{black}
\definecolor{secondaryaccenttextcolor}{named}{black}

\definecolor{tertiaryaccentcolor}{named}{black}

\if@dark
  \if@printable
  \else
    \definecolor{textcolor}{named}{white}
    \definecolor{pagecolor}{named}{black}
    \definecolor{backgroundcolor}{named}{black}

    \definecolor{accentcolor}{named}{black}
    \definecolor{accenttextcolor}{named}{white}
    \definecolor{subtletextcolor}{named}{white}

    \definecolor{secondaryaccentcolor}{named}{black}
    \definecolor{secondaryaccenttextcolor}{named}{white}

    \definecolor{color4}{named}{black}
  \fi
\fi

\if@ashes
  \definecolor{@dark}{HTML}{1c1e23}
  \definecolor{@light}{HTML}{f3f3f5}
  \definecolor{@mid}{HTML}{747a84}

  \definecolor{@a0}{HTML}{c7ac95}
  \definecolor{@a1}{HTML}{ac95c7}
  \definecolor{@a2}{HTML}{c795ac}

  \definecolor{@b0}{HTML}{95c7ac}
  \definecolor{@b1}{HTML}{acc795}
  \definecolor{@b2}{HTML}{95acc7}

  \definecolor{subtletextcolor}{named}{@mid}

  \definecolor{accentcolor}{named}{@a2}
  \definecolor{accenttextcolor}{named}{@light}
  \definecolor{secondaryaccentcolor}{named}{@b2}
  \definecolor{secondaryaccenttextcolor}{named}{@dark}
  \definecolor{tertiaryaccentcolor}{named}{@a0}
  \definecolor{color4}{named}{@b1}

  \if@dark
    \if@printable
      \definecolor{textcolor}{named}{@dark}
    \else
      \definecolor{textcolor}{named}{@light}
      \definecolor{pagecolor}{named}{@dark}
      \definecolor{backgroundcolor}{named}{@dark}
    \fi
  \else
    \definecolor{textcolor}{named}{@dark}
    \definecolor{backgroundcolor}{named}{@light}

    \if@printable
    \else
      \definecolor{pagecolor}{named}{@light}
    \fi
  \fi
\fi

\if@espresso
  \definecolor{@dark0}{HTML}{323232}
  \definecolor{@dark1}{HTML}{353535}
  \definecolor{@dark2}{HTML}{535353}

  \definecolor{@light0}{HTML}{eeeeec}
  \definecolor{@light1}{HTML}{ffffff}

  \definecolor{@a0}{HTML}{d25252}
  \definecolor{@a1}{HTML}{a5c261}
  \definecolor{@a2}{HTML}{ffc66d}
  \definecolor{@a3}{HTML}{f00c0c}
  \definecolor{@a4}{HTML}{c2e075}
  \definecolor{@a5}{HTML}{e1e48b}

  \definecolor{@b0}{HTML}{6c99bb}
  \definecolor{@b1}{HTML}{d197d9}
  \definecolor{@b2}{HTML}{bed6ff}
  \definecolor{@b3}{HTML}{8ab7d9}
  \definecolor{@b4}{HTML}{efb5f7}
  \definecolor{@b5}{HTML}{dcf4ff}

  \if@printable
    \definecolor{textcolor}{named}{@dark0}
  \else
    \if@dark
      \definecolor{textcolor}{named}{@light0}
      \definecolor{subtletextcolor}{named}{@light0}
      \definecolor{accenttextcolor}{named}{@dark0}
      \definecolor{secondaryaccenttextcolor}{named}{@dark1}
      \definecolor{pagecolor}{named}{@dark0}
      \definecolor{backgroundcolor}{named}{@dark1}
    \else
      \definecolor{textcolor}{named}{@dark0}
      \definecolor{subtletextcolor}{named}{@dark1}
      \definecolor{accenttextcolor}{named}{@light1}
      \definecolor{secondaryaccenttextcolor}{named}{@light0}
      \definecolor{pagecolor}{named}{@light1}
      \definecolor{backgroundcolor}{named}{@light0}
    \fi
  \fi

  \definecolor{accentcolor}{named}{@a0}
  \definecolor{secondaryaccentcolor}{named}{@b0}
  \definecolor{tertiaryaccentcolor}{named}{@a4}
  \@colorfour{@b1}
\fi

\if@nord
  \definecolor{@dark0}{HTML}{2E3440}
  \definecolor{@dark1}{HTML}{3B4252}
  \definecolor{@dark2}{HTML}{434C5E}
  \definecolor{@dark3}{HTML}{4C566A}

  \definecolor{@light0}{HTML}{D8DEE9}
  \definecolor{@light1}{HTML}{E5E9F0}
  \definecolor{@light2}{HTML}{ECEFF4}

  \definecolor{@a0}{HTML}{8FBCBB}
  \definecolor{@a1}{HTML}{88C0D0}
  \definecolor{@a2}{HTML}{81A1C1}
  \definecolor{@a3}{HTML}{5E81AC}

  \definecolor{@b0}{HTML}{BF616A}
  \definecolor{@b1}{HTML}{D08770}
  \definecolor{@b2}{HTML}{EBCB8B}
  \definecolor{@b3}{HTML}{A3BE8C}
  \definecolor{@b4}{HTML}{B48EAD}

  \if@dark
    \if@printable
      \definecolor{backgroundcolor}{named}{@light1}
      \definecolor{textcolor}{named}{@dark0}
      \definecolor{subtletextcolor}{named}{@dark1}
    \else
      \definecolor{textcolor}{named}{@light1}
      \definecolor{pagecolor}{named}{@dark0}
      \definecolor{backgroundcolor}{named}{@dark1}
    \fi
  \else
    \if@printable
    \else
      \definecolor{pagecolor}{named}{@light2}
    \fi

    \definecolor{textcolor}{named}{@dark0}
    \definecolor{subtletextcolor}{named}{@dark1}
    \definecolor{backgroundcolor}{named}{@light1}
  \fi

  \definecolor{accentcolor}{named}{@a2}
  \definecolor{accenttextcolor}{named}{@light2}

  \definecolor{secondaryaccentcolor}{named}{@b3}
  \definecolor{secondaryaccenttextcolor}{named}{@light1}

  \definecolor{tertiaryaccentcolor}{named}{@b4}

  \@colorfour{@a0}
\fi

\if@solarized
  \definecolor{@dark0}{HTML}{002b36}
  \definecolor{@dark1}{HTML}{073642}
  \definecolor{@dark2}{HTML}{586e75}
  \definecolor{@dark3}{HTML}{657b83}

  \definecolor{@light0}{HTML}{839496}
  \definecolor{@light1}{HTML}{93a1a1}
  \definecolor{@light2}{HTML}{eee8d5}
  \definecolor{@light3}{HTML}{fdf6e3}

  \definecolor{@a0}{HTML}{b58900}
  \definecolor{@a1}{HTML}{cb4b16}
  \definecolor{@a2}{HTML}{dc322f}
  \definecolor{@a3}{HTML}{d33682}

  \definecolor{@b0}{HTML}{6c71c4}
  \definecolor{@b1}{HTML}{268bd2}
  \definecolor{@b2}{HTML}{2aa198}
  \definecolor{@b3}{HTML}{859900}

  \definecolor{accentcolor}{named}{@a0}
  \definecolor{secondaryaccentcolor}{named}{@b1}
  \definecolor{tertiaryaccentcolor}{named}{@a2}
  \definecolor{color4}{named}{@b2}

  \if@dark
    \if@printable
      \definecolor{textcolor}{named}{@dark0}
      \definecolor{backgroundcolor}{named}{@light3}

      \definecolor{accenttextcolor}{named}{@light3}
      \definecolor{subtletextcolor}{named}{@dark1}

      \definecolor{secondaryaccenttextcolor}{named}{@light2}
    \else
      \definecolor{textcolor}{named}{@light3}
      \definecolor{pagecolor}{named}{@dark0}
      \definecolor{backgroundcolor}{named}{@dark1}

      \definecolor{accenttextcolor}{named}{@dark0}
      \definecolor{subtletextcolor}{named}{@light2}

      \definecolor{secondaryaccenttextcolor}{named}{@dark1}
    \fi
  \else
    \if@printable
    \else
      \definecolor{pagecolor}{named}{@light3}
    \fi

    \definecolor{textcolor}{named}{@dark0}
    \definecolor{backgroundcolor}{named}{@light2}

    \definecolor{accenttextcolor}{named}{@light3}
    \definecolor{subtletextcolor}{named}{@dark1}

    \definecolor{secondaryaccenttextcolor}{named}{@light2}
  \fi
\fi

\if@tomorrow
  \definecolor{@dark0}{HTML}{1d1f21}
  \definecolor{@dark1}{HTML}{282a2e}
  \definecolor{@dark2}{HTML}{373b41}
  \definecolor{@dark3}{HTML}{969896}

  \definecolor{@light0}{HTML}{b4b7b4}
  \definecolor{@light1}{HTML}{c5c8c6}
  \definecolor{@light2}{HTML}{e0e0e0}
  \definecolor{@light3}{HTML}{ffffff}

  \definecolor{@a0}{HTML}{cc6666}
  \definecolor{@a1}{HTML}{de935f}
  \definecolor{@a2}{HTML}{f0c674}
  \definecolor{@a3}{HTML}{b5bd68}

  \definecolor{@b0}{HTML}{8abeb7}
  \definecolor{@b1}{HTML}{81a2be}
  \definecolor{@b2}{HTML}{b294bb}
  \definecolor{@b3}{HTML}{a3685a}

  \if@dark
    \definecolor{textcolor}{named}{@light3}
    \definecolor{pagecolor}{named}{@dark0}
    \@backgroundcolor{@dark1}
  \else
    \definecolor{textcolor}{named}{@dark0}
    \definecolor{pagecolor}{named}{@light3}
  \fi

  \@accentcolor{@a0}
  \@colortwo{@b0}
  \@colorthree{@a2}
  \@colorfour{@b2}
\fi

\color{textcolor}
\pagecolor{pagecolor}

\if@printable
  \hypersetup{linkbordercolor={accentcolor},citebordercolor={secondaryaccentcolor},filebordercolor={tertiaryaccentcolor},menubordercolor={accentcolor},runbordercolor={tertiaryaccentcolor},urlbordercolor={color4}}
\else
  \hypersetup{colorlinks=true,linkcolor={accentcolor},citecolor={secondaryaccentcolor},filecolor={tertiaryaccentcolor},menucolor={accentcolor},runcolor={tertiaryaccentcolor},urlcolor={color4}}
\fi

\tcbuselibrary{breakable,skins}

\tcbsetforeverylayer{colbacktitle=accentcolor,colframe=accentcolor,coltext=textcolor,floatplacement=tbp}

\if@printable
  \tcbsetforeverylayer{colback=pagecolor}
\else
  \tcbsetforeverylayer{colback=backgroundcolor}
\fi

\tcbset{flashcard/.style={title={\captionof*{flashcard}{#1}} ,float,breakable,toprule at break=0mm,bottomrule at break=0mm,pad at break=0mm} }
\tcbset{vocab/.style={flashcard,title=\captionof{flashcard}{#1},float,colframe=secondaryaccentcolor,colbacktitle=secondaryaccentcolor},fontlower=\sffamily}
\tcbset{generic/.style={flashcard,title=#1,colframe=tertiaryaccentcolor,colbacktitle=tertiaryaccentcolor}}
\tcbset{task/.style={flashcard,title=\captionof*{flashcard}{#1},colframe=color4,colbacktitle=color4}}

\if@math
  \tcbset{boxtap/.style={fonttitle=\large\bfseries}}
  \tcbset{theorem/.style={boxtap,colframe=secondaryaccentcolor,colbacktitle=secondaryaccentcolor}}
  \tcbset{axiom/.style={boxtap,colframe=tertiaryaccentcolor,colbacktitle=tertiaryaccentcolor}}
  \tcbset{definition/.style={boxtap,colframe=color4,colbacktitle=color4}}
\fi

% Macros
%% General purposes macros
\newfloat{flashcard}{tbp}{loc}
\captionsetup[flashcard]{format=plain,skip=0pt,name=,labelformat=parens,labelsep=quad,justification=justified,singlelinecheck=false,font={color=accenttextcolor,large,bf}}
\crefname{flashcard}{card}{cards}
\Crefname{flashcard}{Card}{Cards}
\creflabelformat{flashcard}{#2(#1)#3}
\crefrangelabelformat{flashcard}{#3(#1)#4 to #5(#2)#6}

\newenvironment{vocab}[1]{\begin{tcolorbox}[vocab={#1}]}{\end{tcolorbox}}
\newenvironment{vocab*}[1]{\begin{tcolorbox}[vocab={#1},nofloat]}{\end{tcolorbox}}
\newenvironment{card}[2][]{\begin{tcolorbox}[flashcard={#2},#1]}{\end{tcolorbox}}
\newenvironment{hw}[1][]{\begin{tcolorbox}[task={#1}]}{\end{tcolorbox}}

\newcommand{\startgen}[1][]{\frontmatter\maketitle\thispagestyle{empty}\contents #1 \mainmatter}

%% Subject specific macros
\if@chem
  \tcbset{mech/.style={title={\captionof{mechanism}{#1}},colframe=secondaryaccentcolor,colbacktitle=secondaryaccentcolor}}

  \newfloat{mechanism}{tbp}{lom}[chapter]
  \floatname{mechanism}{Mechanism}
  \captionsetup[mechanism]{format=plain,skip=0pt,font={color=secondaryaccenttextcolor,bf,large}}

  \newenvironment{mech}[1]{\begin{tcolorbox}[mech={#1}]}{\end{tcolorbox}}

  \newcommand{\start}[1][]{\startgen[\addcontentsline{toc}{chapter}{List of mechanisms}\listof{mechanism}{Reaction mechanisms} #1]}
\fi

\if@cse
  \tcbset{listing/.style={colframe=secondaryaccentcolor}}

  \if@printable
  \else
    \if@dark
    \else
      \if@nord
        \tcbset{listing/.append style={colback=subtletextcolor}}
      \fi
      \if@espresso
        \tcbset{listing/.append style={colback=subtletextcolor}}
      \fi
    \fi
  \fi

  \newenvironment{code}[1]{\begin{listing} \caption{#1}\begin{tcolorbox}[nofloat,listing]}{\end{tcolorbox}\end{listing}}

  \newcommand{\start}[1][]{\startgen[\addcontentsline{toc}{chapter}{Listings}\listof{listing}{Listings} \addcontentsline{toc}{chapter}{Flashcards}\listof{flashcard}{Flashcards} #1]}
\fi

\if@math
  \declaretheoremstyle[headformat=,headpunct=,postheadspace=0pt]{boxedtheorem}
  \declaretheorem[style=boxedtheorem]{theorem}
  \declaretheorem[style=boxedtheorem]{axiom}
  \declaretheorem[style=boxedtheorem,numbered]{definition}

  \NewDocumentEnvironment{ boxtap }{ m m +b }{ \begin{tcolorbox}[#1,title={#2}] #3 \end{tcolorbox} }{}

  \NewDocumentEnvironment{ boxthm }{ m m +b }{ \begin{boxtap}{theorem}{\Cref{#2} (\nameref{#2})}\begin{theorem}[name={#1},label=#2] #3 \end{theorem}\end{boxtap} }{}

  \NewDocumentEnvironment{ boxaxm }{ m m +b }{ \begin{boxtap}{axiom}{\Cref{#2} (\nameref{#2})}\begin{axiom}[name={#1},label=#2] #3 \end{axiom}\end{boxtap} }{}

  \NewDocumentEnvironment{ boxdef }{ m m +b }{ \begin{boxtap}{definition}{\Cref{#2} (\nameref{#2})}\begin{definition}[name={#1},label=#2] #3 \end{definition}\end{boxtap} }{}
\fi

\if@ling
  \NewDocumentEnvironment { tree } { m +b } { \begin{figure} \centerfloat \begin{forest} #2 \end{forest} \caption{#1} \end{figure} } {}
  \newcommand{\start}[1][]{\startgen[\addcontentsline{toc}{chapter}{Flashcards}\listof{flashcard}{Flashcards} #1]}
  \newenvironment{example}[1][]{\begin{tcolorbox}[generic=\captionof*{flashcard}{#1}]\begin{exe}}{\end{exe}\end{tcolorbox}}
  \newenvironment{example*}[1][]{\begin{tcolorbox}[generic=\captionof*{flashcard}{#1},nofloat]\begin{exe}}{\end{exe}\end{tcolorbox}}
\fi
