\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aesthetic}

% Options
\DeclareOption{twocolumn}{\OptionNotUsed}
\newif\if@partheadings
\@partheadingsfalse
\DeclareOption{partheadings}{\@partheadingstrue}
\newif\if@numberedhead
\@numberedheadfalse
\DeclareOption{numberedhead}{\@numberedheadtrue}
\newif\if@lowerhead
\@lowerheadfalse
\DeclareOption{lowerhead}{\@lowerheadtrue}
\newif\if@pagebreaks
\@pagebreaksfalse
\DeclareOption{pagebreaks}{\@pagebreakstrue} % I mean, why are you even bothering?
\newif\if@partpages
\@partpagesfalse
\DeclareOption{partpages}{\@partpagestrue}
\newif\if@otherfont
\@otherfontfalse
\DeclareOption{otherfont}{\@otherfonttrue} % Because I'm lazy, and this font is pretty, so I'm making it harder for me to not use it
\newif\if@shortnames
\@shortnamesfalse
\DeclareOption{shortnames}{\@shortnamestrue} % This option does nothing without numberedhead
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[openany,twoside,fullptlayout,extrafontsizes]{memoir}

% Packages
\if@otherfont
\else
  \RequirePackage{Alegreya}
\fi
\RequirePackage{microtype}
\RequirePackage{pifont}
\RequirePackage{array} % Since we call the new column type, we don't wnat outer dependencies
\RequirePackage{atbegshi}

% Page Set-Up / Headings
\if@partheadings
  \if@numberedhead
    \makepsmarks{ruled}{%
        \if@lowerhead
          \nouppercaseheads
        \else
        \fi
        \clearmark{section}
        \if@shortnames
          \createmark{part}{left}{shownumber}{}{ \ }
          \createmark{chapter}{right}{shownumber}{}{ \ }
        \else
          \createmark{part}{left}{shownumber}{\partname\ }{ \ }
          \createmark{chapter}{right}{shownumber}{\@chapapp\ }{ \ }
        \fi
        \createplainmark{toc}{both}{\contentsname}
        \createplainmark{lof}{both}{\listfigurename}
        \createplainmark{lot}{both}{\listtablename}
        \createplainmark{bib}{both}{\bibname}
        \createplainmark{index}{both}{\indexname}
        \createplainmark{glossary}{both}{\glossaryname}
    }
  \else
    \makepsmarks{ruled}{%
        \if@lowerhead
          \nouppercaseheads
        \else
        \fi
        \clearmark{section}
        \createmark{part}{left}{nonumber}{\partname\ }{ \ }
        \createmark{chapter}{right}{nonumber}{\@chapapp\ }{ \ }
        \createplainmark{toc}{both}{\contentsname}
        \createplainmark{lof}{both}{\listfigurename}
        \createplainmark{lot}{both}{\listtablename}
        \createplainmark{bib}{both}{\bibname}
        \createplainmark{index}{both}{\indexname}
        \createplainmark{glossary}{both}{\glossaryname}
    }
  \fi
\else
  \if@numberedhead
    \makepsmarks{ruled}{%
        \if@lowerhead
          \nouppercaseheads
        \else
        \fi
        \clearmark{section}
        \if@shortnames
          \createmark{chapter}{left}{shownumber}{ \ }{ \ }
        \else
          \createmark{chapter}{left}{shownumber}{\@chapapp\ }{ \ }
        \fi
        \createmark{section}{right}{shownumber}{}{ \ }
        \createplainmark{toc}{both}{\contentsname}
        \createplainmark{lof}{both}{\listfigurename}
        \createplainmark{lot}{both}{\listtablename}
        \createplainmark{bib}{both}{\bibname}
        \createplainmark{index}{both}{\indexname}
        \createplainmark{glossary}{both}{\glossaryname}
    }
  \else
    \makepsmarks{ruled}{%
        \if@lowerhead
          \nouppercaseheads
        \else
        \fi
        \clearmark{section}
        \createmark{chapter}{left}{nonumber}{\@chapapp\ }{ \ }
        \createmark{section}{right}{nonumber}{}{ \ }
        \createplainmark{toc}{both}{\contentsname}
        \createplainmark{lof}{both}{\listfigurename}
        \createplainmark{lot}{both}{\listtablename}
        \createplainmark{bib}{both}{\bibname}
        \createplainmark{index}{both}{\indexname}
        \createplainmark{glossary}{both}{\glossaryname}
    }
  \fi
\fi

\pagestyle{ruled}
\headstyles{dowding}

\renewcommand{\parttitlefont}{\chaptitlefont}
\renewcommand{\partnamefont}{\chapnamefont}
\renewcommand{\partnumfont}{\chapnumfont}
\renewcommand{\printpartnum}{\NumToName{\value{part}}}

\if@pagebreaks
    \if@partpages
    \renewcommand{\beforepartskip}{\null\vfil{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}\pfbreak}
    \renewcommand{\afterpartskip}{\pfbreak{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}\newpage}
  \else
  \fi
\else
  \renewcommand{\clearforchapter}{{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \pfbreak}}

  \if@partpages
    \renewcommand{\beforepartskip}{\null\vfil{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}\pfbreak}
    \renewcommand{\afterpartskip}{\pfbreak{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}\newpage}
  \else
    \renewcommand{\beforepartskip}{\pfbreak \hrulefill \pfbreak}
    \renewcommand{\afterpartskip}{\pfbreak{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}}
  \fi
\fi


% Other typesetting things
\setlength{\tabcolsep}{0pt}

% Numbering
\counterwithout*{footnote}{chapter}

% New commands, type object
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

% Start up macro
\newcommand{\contents}{
  \part{Contents}
  \renewcommand*{\contentsname}{Short contents}
  \setcounter{tocdepth}{0}
  \tableofcontents

  \renewcommand*{\contentsname}{Full contents}
  \setcounter{tocdepth}{5}
  \tableofcontents

  \renewcommand*{\listfigurename}{Figures}
  \setcounter{lofdepth}{5}
  \listoffigures

  \renewcommand*{\listtablename}{Tables}
  \setcounter{lotdepth}{5}
  \listoftables
}

% Appendix macro
\newcommand{\makeappendix}{
  \addcontentsline{toc}{part}{Appendices}
  \part*{Appendices}
  \appendix}

% Back matter set up
\newcommand{\makebackmatter}[1][]{
\makeatletter
\AtBeginShipoutNext{%
\global\@mainmatterfalse}
\makeatother

#1

\pfbreak
\pfbreak
{\renewcommand{\pfbreakdisplay}{\ding{167}\quad\ding{167}\quad\ding{167}} \fancybreak{\pfbreakdisplay}}
}
