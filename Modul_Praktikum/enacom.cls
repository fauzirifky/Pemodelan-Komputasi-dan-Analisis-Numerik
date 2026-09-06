%ENACOM LaTeX document class.

%Updates:
%   2010/10/23 Adriano Lisboa: initial version
%   2011/08/07 Adriano Lisboa: slides document type
%   2011/08/08 Adriano Lisboa: input text encoding
%   2011/08/15 Adriano Lisboa: document types
%   2011/09/17 Adriano Lisboa: bibliography
%   2012/09/29 Adriano Lisboa: media
%   2012/12/03 Adriano Lisboa: record doc type
%   2012/12/21 Adriano Lisboa: font styles
%   2013/01/09 Adriano Lisboa: check lists
%   2013/01/25 Adriano Lisboa: support in handouts
%   2013/02/11 Adriano Lisboa: support to PDF inclusions
%   2014/09/21 Adriano Lisboa: support to XML code
%   2014/11/05 Adriano Lisboa: support to distributed HH
%   2017/12/14 Grazielle Félix: highlight Python syntax
%   2017/12/15 Grazielle Félix: add Long Table
%   2018/01/09 Grazielle Félix: add opt command
%   2018/01/16 Grazielle Félix: alter the position of headers for print one sided
%   2019/03/19 Matheus Mendonça: fix \mi and \ma declarations
%   2019/05/29 Matheus Mendonça: add pycode and background image


% operational procedure doc type

% class definition
\ProvidesClass{enacom}[2010/10/23 ENACOM LaTeX class 1.0.00]
\typeout{Copyright 2010 ENACOM - Handcrafted Technologies}
\NeedsTeXFormat{LaTeX2e}

% options
\newcommand{\enacom@option@font@size}{}
\newcommand{\enacom@option@type}{}
\newcommand{\enacom@option@language}{}
\newcommand{\enacom@option@color}{}
\newcommand{\enacom@option@verbose}{}
\newcommand{\enacom@option@copyright}{}
\newcommand{\enacom@option@update}{}
\newcommand{\enacom@option@index}{}
\newcommand{\enacom@option@backpage}{}
\newcommand{\enacom@option@enacom}{}
\newcommand{\enacom@option@summary}{}
\newcommand{\enacom@option@figlist}{}
\newcommand{\enacom@option@tablist}{}

\DeclareOption{10pt}{\renewcommand{\enacom@option@font@size}{10}}
\DeclareOption{11pt}{\renewcommand{\enacom@option@font@size}{11}}
\DeclareOption{12pt}{\renewcommand{\enacom@option@font@size}{12}}

\DeclareOption{accept}{\renewcommand{\enacom@option@type}{accept}}
\DeclareOption{article}{\renewcommand{\enacom@option@type}{article}}
\DeclareOption{assignment}{\renewcommand{\enacom@option@type}{assignment}}
\DeclareOption{book}{\renewcommand{\enacom@option@type}{book}}
\DeclareOption{handout}{\renewcommand{\enacom@option@type}{handout}}
\DeclareOption{hh}{\renewcommand{\enacom@option@type}{hh}}
\DeclareOption{letter}{\renewcommand{\enacom@option@type}{letter}}
\DeclareOption{notes}{\renewcommand{\enacom@option@type}{notes}}
\DeclareOption{op}{\renewcommand{\enacom@option@type}{op}}
\DeclareOption{poster}{\renewcommand{\enacom@option@type}{poster}}
\DeclareOption{record}{\renewcommand{\enacom@option@type}{record}}
\DeclareOption{report}{\renewcommand{\enacom@option@type}{report}}
\DeclareOption{slides}{\renewcommand{\enacom@option@type}{slides}}
\DeclareOption{thesis}{\renewcommand{\enacom@option@type}{thesis}}

\DeclareOption{english}{\renewcommand{\enacom@option@language}{english}}
\DeclareOption{portuguese}{\renewcommand{\enacom@option@language}{portuguese}}

\DeclareOption{colorful}{\renewcommand{\enacom@option@color}{colorful}}
\DeclareOption{grayscale}{\renewcommand{\enacom@option@color}{grayscale}}

\DeclareOption{lean}{\renewcommand{\enacom@option@verbose}{lean}}
\DeclareOption{full}{\renewcommand{\enacom@option@verbose}{full}}

\DeclareOption{update}{\renewcommand{\enacom@option@update}{update}}
\DeclareOption{noupdate}{\renewcommand{\enacom@option@update}{noupdate}}

\DeclareOption{copyright}{\renewcommand{\enacom@option@copyright}{copyright}}
\DeclareOption{nocopyright}{\renewcommand{\enacom@option@copyright}{nocopyright}}

\DeclareOption{index}{\renewcommand{\enacom@option@index}{index}}
\DeclareOption{noindex}{\renewcommand{\enacom@option@index}{noindex}}

\DeclareOption{backpage}{\renewcommand{\enacom@option@backpage}{backpage}}
\DeclareOption{nobackpage}{\renewcommand{\enacom@option@backpage}{nobackpage}}

\DeclareOption{summary}{\renewcommand{\enacom@option@summary}{summary}}
\DeclareOption{nosummary}{\renewcommand{\enacom@option@summary}{nosummary}}

\DeclareOption{figlist}{\renewcommand{\enacom@option@figlist}{figlist}}
\DeclareOption{nofiglist}{\renewcommand{\enacom@option@figlist}{nofiglist}}

\DeclareOption{tablist}{\renewcommand{\enacom@option@tablist}{tablist}}
\DeclareOption{notablist}{\renewcommand{\enacom@option@tablist}{notablist}}

\DeclareOption{enacom}{\renewcommand{\enacom@option@enacom}{enacom}}
\DeclareOption{noenacom}{\renewcommand{\enacom@option@enacom}{noenacom}}

\DeclareOption*{\PackageError{enacom}{Unknown option `\CurrentOption'}}

% default options
\ExecuteOptions{11pt,report,portuguese,colorful,full,copyright,summary,update,index,backpage,enacom,figlist,tablist}
\ProcessOptions\relax

% language settings
\newcommand{\enacom@language@english}{english}
\newcommand{\enacom@language@portuguese}{portuguese}

% document type settings
\newcommand{\enacom@type@accept}{accept}
\newcommand{\enacom@type@article}{article}
\newcommand{\enacom@type@assignment}{assignment}
\newcommand{\enacom@type@book}{book}
\newcommand{\enacom@type@handout}{handout}
\newcommand{\enacom@type@hh}{hh}
\newcommand{\enacom@type@letter}{letter}
\newcommand{\enacom@type@notes}{notes}
\newcommand{\enacom@type@op}{op}
\newcommand{\enacom@type@poster}{poster}
\newcommand{\enacom@type@record}{record}
\newcommand{\enacom@type@report}{report}
\newcommand{\enacom@type@slides}{slides}
\newcommand{\enacom@type@thesis}{thesis}

% color settings
\newcommand{\enacom@color@colorful}{colorful}
\newcommand{\enacom@color@grayscale}{grayscale}

% verbose settings
\newcommand{\enacom@verbose@lean}{lean}
\newcommand{\enacom@verbose@full}{full}

% copyright settings
\newcommand{\enacom@copyright@yes}{copyright}
\newcommand{\enacom@copyright@no}{nocopyright}

% update settings
\newcommand{\enacom@update@yes}{update}
\newcommand{\enacom@update@no}{noupdate}

% index settings
\newcommand{\enacom@index@yes}{index}
\newcommand{\enacom@index@no}{noindex}

% backpage settings
\newcommand{\enacom@backpage@yes}{backpage}
\newcommand{\enacom@backpage@no}{nobackpage}

% summary settings
\newcommand{\enacom@summary@yes}{summary}
\newcommand{\enacom@summary@no}{nosummary}

% list of figures settings
\newcommand{\enacom@figlist@yes}{figlist}
\newcommand{\enacom@figlist@no}{nofiglist}

% list of tables settings
\newcommand{\enacom@tablist@yes}{tablist}
\newcommand{\enacom@tablist@no}{notablist}


\newcommand{\enacom@enacom@yes}{enacom}
\newcommand{\enacom@enacom@no}{noenacom}

% base class
\ifx\enacom@option@type\enacom@type@article
	\LoadClass[a4paper,twoside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@notes
	\LoadClass[a4paper,twoside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@report
	\LoadClass[a4paper,twoside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@thesis
	\LoadClass[a4paper,twoside,onecolumn]{book}
\fi
\ifx\enacom@option@type\enacom@type@book
	\LoadClass[a4paper,twoside,onecolumn]{book}
\fi
\ifx\enacom@option@type\enacom@type@slides
	\LoadClass[xcolor=table,mathserif]{beamer}
	\usetheme{Frankfurt}
	\setbeamertemplate{caption}[numbered]
\fi
\ifx\enacom@option@type\enacom@type@letter
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@accept
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@hh
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@handout
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@record
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@assignment
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@poster
	\LoadClass[a0paper,oneside,onecolumn]{article}
\fi
\ifx\enacom@option@type\enacom@type@op
	\LoadClass[a4paper,oneside,onecolumn]{article}
\fi



% packages
\RequirePackage{verbatim}
\RequirePackage[T1]{fontenc}
\ifx\enacom@option@language\enacom@language@portuguese
	\RequirePackage[brazil]{babel}
\fi
\RequirePackage{xargs}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage{array}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else
	\RequirePackage[square]{natbib} % Harvard citation
	\RequirePackage{fancyhdr} % custom header and footer
	\RequirePackage[table]{xcolor} % color support
	\RequirePackage{titlesec} % phantom section for proper reference
	\RequirePackage{multicol} % support to multiple columns in tables

	\def\cite{\@ifnextchar[\cite@i \cite@ii}
	\def\cite@i[#1]{\citealp[#1]}
	\def\cite@ii{\citealp}	
\fi
\RequirePackage{graphicx} % image support
%\RequirePackage{media9} % media support
\RequirePackage{hyperref}
\RequirePackage{subfig}
\RequirePackage{textcomp}
\RequirePackage{makeidx}
\RequirePackage{multirow}
\RequirePackage{ragged2e} % alignment
\RequirePackage{tabularx}
\RequirePackage{longtable}
\usepackage{lscape} % landscape page support
\RequirePackage{listings}
% Python Programming Language Colors
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\lstset{ %
  backgroundcolor=\color{white},   % choose the background color
  basicstyle=\footnotesize,        % size of fonts used for the code
  breaklines=true,                 % automatic line breaking only at whitespace
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  keywordstyle=\color{blue},       % keyword style
  stringstyle=\color{mymauve},     % string literal style
}
\RequirePackage{longtable} % long tables


\RequirePackage{epstopdf}
\RequirePackage{algorithm,algorithmicx,algpseudocode} % algorithm support
\ifx\enacom@option@type\enacom@type@handout
	\RequirePackage{eso-pic}
\fi
\RequirePackage{pdfpages} % PDF subdocuments
\RequirePackage{pdfcomment} % PDF comment
\RequirePackage{xstring}

% some color definitions
\definecolor{enacom@color@white}{RGB}{255,255,255}
\definecolor{enacom@color@blue}{RGB}{191,160,68}
\definecolor{enacom@color@gray}{RGB}{55,55,55}
\definecolor{enacom@color@lightblue}{RGB}{231,218,176}
\definecolor{enacom@color@lightgray}{RGB}{202,202,202}
\definecolor{enacom@color@extralightgray}{RGB}{246,242,231}
\definecolor{enacom@mcode@commentcolor}{rgb}{0,.5,0}
\definecolor{enacom@mcode@stringcolor}{rgb}{.62,.125,.94}
\definecolor{enacom@ccode@commentcolor}{rgb}{0,.5,0}
\definecolor{enacom@ccode@stringcolor}{rgb}{.62,.125,.94}

% slides style
\ifx\enacom@option@type\enacom@type@slides
	% color
	\setbeamercolor{frametitle}{bg = enacom@color@blue, fg = enacom@color@white}
	\setbeamercolor{title}{bg = enacom@color@blue, fg = enacom@color@white}
	\setbeamercolor{section in toc}{fg = enacom@color@blue}
	\setbeamercolor{section in toc shaded}{fg = enacom@color@gray} 
	\setbeamercolor{item}{fg = enacom@color@blue}
	\setbeamercolor{subitem}{fg = enacom@color@gray}
	\setbeamercolor{subsubitem}{fg = enacom@color@lightgray}
	\setbeamercolor{description item}{fg = enacom@color@blue}
	\setbeamercolor{caption}{fg = enacom@color@blue}
	\setbeamercolor{caption name}{fg = enacom@color@blue}
	\setbeamercolor{block title}{fg = enacom@color@white, bg = enacom@color@blue!100!white}
	\setbeamercolor{block body}{bg = enacom@color@extralightgray!100!white}
	\setbeamercolor{block title alerted}{bg = enacom@color@blue!100!white}
	\setbeamercolor{block body alerted}{bg = enacom@color@extralightgray!100!white}
	\setbeamercolor{block title example}{bg = enacom@color@blue!100!white}
	\setbeamercolor{block body example}{bg = enacom@color@extralightgray!100!white}
	\setbeamercolor{normal text}{fg = black}
	\setbeamercolor{navigation symbols dimmed}{fg=enacom@color@gray!100!black}
	\setbeamercolor{navigation symbols}{fg=enacom@color@blue!100!black}
	
	\setbeamertemplate{headline}{}
	
	\setbeamertemplate{navigation symbols}{\raisebox{0.5mm}{\tiny{\thepage}\includegraphics[scale=.05]{enacomfig}}}
	\bibliographystyle{apalike}
	\providecommand{\citep}[1]{\cite{#1}}
\fi

% package settup
\renewcommand{\usepackage}{%
\PackageError{ENACOM}{For uniformity purpose, use of packages are not allowed.}}

% names
\newcommand{\enacom@empty}{~}
\ifx\enacom@option@language\enacom@language@portuguese
	\providecommand{\developedbyname}{Desenvolvido por}
	\providecommand{\enacom@op@operationalprocedure}{procedimento operacional}
	\providecommand{\enacom@op@code}{Código}
	\providecommand{\enacom@op@review}{Revisão}
	\providecommand{\enacom@op@process}{Processo}
	\providecommand{\enacom@op@page}{Página}
	\providecommand{\enacom@op@section@conditions}{Condições necessárias}
	\providecommand{\enacom@op@section@activities}{Descrição das atividades}
	\providecommand{\enacom@op@section@expectations}{Resultados esperados}
	\providecommand{\enacom@op@section@attachments}{Anexos}
	\providecommand{\enacom@op@section@changes}{Identificação das alterações}
	\providecommand{\enacom@op@author}{Elaborado por}
	\providecommand{\enacom@op@advisor}{Aprovado por}
	\providecommand{\enacom@assignment@headersection}{Pauta de reunião}
	\providecommand{\enacom@assignment@infosection}{Informações gerais}
	\providecommand{\enacom@assignment@objectivesection}{Objetivo}
	\providecommand{\enacom@assignment@issuesection}{Assuntos a tratar}
	\providecommand{\enacom@record@headersection}{Ata de reunião}
	\providecommand{\enacom@record@infosection}{Informações gerais}
	\providecommand{\enacom@record@objectivesection}{Objetivo}
	\providecommand{\enacom@record@mattersection}{Assuntos tratados}
	\providecommand{\enacom@record@actionsection}{Registro de providências}
	\providecommand{\declarationname}{Declaração}
	\providecommand{\entitiesname}{Entidades}
	\providecommand{\ofname}{de}
	\providecommand{\itemname}{Item}
	\providecommand{\itemsname}{Itens}
	\providecommand{\descname}{Descrição}
	\providecommand{\solutionname}{Solução}
	\providecommand{\timeframename}{Duração prevista}
	\providecommand{\deliveredname}{Entregue}
	\providecommand{\yname}{s}
	\providecommand{\nname}{n}
	\providecommand{\uname}{na}
	\providecommand{\subjectname}{Assunto}
	\providecommand{\supportname}{Apoio}	
	\providecommand{\commentname}{Comentário}
	\providecommand{\contextname}{Contexto}
	\providecommand{\clientname}{Cliente}
	\providecommand{\projectname}{Projeto}
	\providecommand{\productname}{Produto}
	\providecommand{\yproductname}{Produto entregue}
	\providecommand{\nproductname}{Produto não entregue}
	\providecommand{\uproductname}{Outro produto}
	\providecommand{\namename}{Nome}
	\providecommand{\authorname}{Autor}
	\providecommand{\datename}{Data}
	\providecommand{\meetingdatename}{Data da reunião}
	\providecommand{\localname}{Local}
	\providecommand{\updatename}{Atualizações}
	\providecommand{\participantname}{Participantes}
	\providecommand{\guestname}{Convidados}
	\providecommand{\responsiblename}{Responsável}
	\providecommand{\actionname}{Ação}
	\providecommand{\deadlinename}{Data prevista}
	\providecommand{\acceptname}{Aceite}
	\providecommand{\acceptname@yes}{Aceito sem restrições}
	\providecommand{\acceptname@partial}{Aceito com restrições}
	\providecommand{\acceptname@no}{Não aceito}
	\providecommand{\attname}{Atenciosamente}
	\ifx\enacom@option@type\enacom@type@accept
		\newcommand{\closingsentence}{Sendo assim, solicitamos que atestem seu acordo com a entrega de \qm{\enacom@reference} de responsabilidade da ENACOM.%
		\ifnum\value{enacom@author@count}>0
		
		\attname,\fi}
	\else
		\newcommand{\closingsentence}{\attname,}
	\fi
\else
	\providecommand{\developedbyname}{Developed by}
	\providecommand{\enacom@op@operationalprocedure}{operational procedure}
	\providecommand{\enacom@op@code}{Code}
	\providecommand{\enacom@op@review}{Review}
	\providecommand{\enacom@op@process}{Process}
	\providecommand{\enacom@op@page}{Page}
	\providecommand{\enacom@op@section@conditions}{Necessary conditions}
	\providecommand{\enacom@op@section@activities}{Activities description}
	\providecommand{\enacom@op@section@expectations}{Expected results}
	\providecommand{\enacom@op@section@attachments}{Attachments}
	\providecommand{\enacom@op@section@changes}{Identification of changes}
	\providecommand{\enacom@op@author}{Written by}
	\providecommand{\enacom@op@advisor}{Approved by}
	\providecommand{\enacom@assignment@headersection}{Assignment meeting}
	\providecommand{\enacom@assignment@infosection}{General information}
	\providecommand{\enacom@assignment@objectivesection}{Objective}
	\providecommand{\enacom@assignment@issuesection}{Issues to discuss}
	\providecommand{\enacom@record@headersection}{Meeting record}
	\providecommand{\enacom@record@infosection}{General information}
	\providecommand{\enacom@record@objectivesection}{Objective}
	\providecommand{\enacom@record@mattersection}{Discussed matters}
	\providecommand{\enacom@record@actionsection}{Register of actions}
	\providecommand{\declarationname}{Declaration}
	\providecommand{\entitiesname}{Entities}
	\providecommand{\ofname}{of}
	\providecommand{\pagename}{Page}
	\providecommand{\itemname}{Item}
	\providecommand{\itemsname}{Items}
	\providecommand{\descname}{Description}
	\providecommand{\solutionname}{Solution}
	\providecommand{\timeframename}{Timeframe}	
	\providecommand{\deliveredname}{Delivered}
	\providecommand{\yname}{y}
	\providecommand{\nname}{n}
	\providecommand{\uname}{na}
	\providecommand{\subjectname}{Subject}
	\providecommand{\supportname}{Support}	
	\providecommand{\commentname}{Comment}
	\providecommand{\contextname}{Context}
	\providecommand{\clientname}{Client}
	\providecommand{\projectname}{Project}
	\providecommand{\productname}{Product}
	\providecommand{\productname}{Produto}
	\providecommand{\yproductname}{Delivered product}
	\providecommand{\nproductname}{Undelivered product}
	\providecommand{\uproductname}{Other product}
	\providecommand{\namename}{Name}
	\providecommand{\authorname}{Author}
	\providecommand{\datename}{Date}
	\providecommand{\meetingdatename}{Meeting}
	\providecommand{\localname}{Local}
	\providecommand{\updatename}{Updates}
	\providecommand{\participantname}{Participants}
	\providecommand{\guestname}{Guests}
	\providecommand{\responsiblename}{Responsible}
	\providecommand{\actionname}{Action}
	\providecommand{\deadlinename}{Deadline}
	\providecommand{\acceptname}{Acceptance}
	\providecommand{\acceptname@yes}{I fully accept}
	\providecommand{\acceptname@partial}{I partially accept}
	\providecommand{\acceptname@no}{I do not accept}
	\providecommand{\attname}{Sincerely}
	\ifx\enacom@option@type\enacom@type@accept
		\newcommand{\closingsentence}{Therefore, we ask for approval of \qm{\enacom@reference}, which is under responsibility of ENACOM.%
		\ifnum\value{enacom@author@count}>0
		
		\attname,\fi}
	\else
		\newcommand{\closingsentence}{\attname,}
	\fi
\fi

% list commands
\newcounter{enacom@author@count}
\newcounter{enacom@support@count}
\newcounter{enacom@update@count}
\newcounter{enacom@partner@count}
\newcounter{enacom@advisor@count}
\newcounter{enacom@product@count}
\newcounter{enacom@yproduct@count}
\newcounter{enacom@nproduct@count}
\newcounter{enacom@uproduct@count}
\newcounter{enacom@hh@count}
\newcounter{enacom@participant@count}
\newcounter{enacom@guest@count}
\newcounter{enacom@matter@count}
\newcounter{enacom@issue@count}
\newcounter{enacom@action@count}
\newcounter{enacom@checklist@count}
\newcounter{enacom@action@label@count}
\renewcommand{\theenacom@action@label@count}{\Alph{enacom@action@label@count}}
\newcounter{enacom@count}
\newcount \enacom@counter
\newcommand{\thechecklist}{\arabic{enacom@checklist@count}}

\ifx\enacom@option@type\enacom@type@poster
	\providecommand{\enacom@figure@height}{40mm}
	\providecommand{\enacom@figure@hskip}{32mm}
	\providecommand{\enacom@figure@vskip}{20mm}
\else
	\providecommand{\enacom@figure@height}{10mm}
	\providecommand{\enacom@figure@hskip}{8mm}
	\providecommand{\enacom@figure@vskip}{5mm}
\fi

\def\enacom@insert@author#1#2#3#4{%
	\stepcounter{enacom@author@count}%
	\enacom@csdef{author@position\roman{enacom@author@count}}{#1}%
	\ifx\emptytoke#2\emptytoken
	\else
		\enacom@csdef{author@degree\roman{enacom@author@count}}{#2}%
	\fi
	\enacom@csdef{author@name\roman{enacom@author@count}}{#3}%
	\enacom@csdef{author@surname\roman{enacom@author@count}}{#4}%
}

\def\enacom@insert@participant#1#2#3{%
	\stepcounter{enacom@participant@count}%
	\enacom@csdef{participant@email\roman{enacom@participant@count}}{#1}%
	\enacom@csdef{participant@name\roman{enacom@participant@count}}{#2}%
	\enacom@csdef{participant@company\roman{enacom@participant@count}}{#3}%
}

\def\enacom@insert@guest#1#2#3{%
	\stepcounter{enacom@guest@count}%
	\enacom@csdef{guest@email\roman{enacom@guest@count}}{#1}%
	\enacom@csdef{guest@name\roman{enacom@guest@count}}{#2}%
	\enacom@csdef{guest@company\roman{enacom@guest@count}}{#3}%
}

\def\enacom@insert@advisor#1#2#3{%
	\stepcounter{enacom@advisor@count}%
	\enacom@csdef{advisor@position\roman{enacom@advisor@count}}{#1}%
	\enacom@csdef{advisor@name\roman{enacom@advisor@count}}{#2}%
	\enacom@csdef{advisor@surname\roman{enacom@advisor@count}}{#3}%
}

\def\enacom@insert@matter#1#2{%
	\stepcounter{enacom@matter@count}%
	\enacom@csdef{matter@solution\roman{enacom@matter@count}}{#1}%
	\enacom@csdef{matter@content\roman{enacom@matter@count}}{#2}%
}

\def\enacom@insert@issue#1#2{%
	\stepcounter{enacom@issue@count}%
	\enacom@csdef{issue@solution\roman{enacom@issue@count}}{#1}%
	\enacom@csdef{issue@content\roman{enacom@issue@count}}{#2}%
}

\def\enacom@insert@action#1#2#3#4{%
	\stepcounter{enacom@action@count}%
	\enacom@csdef{action@label\roman{enacom@action@count}}{#1}%
	\enacom@csdef{action@deadline\roman{enacom@action@count}}{#2}%
	\enacom@csdef{action@agent\roman{enacom@action@count}}{#3}%
	\enacom@csdef{action@description\roman{enacom@action@count}}{#4}%
}

\def\enacom@insert@hh#1#2#3#4#5#6#7{%
	\stepcounter{enacom@hh@count}%
	\enacom@csdef{hh@cpf\roman{enacom@hh@count}}{#1}%
	\enacom@csdef{hh@name\roman{enacom@hh@count}}{#2}%
	\enacom@csdef{hh@position\roman{enacom@hh@count}}{#3}%
	\enacom@csdef{hh@time\roman{enacom@hh@count}}{#4}%
	\enacom@csdef{hh@startday\roman{enacom@hh@count}}{#5}%
	\enacom@csdef{hh@endday\roman{enacom@hh@count}}{#6}%
	\ifx\emptytoken#7\emptytoken
	\else
		\enacom@csdef{hh@distribution\roman{enacom@hh@count}}{#7}%
	\fi
}

\def\enacom@insert@support#1#2{%
	\stepcounter{enacom@support@count}%
	\enacom@csdef{support@name\roman{enacom@support@count}}{#1}%
	\enacom@csdef{support@logo\roman{enacom@support@count}}{#2}%
}

\def\enacom@insert@update#1#2#3{%
	\stepcounter{enacom@update@count}%
	\enacom@csdef{update@date\roman{enacom@update@count}}{#1}%
	\enacom@csdef{update@author\roman{enacom@update@count}}{#2}%
	\enacom@csdef{update@itens\roman{enacom@update@count}}{#3}%
}


\def\enacom@insert@product#1#2{%
	\stepcounter{enacom@product@count}%
	\enacom@csdef{product@description\roman{enacom@product@count}}{#1}%
	\enacom@csdef{product@status\roman{enacom@product@count}}{#2}%
}

\def\enacom@insert@yproduct#1#2{%
	\stepcounter{enacom@yproduct@count}%
	\enacom@csdef{yproduct@description\roman{enacom@yproduct@count}}{#1}%
	\enacom@csdef{yproduct@status\roman{enacom@yproduct@count}}{#2}%
}

\def\enacom@insert@nproduct#1#2{%
	\stepcounter{enacom@nproduct@count}%
	\enacom@csdef{nproduct@description\roman{enacom@nproduct@count}}{#1}%
	\enacom@csdef{nproduct@status\roman{enacom@nproduct@count}}{#2}%
}

\def\enacom@insert@uproduct#1#2{%
	\stepcounter{enacom@uproduct@count}%
	\enacom@csdef{uproduct@description\roman{enacom@uproduct@count}}{#1}%
	\enacom@csdef{uproduct@status\roman{enacom@uproduct@count}}{#2}%
}

\def\enacom@insert@partner#1#2{%
	\stepcounter{enacom@partner@count}%
	\enacom@csdef{partner@name\roman{enacom@partner@count}}{#1}%
	\enacom@csdef{partner@logo\roman{enacom@partner@count}}{#2}%
}

\def\enacom@csdef#1#2{%
	\expandafter\gdef\csname enacom@#1\endcsname{#2}%
}

\newcommand{\enacom@author@label}{%
	\ifnum\value{enacom@author@count}>1%
		\ifx\enacom@option@language\enacom@language@portuguese%
			Autores%
		\else%
			Authors%
		\fi%
	\else%
		\ifx\enacom@option@language\enacom@language@portuguese%
			Autor%
		\else%
			Author%
		\fi%
	\fi%
}

\newcommand{\enacom@advisor@label}{%
	\ifx\enacom@option@language\enacom@language@portuguese%
		Orientador%
	\else%
		Advisor%
	\fi%
}

\newcommand{\enacom@coadvisor@label}{%
	\ifnum\value{enacom@advisor@count}>2%
		\ifx\enacom@option@language\enacom@language@portuguese%
			Co-orientadores%
		\else%
			Co-advisors%
		\fi%
	\else%
		\ifx\enacom@option@language\enacom@language@portuguese%
			Co-orientador%
		\else%
			Co-advisor%
		\fi%
	\fi%
}

\newcommand{\enacom@support@label}{%
	\ifx\enacom@option@language\enacom@language@portuguese%
		Suporte%
	\else%
		Support%
	\fi%
}

\newcommand{\enacom@update@label}{%
	\ifx\enacom@option@language\enacom@language@portuguese%
		Histórico de atualizações%
	\else%
		Updates%
	\fi%
}


\def\enacom@print@commercial@author{%
	\ifnum\value{enacom@author@count}>0%
		\enacom@counter=0\relax\enacom@print@commercial@authors
	\fi%
}

\def\enacom@print@commercial@authors{%
	\ifnum\enacom@counter<\value{enacom@author@count}{%
		\advance\enacom@counter by 1\relax%
		~\\[15mm]%
		\csname enacom@author@name\romannumeral\enacom@counter \endcsname~%
		\csname enacom@author@surname\romannumeral\enacom@counter \endcsname%
		\ifcsname enacom@author@degree\romannumeral\enacom@counter\endcsname
			,~%
			\csname enacom@author@degree\romannumeral\enacom@counter\endcsname
		\fi
		\ifcsname enacom@author@position\romannumeral\enacom@counter\endcsname
			\\%
			\begin{small}
				\csname enacom@author@position\romannumeral\enacom@counter\endcsname
			\end{small} 
		\fi
		\enacom@print@commercial@authors%
	}\fi%
}


\def\enacom@print@inline@author{%
	\ifnum\value{enacom@author@count}>0%
		\vspace{3mm}
		\enacom@counter=0\relax\enacom@print@inline@authors
		\\[3mm]
	\fi%
}

\def\enacom@print@inline@authors{%
	\ifnum\enacom@counter<\value{enacom@author@count}{%
		\advance\enacom@counter by 1\relax%
		\csname enacom@author@name\romannumeral\enacom@counter \endcsname~%
		\csname enacom@author@surname\romannumeral\enacom@counter \endcsname
		\ifnum\enacom@counter<\value{enacom@author@count}{~~.~~}\fi%
		\enacom@print@inline@authors%
	}\fi%
}


\def\enacom@print@simple@author{%
	\ifnum\value{enacom@author@count}>0%
		\ifx\enacom@option@type\enacom@type@report
			\textit{\enacom@author@label}:\\%
		\fi
		\enacom@counter=0\relax\enacom@print@simple@authors
	\fi%
}

\def\enacom@print@simple@authors{%
	\ifnum\enacom@counter<\value{enacom@author@count}{%
		\advance\enacom@counter by 1\relax%
		\csname enacom@author@name\romannumeral\enacom@counter \endcsname~%
		\textsc{\csname enacom@author@surname\romannumeral\enacom@counter \endcsname}%
		\ifcsname enacom@author@degree\romannumeral\enacom@counter\endcsname
			,~%
			\csname enacom@author@degree\romannumeral\enacom@counter\endcsname
		\fi%
		\\%
		\enacom@print@simple@authors%
	}\fi%
}


\def\enacom@print@advisor{%
	\ifnum\value{enacom@advisor@count}>0%
		\vspace{3mm}
		\enacom@advisor@namei~\textsc{\enacom@advisor@surnamei}
	\fi%
}

\def\enacom@print@coadvisor{%
	\ifnum\value{enacom@advisor@count}>1%
		\vspace{3mm}
		\enacom@counter=1\relax\enacom@print@coadvisors
	\fi%
}

\def\enacom@print@coadvisors{%
	\ifnum\enacom@counter<\value{enacom@advisor@count}{%
		\advance\enacom@counter by 1\relax%
		\csname enacom@advisor@name\romannumeral\enacom@counter \endcsname~%
		\textsc{\csname enacom@advisor@surname\romannumeral\enacom@counter \endcsname}\\%
		\enacom@print@coadvisors%
	}\fi%
}

\def\enacom@print@support@name{%
	\ifnum\value{enacom@support@count}>0%
	\textit{\enacom@support@label}:\\%
	\enacom@counter=0\relax\enacom@print@support@names
	\fi%
}

\def\enacom@print@support@names{%
	\ifnum\enacom@counter<\value{enacom@support@count}{%
		\advance\enacom@counter by 1\relax%
		\csname enacom@support@name\romannumeral\enacom@counter \endcsname\\%
		\enacom@print@support@names%
	}\fi%
}

\def\enacom@printinline@support@name#1{%
	\ifnum\value{enacom@support@count}>0%
	\enacom@counter=0\relax\enacom@printinline@support@names{#1}%
	\fi%
}

\def\enacom@printinline@support@names#1{%
	\ifnum\enacom@counter<\value{enacom@support@count}{%
		\advance\enacom@counter by 1\relax%
		\ifnum\enacom@counter=\value{enacom@support@count}%
			\ifnum\value{enacom@support@count}=1
				\csname enacom@support@name\romannumeral\enacom@counter \endcsname%
			\else
				{ #1} \csname enacom@support@name\romannumeral\enacom@counter \endcsname%
			\fi
		\else%
			\advance\enacom@counter by 1\relax%
			\ifnum\enacom@counter=\value{enacom@support@count}%
				\advance\enacom@counter by -1\relax%
				\csname enacom@support@name\romannumeral\enacom@counter \endcsname  %
			\else
				\advance\enacom@counter by -1\relax%
				\csname enacom@support@name\romannumeral\enacom@counter \endcsname, %
			\fi
		\fi%
		\enacom@printinline@support@names{#1}%
	}\fi%
}

\def\enacom@print@support@logo{%
	\ifnum\value{enacom@support@count}>0%
		\enacom@counter=0\relax\enacom@print@support@logos
	\fi%
}

\def\enacom@print@support@logos{%
	\ifnum\enacom@counter<\value{enacom@support@count}{%
		\advance\enacom@counter by 1\relax%
		\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip},height=\enacom@figure@height]{%
		\csname enacom@support@logo\romannumeral\enacom@counter\endcsname}%
		\hspace{\enacom@figure@hskip}%
		\enacom@print@support@logos%
	}\fi%
}

\def\enacom@print@update{%
	\ifnum\value{enacom@update@count}>0%
	\phantomsection
	\ifx\enacom@option@type\enacom@type@book
		\chapter*{\enacom@update@label}
		\addcontentsline{toc}{chapter}{\enacom@update@label}
	\else
		\section*{\enacom@update@label}
		\addcontentsline{toc}{section}{\enacom@update@label}
	\fi
	\begin{flushleft}%
	\enacom@counter=0\relax\enacom@print@updates
	\end{flushleft}%
	\fi%
}

\def\enacom@print@updates{%
	\ifnum\enacom@counter<\value{enacom@update@count}{%
		\advance\enacom@counter by 1\relax%
		\begin{updatelog}{\csname enacom@update@date\romannumeral\enacom@counter \endcsname}{\csname enacom@update@author\romannumeral\enacom@counter \endcsname}
		\csname enacom@update@itens\romannumeral\enacom@counter \endcsname%
		\end{updatelog}
		\enacom@print@updates%
	}\fi%
}



\def\enacom@print@tabular@update{%
	\ifnum\value{enacom@update@count}>0%
	\updatename\dotfill%
	\setcounter{enacom@count}{0}\relax%
	\enacom@print@tabular@updates%
	\fi%
}

\def\enacom@print@tabular@updates{%
	\ifnum\value{enacom@count}<\value{enacom@update@count}%
		\stepcounter{enacom@count}\relax%
		& {\csname enacom@update@date\romannumeral\value{enacom@count}\endcsname}~~{\csname enacom@update@author\romannumeral\value{enacom@count}\endcsname}\\%
		\enacom@print@tabular@updates%
	\fi%
}


\def\enacom@print@tabular@participant{%
	\ifnum\value{enacom@participant@count}>0%
	\setcounter{enacom@count}{0}\relax%
	\enacom@print@tabular@participants%
	\fi%
}

\def\enacom@print@tabular@participants{%
	\ifnum\value{enacom@count}<\value{enacom@participant@count}%
		\stepcounter{enacom@count}\relax%
{\csname enacom@participant@name\romannumeral\value{enacom@count}\endcsname} & {\csname enacom@participant@company\romannumeral\value{enacom@count}\endcsname} & {\csname
enacom@participant@email\romannumeral\value{enacom@count}\endcsname}\\%
		\enacom@print@tabular@participants%
	\fi%
}




\def\enacom@print@tabular@guest{%
	\ifnum\value{enacom@guest@count}>0%
	\setcounter{enacom@count}{0}\relax%
	\enacom@print@tabular@guests%
	\fi%
}

\def\enacom@print@tabular@guests{%
	\ifnum\value{enacom@count}<\value{enacom@guest@count}%
		\stepcounter{enacom@count}\relax%
{\csname enacom@guest@name\romannumeral\value{enacom@count}\endcsname} & {\csname enacom@guest@company\romannumeral\value{enacom@count}\endcsname} & {\csname
enacom@guest@email\romannumeral\value{enacom@count}\endcsname}\\%
		\enacom@print@tabular@guests%
	\fi%
}





\def\enacom@print@hh{%
	\ifnum\value{enacom@hh@count}>0%
	\enacom@counter=0\relax\enacom@print@hhs
	\end{flushleft}%
	\fi%
}



\def\enacom@hh@distribution{
\ifcsname enacom@hh@distribution\romannumeral\enacom@counter \endcsname
\ifx\enacom@option@language\enacom@language@portuguese%
	Distribuídas da seguinte forma:
\else
	Distributed according to:
\fi
\begin{itemize}
	\csname enacom@hh@distribution\romannumeral\enacom@counter \endcsname
\end{itemize}
\vspace{5mm}
\fi
}



\def\enacom@print@hhs{%
	\ifnum\enacom@counter<\value{enacom@hh@count}{%
		\advance\enacom@counter by 1\relax%
		\vspace*{1mm}\vfill%
		\begin{center}\textbf{\MakeUppercase{\declarationname}\\[20mm]}\end{center}%
		\ifx\enacom@option@language\enacom@language@portuguese%
			Eu, \csname enacom@hh@name\romannumeral\enacom@counter \endcsname, portador do CPF 
\csname enacom@hh@cpf\romannumeral\enacom@counter \endcsname, declaro, para os devidos fins, que trabalhei \csname enacom@hh@time\romannumeral\enacom@counter \endcsname,
na qualidade de \csname enacom@hh@position\romannumeral\enacom@counter \endcsname, para o desenvolvimento do projeto \qm{\enacom@title}, no período de \csname
enacom@hh@startday\romannumeral\enacom@counter \endcsname~a \csname enacom@hh@endday\romannumeral\enacom@counter \endcsname.\\[5mm]
\enacom@hh@distribution
Por ser verdade, dato e assino esta
declaração.
		\else%
I, \csname enacom@hh@name\romannumeral\enacom@counter \endcsname, owner of ID \csname enacom@hh@cpf\romannumeral\enacom@counter \endcsname, hereby declare that I worked
\csname enacom@hh@time\romannumeral\enacom@counter \endcsname, in the position of \csname enacom@hh@position\romannumeral\enacom@counter \endcsname, for the project
\qm{\enacom@title}, from \csname enacom@hh@startday\romannumeral\enacom@counter \endcsname~to \csname enacom@hh@endday\romannumeral\enacom@counter \endcsname.\\[5mm]
\enacom@hh@distribution
For being true and correct, I date and sign this declaration.%
		\fi%
		\\[10mm]\enacom@local, \enacom@date,\\[20mm]%
		\begin{flushleft}%
			\csname enacom@hh@name\romannumeral\enacom@counter \endcsname\\%
			\begin{small}\csname enacom@hh@cpf\romannumeral\enacom@counter \endcsname\end{small}%
		\end{flushleft}%
		\vfill\clearpage%
		\enacom@print@hhs%
	}\fi%
}



\def\enacom@print@tabular@product{%
	\ifnum\value{enacom@product@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@products%
	\fi%
}

\def\enacom@status@y{x& & }
\def\enacom@status@n{ &x& }
\def\enacom@status@u{ & &x}


\def\enacom@print@tabular@products{%
	\ifnum\value{enacom@count}<\value{enacom@product@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@product@description\romannumeral\value{enacom@count}\endcsname & %
	    \csname enacom@status@\csname enacom@product@status\romannumeral\value{enacom@count}\endcsname\endcsname\\%
		\enacom@print@tabular@products%
	\fi%
}

\def\enacom@print@tabular@yproduct{%
	\ifnum\value{enacom@yproduct@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@yproducts%
	\fi%
}

\def\enacom@print@tabular@yproducts{%
	\ifnum\value{enacom@count}<\value{enacom@yproduct@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@yproduct@description\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@yproducts%
	\fi%
}


\def\enacom@print@tabular@nproduct{%
	\ifnum\value{enacom@nproduct@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@nproducts%
	\fi%
}

\def\enacom@print@tabular@nproducts{%
	\ifnum\value{enacom@count}<\value{enacom@nproduct@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@nproduct@description\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@nproducts%
	\fi%
}


\def\enacom@print@tabular@uproduct{%
	\ifnum\value{enacom@uproduct@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@uproducts%
	\fi%
}

\def\enacom@print@tabular@uproducts{%
	\ifnum\value{enacom@count}<\value{enacom@uproduct@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@uproduct@description\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@uproducts%
	\fi%
}


\def\enacom@print@partner{%
	\ifnum\value{enacom@partner@count}>0%
	\enacom@counter=0\relax\enacom@print@partners
	\fi%
}

\def\enacom@print@partners{%
	\ifnum\enacom@counter<\value{enacom@partner@count}{%
		\advance\enacom@counter by 1\relax%
		~~.~~\csname enacom@partner@name\romannumeral\enacom@counter \endcsname%
		\enacom@print@partners%
	}\fi%
}

\def\enacom@print@logo@left{%
	\ifx\enacom@option@enacom\enacom@enacom@yes
		\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip}, height=\enacom@figure@height]{enacom}%
	\fi
	\ifnum\value{enacom@partner@count}>0%
		\enacom@counter=0\relax\enacom@print@logos@left
	\fi%
}

\def\enacom@print@logos@left{%
	\ifnum\enacom@counter<\value{enacom@partner@count}{%
		\advance\enacom@counter by 1\relax%
		\hspace{\enacom@figure@hskip}\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip},height=\enacom@figure@height]{%
		\csname enacom@partner@logo\romannumeral\enacom@counter\endcsname}%
		\enacom@print@logos@left%
	}\fi%
}

\def\enacom@print@logo@right{%
	\ifnum\value{enacom@partner@count}>0%
		\enacom@counter=\value{enacom@partner@count}\relax\enacom@print@logos@right%
	\fi%
	\ifx\enacom@option@enacom\enacom@enacom@yes
		\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip},height=\enacom@figure@height]{enacom}%
	\fi
}


\def\enacom@print@logos@right{%
	\ifnum\enacom@counter>0{%
		\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip},height=\enacom@figure@height]{%
		\csname enacom@partner@logo\romannumeral\enacom@counter\endcsname}%
		\hspace{\enacom@figure@hskip}%
		\advance\enacom@counter by -1\relax%
		\enacom@print@logos@right%
	}\fi%
}




\def\enacom@print@tabular@partner{%
	\ifnum\value{enacom@partner@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\mbox{%
			\begin{tabularx}{100mm}{cp{5cm}}%
				\enacom@print@tabular@partners%
			\end{tabularx}%
		}%
	\fi%
}

\def\enacom@print@tabular@partners{%
	\ifnum\value{enacom@count}<\value{enacom@partner@count}%
		\stepcounter{enacom@count}\relax%
		\includegraphics[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip},height=\enacom@figure@height]{%
		\csname enacom@partner@logo\romannumeral\value{enacom@count}\endcsname}%
		& \raisebox{4mm}{\csname enacom@partner@name\romannumeral\value{enacom@count}\endcsname} \\%
		\enacom@print@tabular@partners%
	\fi%
}



\def\enacom@print@tabular@matter{%
	\ifnum\value{enacom@matter@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@matters%
	\fi%
}

\def\enacom@print@tabular@matters{%
	\ifnum\value{enacom@count}<\value{enacom@matter@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@matter@content\romannumeral\value{enacom@count}\endcsname & %
	    \csname enacom@matter@solution\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@matters%
	\fi%
}



\def\enacom@print@tabular@issue{%
	\ifnum\value{enacom@issue@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\enacom@print@tabular@issues%
	\fi%
}

\def\enacom@print@tabular@issues{%
	\ifnum\value{enacom@count}<\value{enacom@issue@count}%
		\stepcounter{enacom@count}\relax%
		\ifnum\value{enacom@count}<10{0}\fi\arabic{enacom@count} & %
		\csname enacom@issue@content\romannumeral\value{enacom@count}\endcsname & %
	    \csname enacom@issue@solution\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@issues%
	\fi%
}


\def\enacom@print@tabular@action{%
	\ifnum\value{enacom@action@count}>0%
		\setcounter{enacom@count}{0}\relax%
		\setcounter{enacom@action@label@count}{0}\relax%
		\enacom@print@tabular@actions%
	\fi%
}

\def\enacom@print@tabular@actions{%
	\ifnum\value{enacom@count}<\value{enacom@action@count}%
		\stepcounter{enacom@count}\relax%
		\refstepcounter{enacom@action@label@count}\theenacom@action@label@count%
		\csname enacom@action@label\romannumeral\value{enacom@count}\endcsname & %
		\csname enacom@action@description\romannumeral\value{enacom@count}\endcsname & %
   	 	\csname enacom@action@agent\romannumeral\value{enacom@count}\endcsname & %
   	 	\csname enacom@action@deadline\romannumeral\value{enacom@count}\endcsname\\%
		\enacom@print@tabular@actions%
	\fi%
}


% title options
\newcommand{\enacom@type}{~}
\newcommand{\enacom@title}{~}
\newcommand{\enacom@subtitle}{~}
\newcommand{\enacom@author}{~}
\ifx\enacom@option@type\enacom@type@letter
	\newcommand{\enacom@date}{\today}
\else
	\newcommand{\enacom@date}{~}
\fi
\newcommand{\enacom@local}{Belo Horizonte}
\newcommand{\enacom@copyrights}{~}
\newcommand{\enacom@abstract}{~}
\newcommand{\enacom@acknowledgements}{~}
\newcommand{\enacom@yes}{y}
\newcommand{\enacom@no}{n}
\newcommand{\enacom@na}{u}
\newcommand{\enacom@ending}{\closingsentence}
\newcommand{\enacom@destine@name}{~}
\newcommand{\enacom@destine@department}{~}
\newcommand{\enacom@destine@company}{~}
\newcommand{\enacom@reference}{~}

\providecommand{\type}[1]{\renewcommand{\enacom@type}{#1}\hypersetup{pdfsubject=#1}}
\renewcommand{\title}[1]{\renewcommand{\enacom@title}{#1}\hypersetup{pdftitle=#1}}
\ifx\enacom@option@type\enacom@type@slides
	\renewcommand{\subtitle}[1]{\renewcommand{\enacom@subtitle}{#1}}
\else
	\providecommand{\subtitle}[1]{\renewcommand{\enacom@subtitle}{#1}}
\fi
\renewcommandx{\author}[4][1=~,2=]{\enacom@insert@author{#1}{#2}{#3}{#4}\hypersetup{pdfauthor=#3 #4}}
\providecommand{\participant}[3][~]{\enacom@insert@participant{#1}{#2}{#3}}
\providecommand{\guest}[3][~]{\enacom@insert@guest{#1}{#2}{#3}}
\providecommand{\matter}[2][NA]{\enacom@insert@matter{#1}{#2}}
\providecommand{\issue}[2][NA]{\enacom@insert@issue{#1}{#2}}
\providecommand{\action}[4][\relax]{\enacom@insert@action{#1}{#2}{#3}{#4}}
\providecommand{\advisor}[3][~]{\enacom@insert@advisor{#1}{#2}{#3}}
\providecommand{\support}[1]{\enacom@insert@support{#1}}
\renewcommand{\date}[1]{\renewcommand{\enacom@date}{#1}}
\newcommand{\local}[1]{\renewcommand{\enacom@local}{#1}}
\providecommand{\copyrights}[1]{\renewcommand{\enacom@copyrights}{#1}}
\providecommand{\update}[3]{\enacom@insert@update{#1}{#2}{#3}}
\providecommand{\partner}[2]{\enacom@insert@partner{#1}{#2}}
\ifx\enacom@option@type\enacom@type@book
	\providecommand{\abstract}[1]{\renewcommand{\enacom@abstract}{#1}}
\else
	\ifx\enacom@option@type\enacom@type@thesis
		\providecommand{\abstract}[1]{\renewcommand{\enacom@abstract}{#1}}
	\else
		\renewcommand{\abstract}[1]{\renewcommand{\enacom@abstract}{#1}}
	\fi
\fi
\providecommand{\ack}[1]{\renewcommand{\enacom@acknowledgements}{#1}}
\providecommand{\closing}[1]{\renewcommand{\enacom@ending}{#1}}
\providecommand{\destine}[3]{\renewcommand{\enacom@destine@name}{#1}\renewcommand{\enacom@destine@department}{#2}\renewcommand{\enacom@destine@company}{#3}}
\providecommand{\reference}[1]{\renewcommand{\enacom@reference}{#1}}
\providecommand{\product}[2][y]{%
	\enacom@insert@product{#2}{#1}
	\ifx#1y
		\enacom@insert@yproduct{#2}{#1}
	\fi
	\ifx#1n
		\enacom@insert@nproduct{#2}{#1}
	\fi
	\ifx#1u
		\enacom@insert@uproduct{#2}{#1}
	\fi
}
\providecommand{\hh}[7]{\enacom@insert@hh{#1}{#2}{#3}{#4}{#5}{#6}{#7}}
\providecommand{\conditions}[1]{\newcommand{\enacom@conditions}{#1}}
\providecommand{\activities}[1]{\newcommand{\enacom@activities}{#1}}
\providecommand{\expectations}[1]{\newcommand{\enacom@expectations}{#1}}
\providecommand{\attachments}[1]{\newcommand{\enacom@attachments}{#1}}
\providecommand{\changes}[1]{\newcommand{\enacom@changes}{#1}}
\newcommand{\enacom@review}{0}
\providecommand{\review}[1]{\renewcommand{\enacom@review}{#1}}
\newcommand{\enacom@process}{000.000}
\providecommand{\process}[1]{\renewcommand{\enacom@process}{#1}}
\providecommand{\getcode}[1]{PO \StrBetween*[1,2]{#1}{Po}{-}}

% PDF
\ifx\enacom@option@color\enacom@color@colorful
\hypersetup{citecolor=enacom@color@blue, linkcolor=enacom@color@blue, urlcolor=enacom@color@blue, filecolor=enacom@color@blue, raiselinks=false, colorlinks=true,
bookmarks=true, bookmarksnumbered=true, bookmarkstype=toc, pdfcreator=LaTeX template of ENACOM, pdfdisplaydoctitle=true}
\else
\hypersetup{citecolor=enacom@color@gray, linkcolor=enacom@color@gray, urlcolor=enacom@color@gray, filecolor=enacom@color@gray, raiselinks=false, colorlinks=true,
bookmarks=true, bookmarksnumbered=true, bookmarkstype=toc, pdfcreator=LaTeX template of ENACOM, pdfdisplaydoctitle=true}
\fi

% reference
\providecommand{\figureautorefname}{\figurename}
\providecommand{\tableautorefname}{\tablename}
\ifx\enacom@option@type\enacom@type@slides
	\providecommand{\autoref}[1]{Figure \ref{#1}}
\fi
\ifx\enacom@option@language\enacom@language@portuguese
	\providecommand{\algorithmautorefname}{Algoritmo}
\else
	\providecommand{\algorithmautorefname}{Algorithm}
\fi

% abstract
\ifx\abstractname
	\relax
\else
	\ifx\enacom@option@language\enacom@language@portuguese
		\providecommand{\abstractname}{Resumo}
	\else
		\providecommand{\abstractname}{Abstract}
	\fi
\fi

% enumerate, itemize and checklists
\newcommand{\enacom@define@enumerate}{
	\renewcommand*{\theenumi}{\roman{enumi}}
	\renewcommand*{\labelenumi}{\theenumi.}
	\renewcommand{\theenumii}{\alph{enumii}}
	\renewcommand{\labelenumii}{\theenumii.}
	\renewcommand{\theenumiii}{\arabic{enumiii}}
	\renewcommand{\labelenumiii}{\theenumiii.}
}

\ifx\enacom@option@type\enacom@type@slides
	\newenvironment{checklist}{\begin{enumerate}}{\end{enumerate}}
\else
	\setlength{\itemsep}{6pt}
	\enacom@define@enumerate
	\ifx\enacom@option@color\enacom@color@colorful
		\renewcommand{\labelitemi}{\textcolor{enacom@color@blue}{$\bullet$}}
		\renewcommand{\labelitemii}{\textcolor{enacom@color@gray}{$\bullet$}}
		\renewcommand{\labelitemiii}{\textcolor{enacom@color@lightgray}{$\bullet$}}
	\else
		\renewcommand{\labelitemi}{\textcolor{enacom@color@gray}{$\bullet$}}
		\renewcommand{\labelitemii}{\textcolor{enacom@color@lightgray}{$\bullet$}}
		\renewcommand{\labelitemiii}{\textcolor{enacom@color@extralightgray}{$\bullet$}}
	\fi

	\newcommand{\enacom@unchecked}{\CheckBox[name=\thechecklist.\arabic{enumi},bordercolor=enacom@color@blue,checked=false]{}}
	\newenvironment{checklist}{
		\begin{Form}
			\stepcounter{enacom@checklist@count}
			\def\DefaultHeightofCheckBox{3mm}
			\def\DefaultWidthofCheckBox{3mm}
			\renewcommand*{\theenumi}{\roman{enumi}}
			\renewcommand*{\labelenumi}{\theenumi. \enacom@unchecked}
			\renewcommand{\theenumii}{\alph{enumii}}
			\renewcommand{\labelenumii}{\theenumii. \enacom@unchecked}
			\renewcommand{\theenumiii}{\arabic{enumiii}}
			\renewcommand{\labelenumiii}{\theenumiii. \enacom@unchecked}
			\begin{enumerate}
	}{\end{enumerate}\end{Form}\enacom@define@enumerate}
\fi



% caption and lists
\ifx\enacom@option@type\enacom@type@slides
	\setcounter{secnumdepth}{2}
	\setcounter{tocdepth}{2}
\else
	\setcounter{secnumdepth}{4}
	\setcounter{tocdepth}{4}
	\captionsetup{margin=0.1\textwidth,font=footnotesize,lofdepth=2,lotdepth=2}
	\captionsetup[subfloat]{margin=10pt,labelformat=parens}
\fi


% foot notes
\interfootnotelinepenalty=10000 % avoid sppliting of foot notes

% figure
\ifx\enacom@option@language\enacom@language@portuguese
	\renewcommand{\subfigurename}{Subfigura}
\else
	\renewcommand{\subfigurename}{Subfigure}
\fi
\ifx\enacom@option@type\enacom@type@article
	\let\enacom@figure\figure
	\let\enacom@endfigure\endfigure
	\def\figure{\@ifnextchar[\figure@i \figure@ii}
	\def\figure@i[#1]{\begin{figure*}[#1]\centering}
	\def\figure@ii{\begin{figure*}\centering}
	\def\endfigure{\end{figure*}}
\else
	\let\enacom@figure\figure
	\def\figure{\@ifnextchar[\figure@i \figure@ii}
	\def\figure@i[#1]{\enacom@figure[#1]\centering}
	\def\figure@ii{\enacom@figure\centering}
\fi
\let\enacom@includegraphics\includegraphics
\renewcommand{\includegraphics}[2][]{%
	\def\enacom@pdfname{#2.pdf}
	\def\enacom@epsname{#2.eps}
	\def\enacom@pngname{#2.png}
	\def\enacom@jpgname{#2.jpg}
	\IfFileExists{#2}{%
		\enacom@includegraphics[#1]{#2}
	}{
		\IfFileExists{\enacom@pdfname}{%
			\enacom@includegraphics[#1]{\enacom@pdfname}
		}{
			\IfFileExists{\enacom@epsname}{%
				\enacom@includegraphics[#1]{\enacom@epsname}
			}{
				\IfFileExists{\enacom@pngname}{%
					\enacom@includegraphics[#1]{\enacom@pngname}
				}{
					\IfFileExists{\enacom@jpgname}{%
						\enacom@includegraphics[#1]{\enacom@jpgname}
					}{
						\errmessage{Could not find "\enacom@pdfname", "\enacom@epsname" or "\enacom@pngname".}
					}
				}
			}
		}
	}
}
\setlength\fboxrule{0.1pt}
\setlength\fboxsep{0pt}

% movie
\let\enacom@includemovie\includemovie
\def\includemovie{\@ifnextchar[\includemovie@i \includemovie@ii}
\def\includemovie@i[#1]{\enacom@includemovie[poster,#1]}
\def\includemovie@ii{\enacom@includemovie[poster]}

% table
\let\enacom@table\table
\let\enacom@endtable\endtable
\let\enacom@tabular\tabular
\let\enacom@endtabular\endtabular

\ifx\enacom@option@language\enacom@language@portuguese
	\renewcommand{\subtablename}{Subtable}
\else
	\renewcommand{\subtablename}{Subtabela}
\fi

\renewenvironment{tabular}[1]{\enacom@tabular{#1}\hline}{\hline\hiderowcolors\enacom@endtabular}

\ifx\enacom@option@type\enacom@type@article
	\def\table{\@ifnextchar[\table@i \table@ii}
	\def\table@i[#1]{\begin{table*}[#1]\centering}
	\def\table@ii{\begin{table*}\centering}
	\def\endtable{\end{table*}}
\else
	\def\table{\@ifnextchar[\table@i \table@ii}
	\def\table@i[#1]{\enacom@table[#1]\centering}
	\def\table@ii{\enacom@table\centering}
	\def\endtable{\enacom@endtable}
\fi

\ifx\enacom@option@color\enacom@color@colorful
	\providecommand{\rowbicolor}[1]{\rowcolors{#1}{enacom@color@lightblue}{enacom@color@white}}
\else
	\providecommand{\rowbicolor}[1]{\rowcolors{#1}{enacom@color@extralightgray}{enacom@color@white}}
\fi

% text commands
\providecommand{\qm}[1]{``#1''} % quotation marks

% code commands
\providecommand{\code}[1]{``\texttt{#1}''}

\lstnewenvironment{mcode}
{
	\lstset{
		basicstyle = \scriptsize\ttfamily,
		keywordstyle = \color{blue},
		stringstyle = \color{enacom@mcode@stringcolor},
		commentstyle = \color{enacom@mcode@commentcolor},
		language = matlab,
		classoffset = 0,
		upquote = true,
		extendedchars = true,
		tabsize = 3,
		showtabs = false,
		keywords = {function,switch,case,otherwise,continue,break,end,for,if,else,elseif,while,return,classdef,methods,properties,try,catch},
		showstringspaces = false
	}
}
{
}

\lstnewenvironment{pycode}
{
	\lstset{
		basicstyle = \scriptsize\ttfamily,
		keywordstyle = \color{blue},
		stringstyle = \color{enacom@mcode@stringcolor},
		commentstyle = \color{enacom@mcode@commentcolor},
		language = python,
		classoffset = 0,
		upquote = true,
		extendedchars = true,
		tabsize = 3,
		showtabs = false,
		keywords = {def,True,False,while,if,elif,else,for,in,or,and,lambda},
		showstringspaces = false
	}
}
{
}

\lstnewenvironment{ccode}
{
	\lstset{
		basicstyle = \scriptsize\ttfamily,
		keywordstyle = \color{blue},
		stringstyle = \color{enacom@ccode@stringcolor},
		commentstyle = \color{enacom@ccode@commentcolor},
		language = c++,
		classoffset = 0,
		upquote = true,
		tabsize = 3,
		showtabs = false,
		morekeywords = {},
		showstringspaces = false,
		deletekeywords = {}
	}
}
{
}

\lstdefinelanguage{lcode}{
		basicstyle = \scriptsize\ttfamily,
		keywordstyle = \color{blue},
		stringstyle = \color{enacom@mcode@stringcolor},
		commentstyle = \color{enacom@mcode@commentcolor},
		language = [LaTeX]TeX,
		classoffset = 0,
		upquote = true,
		extendedchars = true,
		tabsize = 3,
		showtabs = false,
		showstringspaces = false
		morekeywords = {}
}

\lstnewenvironment{lcode}
{
	\lstset{language = lcode}
}
{
}


\lstnewenvironment{xmlcode}
{
	\lstset{
		basicstyle = \scriptsize\ttfamily,
		keywordstyle = \color{blue},
		stringstyle = \color{enacom@mcode@stringcolor},
		commentstyle = \color{enacom@mcode@commentcolor},
		language = xml,
		classoffset = 0,
		upquote = true,
		extendedchars = true,
		tabsize = 3,
		showtabs = false,
		showstringspaces = false
	}
}
{
}



% math commands
\providecommand{\dsum}{\displaystyle\sum\limits}
\providecommand{\dprod}{\displaystyle\prod\limits}
\providecommand{\gradient}{\nabla}
\providecommand{\hessian}{\mathcal{H}}
\newcommand{\conj}[1]{{#1}^*}
\newcommand{\opt}[1]{{#1}^\star}
\newcommand{\T}[1]{{#1}^{\mathrm{T}}}
\newcommand{\invT}[1]{{#1}^{\mathrm{-T}}}
\newcommand{\inv}[1]{{#1}^{\mathrm{-1}}}
\providecommand{\card}[1]{\left|#1\right|}
\providecommand{\ceil}[1]{\left\lceil#1\right\rceil}
\providecommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\providecommand{\set}[1]{\mathbb{#1}}
\providecommand{\nin}{\not\in}
\providecommand{\incident}{\mathop{\mathrm{incident}}}
\providecommand{\e}{\mathrm{e}}
\providecommand{\class}[1]{\mathcal#1}
\providecommand{\abs}[1]{\left|#1\right|}
\providecommand{\norm}[1]{\left\|#1\right\|}
\ifx\enacom@option@language\enacom@language@portuguese
	\DeclareMathOperator*{\mi}{minimize~~}
	\DeclareMathOperator*{\ma}{maximize~~}
	\DeclareMathOperator{\sto}{sujeito~a~~}
\else
	\DeclareMathOperator*{\mi}{minimize~~}
	\DeclareMathOperator*{\ma}{maximize~~}
	\DeclareMathOperator{\sto}{subject~to~~}
\fi
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\real}{real}
\DeclareMathOperator{\imag}{imag}
\providecommand{\mean}{\mathop{\mathrm{mean}}}

% theorems related enviroments
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else
	\newtheorem{definition}{Definition}
	\newtheorem{theorem}{Theorem}
	\newtheorem{corollary}{Corollary}
	\newtheorem{lemma}{Lemma}
\fi

% update log enviroment and command
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else
\newenvironment{updatelog}[2]{\vspace{5mm}\noindent #1 ~ #2 \begin{enumerate}\setlength{\itemsep} {0pt}\setlength{\parskip}{0pt}\setlength{\parsep}{0pt}}
{\end{enumerate}}
	\newcommand{\logupdate}[3]{\begin{update}{#1}{#2}#3\end{updatelog}}
\fi

%PDF comment
\providecommand{\mypdfcomment}[2]{\pdfmarkupcomment[markup=Highlight,color=yellow]{#1}{#2}}

% symbols and abbreviations
\newcommand{\enacom@symbols}{~}
\newcommand{\enacom@abbreviations}{~}
\providecommand{\symbols}[1]{\renewcommand{\enacom@symbols}{#1}}
\providecommand{\abbreviations}[1]{\renewcommand{\enacom@abbreviations}{#1}}
\ifx\enacom@option@language\enacom@language@portuguese
	\providecommand{\symbname}{Simbologia}
	\providecommand{\abbrname}{Abreviaturas}
\else
	\providecommand{\symbname}{Symbology}
	\providecommand{\abbrname}{Abbreviations}
\fi
\newcommand{\enacom@print@symbols}{
	\ifx\enacom@option@type\enacom@type@slides
		\relax
	\else
		\ifx\enacom@option@type\enacom@type@book
			\chapter*{\symbname}
			\addcontentsline{toc}{chapter}{\symbname}
		\else
			\ifx\enacom@option@type\enacom@type@thesis
				\chapter*{\symbname}
				\addcontentsline{toc}{chapter}{\symbname}
			\else
				\section*{\symbname}
				\addcontentsline{toc}{section}{\symbname}
			\fi
		\fi
	\fi
	\ifx\enacom@option@type\enacom@type@article
		\begin{tabularx}{\linewidth}{lX}
			\enacom@symbols
		\end{tabularx}
	\else
		\setlength\LTleft{0pt}
		\setlength\LTright{0pt}
		\begin{longtable}{lp{.8\textwidth}}
			\enacom@symbols
		\end{longtable}
		\setcounter{table}{0}		
	\fi
}
\newcommand{\enacom@print@abbreviations}{
	\ifx\enacom@option@type\enacom@type@slides
		\relax
	\else
		\ifx\enacom@option@type\enacom@type@book
			\chapter*{\abbrname}
			\addcontentsline{toc}{chapter}{\abbrname}
		\else
			\ifx\enacom@option@type\enacom@type@thesis
				\chapter*{\abbrname}
				\addcontentsline{toc}{chapter}{\abbrname}
			\else
				\section*{\abbrname}
				\addcontentsline{toc}{section}{\abbrname}
			\fi
		\fi
	\fi
	\ifx\enacom@option@type\enacom@type@article
		\begin{tabularx}{\linewidth}{lX}
			\enacom@abbreviations
		\end{tabularx}
	\else
		\setlength\LTleft{0pt}
		\setlength\LTright{0pt}
		\begin{longtable}{lp{.8\textwidth}}
			\enacom@abbreviations
		\end{longtable}
		\setcounter{table}{0}		
	\fi
}

% font settings
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else
	% font type
	\renewcommand{\encodingdefault}{T1}
	\renewcommand{\rmdefault}{futura}
	\renewcommand{\sfdefault}{phv}
	\renewcommand{\ttdefault}{pcr}

	% font size
	\newcommand{\enacom@font@size@ten}{10}
	\newcommand{\enacom@font@size@eleven}{11}
	\newcommand{\enacom@font@size@twelve}{12}
	
	\ifx\enacom@option@type\enacom@type@poster

		\ifx\enacom@option@font@size\enacom@font@size@ten
			\renewcommand{\tiny}{\fontsize{12pt}{15pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{14pt}{17pt}\selectfont}
			\renewcommand{\footnotesize}{\fontsize{16pt}{19pt}\selectfont}
			\renewcommand{\small}{\fontsize{20pt}{24pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{26pt}{32pt}\selectfont}
			\renewcommand{\large}{\fontsize{32pt}{40pt}\selectfont}
			\renewcommand{\Large}{\fontsize{36pt}{44pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{44pt}{55pt}\selectfont}
			\renewcommand{\huge}{\fontsize{50pt}{62pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{80pt}{96pt}\selectfont}
			\newcommand{\enacom@parskip}{2pt}
		\fi

		\ifx\enacom@option@font@size\enacom@font@size@eleven
			\renewcommand{\tiny}{\fontsize{14pt}{17pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{16pt}{19pt}\selectfont}
			\renewcommand{\footnotesize}{\fontsize{20pt}{24pt}\selectfont}
			\renewcommand{\small}{\fontsize{26pt}{32pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{32pt}{40pt}\selectfont}
			\renewcommand{\large}{\fontsize{36pt}{44pt}\selectfont}
			\renewcommand{\Large}{\fontsize{44pt}{55pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{50pt}{62pt}\selectfont}
			\renewcommand{\huge}{\fontsize{70pt}{84pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{100pt}{130pt}\selectfont}
			\newcommand{\enacom@parskip}{2pt}
		\fi

		\ifx\enacom@option@font@size\enacom@font@size@twelve
			\renewcommand{\tiny}{\fontsize{16pt}{19pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{20pt}{24pt}\selectfont}
			\renewcommand{\footnotesize}{\fontsize{26pt}{32pt}\selectfont}
			\renewcommand{\small}{\fontsize{32pt}{40pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{36pt}{44pt}\selectfont}
			\renewcommand{\large}{\fontsize{44pt}{55pt}\selectfont}
			\renewcommand{\Large}{\fontsize{50pt}{62pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{70pt}{84pt}\selectfont}
			\renewcommand{\huge}{\fontsize{90pt}{105pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{120pt}{140pt}\selectfont}
			\newcommand{\enacom@parskip}{2pt}
		\fi
		
	\else	

		\ifx\enacom@option@font@size\enacom@font@size@ten
			\renewcommand{\tiny}{\fontsize{6pt}{7pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{7pt}{8pt}\selectfont}
			\ifx\enacom@option@type\enacom@type@letter % standard foot
				\renewcommand{\footnotesize}{\fontsize{8pt}{11pt}\selectfont}
			\else
				\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}
			\fi
			\renewcommand{\small}{\fontsize{9pt}{11pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
			\renewcommand{\large}{\fontsize{11pt}{13pt}\selectfont}
			\renewcommand{\Large}{\fontsize{12pt}{15pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{14pt}{17pt}\selectfont}
			\renewcommand{\huge}{\fontsize{16pt}{19pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{20pt}{24pt}\selectfont}
			
			\ifx\enacom@option@type\enacom@type@article
				\newcommand{\enacom@parskip}{2pt}
			\else	
				\ifx\enacom@option@type\enacom@type@notes
					\newcommand{\enacom@parskip}{2pt}
				\else	
					\newcommand{\enacom@parskip}{6pt}
				\fi
			\fi
		\fi
	
		\ifx\enacom@option@font@size\enacom@font@size@eleven
			\renewcommand{\tiny}{\fontsize{7pt}{8pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{8pt}{10pt}\selectfont}
			\ifx\enacom@option@type\enacom@type@letter % standard foot
				\renewcommand{\footnotesize}{\fontsize{8pt}{11pt}\selectfont}
			\else
				\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}
			\fi
			\renewcommand{\small}{\fontsize{10pt}{12pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{11pt}{16pt}\selectfont}
			\renewcommand{\large}{\fontsize{12pt}{17pt}\selectfont}
			\renewcommand{\Large}{\fontsize{13pt}{18pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{14pt}{19pt}\selectfont}
			\renewcommand{\huge}{\fontsize{17pt}{23pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{24pt}{32pt}\selectfont}
	
			\ifx\enacom@option@type\enacom@type@article
				\newcommand{\enacom@parskip}{2pt}
			\else	
				\ifx\enacom@option@type\enacom@type@notes
					\newcommand{\enacom@parskip}{2pt}
				\else	
					\newcommand{\enacom@parskip}{8pt}
				\fi
			\fi
		\fi
		
		\ifx\enacom@option@font@size\enacom@font@size@twelve
			\renewcommand{\tiny}{\fontsize{8pt}{10pt}\selectfont}
			\renewcommand{\scriptsize}{\fontsize{9pt}{11pt}\selectfont}
			\ifx\enacom@option@type\enacom@type@letter % standard foot
				\renewcommand{\footnotesize}{\fontsize{8pt}{11pt}\selectfont}
			\else
				\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}
			\fi
			\renewcommand{\small}{\fontsize{11pt}{13pt}\selectfont}
			\renewcommand{\normalsize}{\fontsize{12pt}{17pt}\selectfont}
			\renewcommand{\large}{\fontsize{13pt}{18pt}\selectfont}
			\renewcommand{\Large}{\fontsize{14pt}{19pt}\selectfont}
			\renewcommand{\LARGE}{\fontsize{15pt}{20pt}\selectfont}
			\renewcommand{\huge}{\fontsize{18pt}{24pt}\selectfont}
			\renewcommand{\Huge}{\fontsize{26pt}{33pt}\selectfont}
	
			\ifx\enacom@option@type\enacom@type@article
				\newcommand{\enacom@parskip}{2pt}
			\else	
				\ifx\enacom@option@type\enacom@type@notes
					\newcommand{\enacom@parskip}{2pt}
				\else	
					\newcommand{\enacom@parskip}{10pt}
				\fi
			\fi
		\fi
	\fi
\fi

% paper settings
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else\ifx\enacom@option@type\enacom@type@poster
	\setlength{\paperheight}{1189mm}
	\setlength{\paperwidth}{841mm}
	
	\setlength{\headheight}{0mm}
	\setlength{\headsep}{0mm}
	\setlength{\topmargin}{-1in}
	\setlength{\oddsidemargin}{-1in}
	\setlength{\evensidemargin}{-1in}
	\setlength{\textwidth}{\paperwidth}
	\setlength{\textheight}{\paperheight}
	
	\newcommand{\enacom@topmargin}{20mm}
	\newcommand{\enacom@bottommargin}{20mm}
	\newcommand{\enacom@leftmargin}{20mm}
	\newcommand{\enacom@rightmargin}{20mm}
	
	\addtolength{\textwidth}{-\enacom@leftmargin}
	\addtolength{\textwidth}{-\enacom@rightmargin}
	\addtolength{\textheight}{-\enacom@topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\enacom@bottommargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\topmargin}{\enacom@topmargin}
	\addtolength{\oddsidemargin}{\enacom@leftmargin}
	\addtolength{\evensidemargin}{\enacom@rightmargin}

\else\ifx\enacom@option@type\enacom@type@handout
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	
	\setlength{\headheight}{10mm}
	\setlength{\headsep}{20mm}
	\setlength{\topmargin}{-1in}
	\setlength{\oddsidemargin}{-1in}
	\setlength{\evensidemargin}{-1in}
	\setlength{\textwidth}{\paperwidth}
	\setlength{\textheight}{\paperheight}
	
	\newcommand{\enacom@topmargin}{10mm}
	\newcommand{\enacom@bottommargin}{8mm}
	\newcommand{\enacom@leftmargin}{10mm}
	\newcommand{\enacom@rightmargin}{20mm}
	
	\addtolength{\textwidth}{-\enacom@leftmargin}
	\addtolength{\textwidth}{-\enacom@rightmargin}
	\addtolength{\textheight}{-\enacom@topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\enacom@bottommargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\topmargin}{\enacom@topmargin}
	\addtolength{\oddsidemargin}{\enacom@leftmargin}
	\addtolength{\evensidemargin}{\enacom@rightmargin}
	
	\pagestyle{fancy}
	\fancyhead{}
	\fancyhead[L]{\includegraphics[width=6cm]{enacom}}
	\fancyhead[R]{\ifnum\value{enacom@support@count}>0\begin{minipage}{.4\textwidth}
{\color{enacom@color@blue}\supportname:}\\\enacom@print@support@logo \end{minipage}\fi}
	\fancyfoot{}
	\fancyfoot[C]{{\color{enacom@color@blue} ENACOM$^\text{\textregistered}$ \the\year}}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}

\else
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	
	\setlength{\headheight}{10mm}
	\ifx\enacom@option@type\enacom@type@op
		\setlength{\headsep}{50mm}
	\else
		\setlength{\headsep}{10mm}
	\fi
	\setlength{\topmargin}{-1in}
	\setlength{\oddsidemargin}{-1in}
	\setlength{\evensidemargin}{-1in}
	\setlength{\textwidth}{\paperwidth}
	\setlength{\textheight}{\paperheight}
	
	\newcommand{\enacom@topmargin}{20mm}
	\newcommand{\enacom@bottommargin}{20mm}
	\newcommand{\enacom@leftmargin}{30mm}
	\newcommand{\enacom@rightmargin}{20mm}
	
	\addtolength{\textwidth}{-\enacom@leftmargin}
	\addtolength{\textwidth}{-\enacom@rightmargin}
	\addtolength{\textheight}{-\enacom@topmargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\enacom@bottommargin}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\topmargin}{\enacom@topmargin}
	\addtolength{\oddsidemargin}{\enacom@leftmargin}
	\addtolength{\evensidemargin}{\enacom@rightmargin}
	
	\ifx\enacom@option@type\enacom@type@book
		\pagestyle{headings}
	\else\ifx\enacom@option@type\enacom@type@thesis
		\pagestyle{headings}
	\else\ifx\enacom@option@type\enacom@type@op
		\pagestyle{fancy}
 		\fancyhead{}
 		\fancyhead[L]{
 			\begin{tabular}{|p{4cm}|m{7.3cm}|p{12mm}|p{18mm}|}
 			\multirow{4}{4cm}{\centering{\includegraphics[width=30mm]{enacomv}}} & \multirow{2}{7.3cm}{\centering\MakeUppercase{\enacom@op@operationalprocedure}} & \enacom@op@code & \getcode{\jobname} \rule[-.3cm]{0cm}{1cm} \\\cline{3-4}
 			&  & \enacom@op@review & \enacom@review \rule[-.3cm]{0cm}{1cm} \\\cline{2-4}
 			& \multirow{2}{7.3cm}{\centering\enacom@title} & \enacom@op@process & \enacom@process \rule[-.3cm]{0cm}{1cm} \\\cline{3-4}
 			&  & \enacom@op@page & \thepage~\ofname~\pageref{page.last} \rule[-.3cm]{0cm}{1cm} \\
 			\end{tabular}
 		}
		\fancyfoot{}
		\fancyfoot[L]{
			\begin{tabular}{|p{7.65cm}|p{7.65cm}|}
				\enacom@op@author \ifdefined\enacom@author@namei~\enacom@author@namei~\enacom@author@surnamei\fi & \enacom@op@advisor \ifdefined\enacom@advisor@namei~\enacom@advisor@namei~\enacom@advisor@surnamei\fi \rule[-.35cm]{0cm}{1cm} \\
			\end{tabular}
		}
 		\renewcommand{\headrulewidth}{0pt}
 		\renewcommand{\footrulewidth}{0pt}
 		\setlength{\headheight}{0mm}
 	\else
        %  alter the position of headers: print one sided or print on both sides
 		\pagestyle{fancy}
 		\fancyhead{}
 		\fancyhead[LO]{\enacom@print@logo@left} 
 		%\fancyhead[RE]{\enacom@print@logo@right} 
        \ifx\enacom@option@verbose\enacom@verbose@lean
	    \fancyhead[LE]{\enacom@print@logo@right} 
        \else
        \fancyhead[RE]{\enacom@print@logo@right} 
	    \fi
 		\renewcommand{\headrulewidth}{0pt}
 		\fancyfoot{}
 		\renewcommand{\footrulewidth}{0pt}
 	\fi\fi\fi

	\ifx\enacom@option@verbose\enacom@verbose@lean
		\renewcommand{\cleardoublepage}{\clearpage}
	\fi
\fi\fi\fi

% bibliography
\newcommand{\enacom@nobib}{null}
\newcommand{\enacom@thebibliography}{null}
\providecommand{\bib}[1]{\renewcommand{\enacom@thebibliography}{#1}}
\newcommand{\enacom@print@bibliography}{
	\phantomsection
	\ifx\enacom@option@type\enacom@type@slides
		\bibliography{\enacom@thebibliography}
	\else
		\ifx\enacom@option@type\enacom@type@book
			\addcontentsline{toc}{chapter}{\bibname}
		\else
			\ifx\enacom@option@type\enacom@type@thesis
				\addcontentsline{toc}{chapter}{\bibname}
			\else
				\addcontentsline{toc}{section}{\refname}
			\fi
		\fi
		\bibliographystyle{apalike}
		\bibliography{\enacom@thebibliography}
	\fi
}

% coptyrights
\newcommand{\enacom@printinline@copyright}{%
	$\copyright$ \the\year ~~~%
	\ifx\enacom@option@enacom\enacom@enacom@yes%
		ENACOM%
	\fi%
	\enacom@print@partner%
}

% summary
\ifx\enacom@option@language\enacom@language@portuguese%
	\providecommand{\tocname}{Sumário}
	\providecommand{\lofname}{Lista de Figuras}
	\providecommand{\lotname}{Lista de Tabelas}
\else
	\providecommand{\tocname}{Contents}
	\providecommand{\lofname}{List of Figures}
	\providecommand{\lotname}{List of Tables}
\fi

% algorithm
\ifx\enacom@option@language\enacom@language@portuguese%
	\newcommand{\enacom@algorithm@inputname}{Entrada}
	\newcommand{\enacom@algorithm@outputname}{Saï¿½da}
\else
	\newcommand{\enacom@algorithm@inputname}{Input}
	\newcommand{\enacom@algorithm@outputname}{Output}
\fi
\providecommand{\algorithminput}[1]{
	~\\
	\textbf{\enacom@algorithm@inputname}\\
	\begin{tabularx}{\textwidth}{rl}#1\end{tabularx}
}
\providecommand{\algorithmoutput}[1]{
	~\\
	\textbf{\enacom@algorithm@outputname}\\
	\begin{tabularx}{\textwidth}{rl}#1\end{tabularx}
}
\providecommand{\output}[1]{
	\renewcommand{\enacom@algorithm@output}{#1}
}
\ifx\enacom@option@type\enacom@type@slides
	\renewenvironment{algorithm}{\begin{figure}\begin{flushleft}}{\end{flushleft}\end{figure}}
\fi

% acknowledgements
\newcommand{\enacom@print@acknowledgements}{\relax}
\ifx\enacom@option@language\enacom@language@portuguese%
	\providecommand{\ackname}{Agradecimentos}
	\renewcommand{\enacom@print@acknowledgements}{%
		\ifnum\value{enacom@support@count}>0
			Este trabalho foi desenvolvido com o suporte de \enacom@printinline@support@name{e}.\relax%
		\else
			~\relax
		\fi
	}
\else
	\providecommand{\ackname}{Acknowledgements}
	\renewcommand{\enacom@print@acknowledgements}{%
		\ifnum\value{enacom@support@count}>0
			This work was supported by \enacom@printinline@support@name{and}.\relax%
		\else
			~\relax
		\fi
	}
\fi

% index
\ifx\enacom@option@type\enacom@type@slides
	\relax
\else
	\makeindex
\fi

% sectioning
\providecommand{\defaultframetitle}{\relax}
\ifx\enacom@option@type\enacom@type@slides
	% slide definition
	\let\enacom@frame\frame
	\renewcommand{\frame}{\enacom@frame[containsverbatim]}
	\providecommand{\slide}[1]{\frame{\frametitle\defaultframetitle #1}}
	
	% chapter
	\providecommand{\chapter}[1]{\relax}

	% section redefination for default slide title
	\let\enacom@section\section
	\renewcommand{\section}[1]{
		\enacom@section{#1}
		\renewcommand{\defaultframetitle}{#1}
		\begin{frame}\begin{center}\Huge{#1}\thispagestyle{empty}\end{center}\end{frame}
	}
	\let\enacom@subsection\subsection
	\renewcommand{\subsection}[1]{
		\enacom@subsection{#1}
		\renewcommand{\defaultframetitle}{#1}
	}
	\let\enacom@subsubsection\subsubsection
	\renewcommand{\subsubsection}[1]{
		\enacom@subsubsection{#1}
		\renewcommand{\defaultframetitle}{#1}
	}
\else
	% chapter
	\ifx\enacom@option@type\enacom@type@article
		\providecommand{\chapter}[1]{\relax}
	\fi
	\ifx\enacom@option@type\enacom@type@notes
		\providecommand{\chapter}[1]{\relax}
	\fi
	\ifx\enacom@option@type\enacom@type@report
		\providecommand{\chapter}[1]{\relax}
	\fi
	\ifx\enacom@option@type\enacom@type@poster
		\providecommand{\chapter}[1]{\relax}
	\fi
	
	% presentation commands
	\providecommand{\frametitle}{\relax}
	\newcommand{\slide}{\relax}
	\renewcommand{\frame}{\relax}
	\newenvironment{block}{}{}
	
	% color for headings
	\ifx\enacom@option@color\enacom@color@colorful
		\ifx\enacom@option@type\enacom@type@poster
			\titleformat{\section}{\color{enacom@color@blue}\bfseries\Large}{}{0em}{}
			\titleformat{\subsection}{\color{enacom@color@gray}\bfseries\large}{}{0em}{}
		\else
			\titleformat{\section}{\color{enacom@color@blue}\bfseries\Large}{\thesection}{1em}{}
			\titleformat{\subsection}{\color{enacom@color@gray}\bfseries\large}{\thesubsection}{1em}{}
		\fi
	\fi
\fi

% information
\newcommand{\enacom@info@name}{Engenharia Assistida por Computador Ltda}
\newcommand{\enacom@info@cnpj}{11.075.112/0001-28}
\newcommand{\enacom@info@address}{Rua Professor José Vieira de Mendonça, 770, salas 406 e 407 - 31310-260, Belo Horizonte, MG}
\newcommand{\enacom@info@email}{enacom@enacom.com.br}
\newcommand{\enacom@info@site}{www.enacom.com.br}
\newcommand{\enacom@info@logo}{
	\includegraphics%
	[clip=true,trim=0 {-\enacom@figure@vskip} 0 {-\enacom@figure@vskip}, height=\enacom@figure@height]%
	{enacom}
}
\newcommand{\enacom@info@print}{
	\enacom@info@name, CNPJ: \enacom@info@cnpj\\
	\enacom@info@address\\
	email: \href{\enacom@info@email}{\enacom@info@email} - %
	homepage: \href{\enacom@info@site}{\enacom@info@site}
}

% slides
\ifx\enacom@option@type\enacom@type@slides
	\AtBeginDocument{
		% title page
		\maketitle
		\renewcommand{\maketitle}{ % no more calls to maketitle
			\PackageError{enacom}{maketitle is automatically called by ENACOM's template.}
		}
		
		% summary
		\ifx\enacom@option@summary\enacom@summary@yes
			\enacom@frame[shrink]{
				\frametitle{\contentsname}
				\tableofcontents
			}
		\fi
					
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\enacom@frame[allowframebreaks]{		
				\frametitle{\symbname}
				\renewcommand{\arraystretch}{1.5}
				\enacom@print@symbols
				\renewcommand{\arraystretch}{1}
			}
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\enacom@frame[allowframebreaks]{		
				\frametitle{\abbrname}
				\renewcommand{\arraystretch}{2}
				\enacom@print@abbreviations
				\renewcommand{\arraystretch}{1}
			}
		\fi		
	}

	\AtEndDocument{
			% references
			\ifx\enacom@thebibliography\enacom@nobib
				\relax
			\else
				\enacom@frame[allowframebreaks]{
					\frametitle{\refname}
					\enacom@print@bibliography
				}
			\fi

			% back page
			\ifx\enacom@option@backpage\enacom@backpage@yes
				\begin{frame}
					\thispagestyle{empty}
					\vfill
					\begin{figure}\includegraphics[width=60mm]{enacomfig}\end{figure}
					~\\\vfill
					{\flushright\tiny\enacom@printinline@copyright}
				\end{frame}
			\fi
	}
	
	\renewcommand{\maketitle}{
		\begin{frame}
			\thispagestyle{empty}
			\begin{beamercolorbox}[center,rounded=true,shadow=true]{title}
				\Large{\enacom@title}\\[2mm]
				\small{\enacom@subtitle}
			\end{beamercolorbox}
			\begin{center}%
			\begin{small}%
				\enacom@print@inline@author
				\vspace*{5mm}
				\enacom@print@logo@left
			\end{small}%
			\end{center}%
			\vfill
			\begin{scriptsize}
				\begin{flushleft}
					\ifnum\value{enacom@support@count}>0%
						\textit{\enacom@support@label}:\\%
						\enacom@print@support@logo
					\fi
				\end{flushleft}
			\end{scriptsize}
			\begin{footnotesize}
				\begin{center}\enacom@date \end{center}
			\end{footnotesize}
		\end{frame}
	}
\fi


% book
\ifx\enacom@option@type\enacom@type@book
	\AtBeginDocument{
		% title page
		\setlength{\parskip}{2pt}
		\maketitle
		\renewcommand{\maketitle}{
			\PackageError{enacom}{Make title is automatically called by ENACOM's template.}
		}
			
		% summary
		\setlength{\parskip}{2pt}
		\ifx\enacom@option@summary\enacom@summary@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\tocname}
			\tableofcontents
			\cleardoublepage
		\fi
					
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\enacom@print@symbols
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{2}
			\enacom@print@abbreviations
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
					
		% footer
		\fancyfoot[RO,LE]{\thepage}
		\setlength{\parskip}{\enacom@parskip}
	}

	\AtEndDocument{
		% references
		\ifx\enacom@thebibliography\enacom@nobib
			\cleardoublepage
		\else
			\cleardoublepage
			\enacom@print@bibliography
			\cleardoublepage
		\fi
					
		% index
		\ifx\enacom@option@index\enacom@index@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\indexname}
			\printindex
		\fi
								
		% back page
		\ifx\enacom@option@enacom\enacom@enacom@yes
			\ifx\enacom@option@backpage\enacom@backpage@yes
				\ifx\enacom@option@verbose\enacom@verbose@full
					\cleardoublepage\thispagestyle{empty}
					~\\\vfill
					{\flushright\enacom@printinline@copyright}
				\fi
				\clearpage\thispagestyle{empty}
				\begin{figure}
					\includegraphics[width=100mm]{enacomfig}
				\end{figure}
			\fi
		\fi
	}

	\renewcommand{\maketitle}{
		\begin{titlepage}
			% type, title and subtitle
			\vspace*{10mm}\vfill
			\flushleft\Huge\enacom@title\\[5mm]
			\flushleft\Large\enacom@subtitle\\[40mm]
			
			% author and support
			\flushleft
			\ifnum\value{enacom@author@count}>0
				\begin{minipage}[t]{0.5\textwidth}
					\begin{flushleft}\enacom@print@simple@author \end{flushleft}
				\end{minipage}
			\fi
			
			% publisher
			~\\[100mm]
			\begin{flushright}\includegraphics[height=10mm]{enacom}\end{flushright}

			% copyright page
			\ifx\enacom@option@copyright\enacom@copyright@yes
				\clearpage\thispagestyle{empty}
				~\\\vfill
				\ifnum\value{enacom@support@count}>0
					\begin{flushleft}
						\ifnum\value{enacom@support@count}>0%
							\textit{\enacom@support@label}:\\%
							\enacom@print@support@logo\\[40mm]
						\fi
					\end{flushleft}
				\fi
				\begin{justify}
					\normalsize\enacom@copyrights\\[10mm]
					\enacom@printinline@copyright
				\end{justify}
			\fi
		\end{titlepage}
	}
\fi

% thesis
\ifx\enacom@option@type\enacom@type@thesis
	\AtBeginDocument{
		% title page
		\setlength{\parskip}{2pt}
		\maketitle
		\renewcommand{\maketitle}{
			\PackageError{enacom}{Make title is automatically called by ENACOM's template.}
		}
			
		% acknowledgements
		\setlength{\parskip}{\enacom@parskip}
		\chapter*{\ackname}
		\addcontentsline{toc}{chapter}{\ackname}
		\enacom@acknowledgements
		
		\enacom@print@acknowledgements
		\cleardoublepage

		% abstract
		\ifx\enacom@abstract\enacom@empty
			\relax
		\else
			\chapter*{\abstractname}
			\addcontentsline{toc}{chapter}{\abstractname}
			\enacom@abstract
			\cleardoublepage
		\fi
		
		% summary
		\setlength{\parskip}{2pt}
		\ifx\enacom@option@summary\enacom@summary@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\tocname}
			\tableofcontents
			\cleardoublepage
		\fi
		
		% list of figures
		\ifx\enacom@option@figlist\enacom@figlist@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\lofname}
			\listoffigures 
			\cleardoublepage
		\fi
		
		% list of tables
		\ifx\enacom@option@tablist\enacom@tablist@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\lotname}
			\listoftables 
			\cleardoublepage
		\fi
		
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\enacom@print@symbols
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{2}
			\enacom@print@abbreviations
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
		
		% footer
		\fancyfoot[RO,LE]{\thepage}
		\setlength{\parskip}{\enacom@parskip}
	}

	\AtEndDocument{
		% references
		\ifx\enacom@thebibliography\enacom@nobib
			\cleardoublepage
		\else
			\cleardoublepage
			\enacom@print@bibliography
			\cleardoublepage
		\fi
		
		% index
		\ifx\enacom@option@index\enacom@index@yes
			\phantomsection
			\addcontentsline{toc}{chapter}{\indexname}
			\printindex
		\fi
	}

	\renewcommand{\maketitle}{
		\begin{titlepage}
			% author
			\ifnum\value{enacom@author@count}>0
				\centering\textsc{\large{\enacom@author@namei~\enacom@author@surnamei}}\\[20mm]
			\else
				\vspace*{20mm}
			\fi
			
			% seal
			\ifnum\value{enacom@partner@count}>0
				\centering\includegraphics[height=30mm]{\enacom@partner@logoi}\\[20mm]
			\else
				\vspace*{50mm}
			\fi

			% title and subtitle
			\centering\Huge\enacom@title\\[5mm]
			\centering\Large\enacom@subtitle\\[40mm]
			\vfill

			% advisor
			\ifnum\value{enacom@advisor@count}>0
				\flushleft\textit{\enacom@advisor@label:}\\\enacom@print@advisor~\\[10mm]
			\fi
			\ifnum\value{enacom@advisor@count}>1
				\flushleft\textit{\enacom@coadvisor@label:}\\\enacom@print@coadvisor~\\[10mm]
			\fi

			% local and date
			\centering\large\enacom@local\\[5mm]
			\centering\large\enacom@date
		\end{titlepage}

		% blank page
		\thispagestyle{empty}
	}
\fi

% report
\ifx\enacom@option@type\enacom@type@report
	\AtBeginDocument{
		% title page
		\setlength{\parskip}{2pt}
		\maketitle
		\renewcommand{\maketitle}{
			\PackageError{enacom}{Make title is automatically called by ENACOM's template.}
		}
	
		% update page
		\ifx\enacom@option@update\enacom@update@yes
			\enacom@print@update
			\cleardoublepage
		\fi
			
		% summary
		\ifx\enacom@option@summary\enacom@summary@yes
			\phantomsection
			\addcontentsline{toc}{section}{\tocname}
			\tableofcontents
			\cleardoublepage
		\fi
					
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\enacom@print@symbols
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{2}
			\enacom@print@abbreviations
			\renewcommand{\arraystretch}{1}
			\cleardoublepage
		\fi
		
		% footer
		\fancyfoot[RO,LE]{\thepage}
		\setlength{\parskip}{\enacom@parskip}
	}

	\AtEndDocument{
		% references
		\ifx\enacom@thebibliography\enacom@nobib
			\cleardoublepage
		\else
			\cleardoublepage
			\enacom@print@bibliography
			\cleardoublepage
		\fi
		
		% index
		\ifx\enacom@option@index\enacom@index@yes
			\phantomsection
			\addcontentsline{toc}{section}{\indexname}
			\printindex
		\fi
								
		% back page
		\ifx\enacom@option@enacom\enacom@enacom@yes
			\ifx\enacom@option@backpage\enacom@backpage@yes
				\ifx\enacom@option@verbose\enacom@verbose@full
					\cleardoublepage\thispagestyle{empty}
					~\\\vfill
					{\flushright\enacom@printinline@copyright}
				\fi
				\clearpage\thispagestyle{empty}
				\begin{figure}
					\includegraphics[width=100mm]{enacomfig}
				\end{figure}
			\fi
		\fi
	}

	\renewcommand{\maketitle}{
		\begin{titlepage}
			% type, title and subtitle
			\vspace*{10mm}
			\thispagestyle{fancy}
			\centering\large\enacom@type\\[40mm]
			\centering\huge\enacom@title\\[5mm]
			\centering\Large\enacom@subtitle\\\vfill
			
			% author and support
			\flushleft
			\ifnum\value{enacom@author@count}>0
				\begin{minipage}[t]{0.5\textwidth}
					\begin{flushleft}\enacom@print@simple@author \end{flushleft}
				\end{minipage}
				\begin{minipage}[t]{0.49\textwidth}
					\begin{flushleft}
						\ifnum\value{enacom@support@count}>0%
							\textit{\enacom@support@label}:\\%
							\enacom@print@support@logo 
						\fi
					\end{flushleft}
				\end{minipage}
			\else
				\begin{flushleft}
					\ifnum\value{enacom@support@count}>0%
						\textit{\enacom@support@label}:\\%
						\enacom@print@support@logo 
					\fi
				\end{flushleft}
			\fi
			
			% date
			~\\[10mm]
			\centering\large\enacom@date
		
			% copyright page
			\ifx\enacom@option@copyright\enacom@copyright@yes
				\clearpage\thispagestyle{empty}
				~\\\vfill
				\begin{justify}
					\enacom@print@acknowledgements\\[10mm]
					\normalsize\enacom@copyrights\\[10mm]
					\enacom@printinline@copyright
				\end{justify}
			\fi
		\end{titlepage}
	}
\fi

% letter
\ifx\enacom@option@type\enacom@type@letter
	\AtBeginDocument{
		\begin{flushright}
			% letter id
			\jobname\\[3mm]
			
			% local and date
			\enacom@local, \enacom@date\\[3mm]
		\end{flushright}
		
		\begin{flushleft}
			\vfill

			% reference
			\ifx\enacom@reference\enacom@empty
				\relax
			\else
				\noindent\textbf{Ref.} \enacom@reference\\[5mm]
			\fi

			% reference
			\ifx\enacom@type\enacom@empty
				\relax
			\else
				\noindent\textbf{\subjectname:} \enacom@type\\[5mm]
			\fi
			
			% destine
			\ifx\enacom@destine@name\enacom@empty
				\relax
			\else
				\noindent\enacom@destine@name\\
			\fi
			\ifx\enacom@destine@department\enacom@empty
				\relax
			\else
				\noindent\enacom@destine@department\\
			\fi
			\ifx\enacom@destine@company\enacom@empty
				\relax
			\else
				\noindent\enacom@destine@company\\
			\fi
			\vskip 15mm
			
		\end{flushleft}
		\fancyfoot[CO,CE]{%
			\footnotesize{\enacom@info@print}
		}
	}

	\AtEndDocument{
		\vskip 10mm\enacom@ending
		\enacom@print@commercial@author
		\vfill
	}

	\renewcommand{\maketitle}{
	}
\fi

% article
\ifx\enacom@option@type\enacom@type@article
	\AtBeginDocument{
		% title page
		\setlength{\parskip}{2pt}
		\maketitle
		\renewcommand{\maketitle}{
			\PackageError{enacom}{Make title is automatically called by ENACOM's template.}
		}
			
		% footer
		\fancyfoot[RO,LE]{\thepage}
		\setlength{\parskip}{\enacom@parskip}
		\begin{multicols}{2}
		
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.2}
			\enacom@print@symbols
			\renewcommand{\arraystretch}{1}
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\enacom@print@abbreviations
			\renewcommand{\arraystretch}{1}
		\fi					
	}

	\AtEndDocument{
		\relax
		% acknowledgements
		\ifnum\value{enacom@support@count}>0%
			\section*{\ackname}
			\addcontentsline{toc}{section}{\ackname}
			\enacom@print@acknowledgements
		\fi
	
		% references
		\ifx\enacom@thebibliography\enacom@nobib
			\relax
		\else
			\enacom@print@bibliography
		\fi
		
		% end column
		\end{multicols}
	}

	\renewcommand{\maketitle}{
		\begin{center}
			% title
			\vspace*{5mm}
			{\Huge\enacom@title}\\[5mm]
			
			% author
			{\enacom@print@simple@author}
			
			% abstract
			\ifx\enacom@abstract\enacom@empty
				\relax
			\else
				\vspace{5mm}
				\begin{justify}
					\textbf{\abstractname.} \enacom@abstract
				\end{justify}
			\fi
			\vspace{10mm}
		\end{center}
	}
\fi

% notes
\ifx\enacom@option@type\enacom@type@notes
	\AtBeginDocument{
		% title page
		\setlength{\parskip}{2pt}
		\maketitle
		\renewcommand{\maketitle}{
			\PackageError{enacom}{Make title is automatically called by ENACOM's template.}
		}
			
		% footer
		\fancyfoot[RO,LE]{\thepage}
	
		% symbols
		\ifx\enacom@symbols\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.2}
			\enacom@print@symbols\vspace{5mm}
			\renewcommand{\arraystretch}{1}
		\fi
		
		% abbreviations
		\ifx\enacom@abbreviations\enacom@empty
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\enacom@print@abbreviations\vspace{5mm}
			\renewcommand{\arraystretch}{1}
		\fi					

		\setlength{\parskip}{\enacom@parskip}
	}

	\AtEndDocument{
		% acknowledgements
		\ifnum\value{enacom@support@count}>0%
			\section*{\ackname}
			\addcontentsline{toc}{section}{\ackname}
			\enacom@print@acknowledgements
		\fi
	
		% references
		\ifx\enacom@thebibliography\enacom@nobib
			\relax
		\else
			\enacom@print@bibliography
		\fi
	}

	\renewcommand{\maketitle}{
		\begin{center}
			% title
			\vspace*{5mm}
			{\Huge\enacom@title}\\[5mm]
			
			% author
			{\enacom@print@simple@author}
			
			% abstract
			\ifx\enacom@abstract\enacom@empty
				\relax
			\else
				\vspace{5mm}
				\begin{justify}
					\textbf{\abstractname.} \enacom@abstract
				\end{justify}
			\fi
			\vspace{10mm}
		\end{center}
	}
\fi

% accept
\ifx\enacom@option@type\enacom@type@accept
	\AtBeginDocument{
		% title
		\maketitle
		
		% header
		\fancyhead{}
		\fancyhead[LO,LE]{\enacom@info@logo}
		\fancyhead[RO,RE]{\small{\MakeLowercase{\pagename}~\thepage~\ofname~\pageref{page.last}}}
		
		% paragraph
		\setlength{\parskip}{\enacom@parskip}
		
		% context
		\def\enacom@entity@section{\relax}
		\section*{\MakeUppercase\enacom@type}
		\section{\contextname}
		\renewcommand{\arraystretch}{1.5}
		\begin{tabularx}{\textwidth}{p{2cm}X}
			%\subjectname\dotfill & \enacom@type \\
			\projectname\dotfill & \enacom@title \\
			\productname\dotfill & \enacom@reference \\
			\itemsname\dotfill & \arabic{enacom@product@count} \\
			\ifnum\value{enacom@author@count}>0
				\authorname\dotfill & \enacom@author@namei~\enacom@author@surnamei \\
			\fi
			\ifnum\value{enacom@partner@count}>0
				\ifx\enacom@entity@section\undefined
					\entitiesname\dotfill\vfill & \enacom@print@tabular@partner \\
				\fi
			\fi
		\end{tabularx}
		
		% entity section
		\ifx\enacom@entity@section\undefined
			\relax
		\else
			\subsection{\entitiesname}
			\enacom@print@tabular@partner
		\fi
		
		% products
		\section{\productname}
		\renewcommand{\arraystretch}{1.5}
		\ifx\enacom@singletable\undefined
			% delivered products
			\ifnum\value{enacom@yproduct@count}>0
				\rowbicolor{5}
				\begin{longtable}{p{8mm}p{140mm}}
					\hline\hline
					\MakeLowercase{\itemname} & \MakeLowercase{\descname} \\
					\hline\hline
					\endhead
					\enacom@print@tabular@yproduct
					\hline\hline
					\hiderowcolors
				\end{longtable}
			\fi
		\else
			\rowbicolor{7}
			\begin{longtable}{p{8mm}p{110mm}m{3mm}m{3mm}m{3mm}}
				\hline\hline
				\multirow{2}{*}{\MakeLowercase{\itemname}} & \multirow{2}{*}{\MakeLowercase{\descname}} & \multicolumn{3}{c}{\MakeLowercase{\deliveredname}$^1$} \\
				                      &                            & \yname & \nname & \uname \\
				\hline\hline
				\endhead
				\enacom@print@tabular@product
				\hline\hline
				\hiderowcolors
				\multicolumn{5}{r}{
					\ifx\enacom@option@language\enacom@language@portuguese
						\begin{small}$^1$ \yname~= sim, \nname~= não, \uname~= não aplicável\end{small}
					\else
						\begin{small}$^1$ \yname~= yes, \nname~= no, \uname~= not applicable\end{small}
					\fi
				}
			\end{longtable}
		\fi
	}
	
	\AtEndDocument{
		\ifx\enacom@singletable\undefined
			% undelivered products
			\ifnum\value{enacom@nproduct@count}>0
				\subsection{\nproductname}
				\rowbicolor{5}
				\begin{longtable}{p{8mm}p{140mm}}
					\hline\hline
					\MakeLowercase{\itemname} & \MakeLowercase{\descname} \\
					\hline\hline
					\endhead
					\enacom@print@tabular@nproduct
					\hline\hline
					\hiderowcolors
				\end{longtable}
			\fi
			
			% other products
			\ifnum\value{enacom@uproduct@count}>0
				\subsection{\uproductname}
				\rowbicolor{5}
				\begin{longtable}{p{8mm}p{140mm}}
					\hline\hline
					\MakeLowercase{\itemname} & \MakeLowercase{\descname} \\
					\hline\hline
					\endhead
					\enacom@print@tabular@uproduct
					\hline\hline
					\hiderowcolors
				\end{longtable}
			\fi
		\fi
	
		% form setup
		\begin{Form}
		\def\DefaultHeightofCheckBox{4mm}
		\def\DefaultWidthofCheckBox{4mm}

		% acceptance
		\clearpage
		\section{\acceptname}
		
		% veredict
		\ifx\enacom@veredict\undefined
			\relax
		\else
			\renewcommand{\arraystretch}{1.5}
			\begin{tabularx}{\textwidth}{cX}
			\mbox{\CheckBox[name=accepted,bordercolor=enacom@color@blue,checked=true]{}} & \acceptname@yes \\
			\mbox{\CheckBox[name=partiallyaccepted,bordercolor=enacom@color@blue]{}} & \acceptname@partial \\
			\mbox{\CheckBox[name=notaccepted,bordercolor=enacom@color@blue]{}} & \acceptname@no \\
			\end{tabularx}
			\\[5mm]
		\fi
		
		% comment
		\commentname:\\[2mm]
		\TextField[name=comments,multiline=true,height=50mm,bordercolor=enacom@color@blue,width=\textwidth]{}
		
		% closing
		\enacom@ending
		
		% author
		\enacom@print@commercial@author
		
		% seal
		\def\DefaultWidthofText{78mm}
		\ifnum\value{enacom@support@count}>0
			\newcommand{\enacom@client}{\enacom@support@namei}
		\else
			\newcommand{\enacom@client}{\mbox{\TextField[name=client,bordercolor=enacom@color@white]{}}}
		\fi
		\vskip 10mm
		\renewcommand{\arraystretch}{2}
		\begin{center}
			\begin{tabular}{|lp{8cm}|}
			\multicolumn{2}{|l|}{\acceptname:}\\[10mm]\hline
			\clientname: & \enacom@client\\
			\namename: & \mbox{\TextField[name=name,bordercolor=enacom@color@white]{}} \\
			\datename: & \mbox{\TextField[name=date,bordercolor=enacom@color@white]{}} \\
			\end{tabular}
		\end{center}
		\end{Form}
		
		\phantomsection
		\label{page.last}
	}
	
	\renewcommand{\maketitle}{
		\begin{flushright}
			% reference number and date
			\jobname\\
			\enacom@local, \enacom@date
		\end{flushright}
		
	}
\fi

% HH
\ifx\enacom@option@type\enacom@type@hh
	\AtBeginDocument{
		\enacom@print@hhs
	}
	
	\AtEndDocument{
	}
	
	\renewcommand{\maketitle}{
	}
\fi

% assignment
\ifx\enacom@option@type\enacom@type@assignment
	\AtBeginDocument{
		% header
		\fancyhead{}
		\fancyhead[LO,LE]{\enacom@info@logo}
		\fancyhead[RO,RE]{\small{\MakeLowercase{\pagename}~\thepage~\ofname~\pageref{page.last}}}
		
		% title
		\section*{\enacom@assignment@headersection}
		\begin{tabularx}{\textwidth}{p{3cm}l}
		\localname\dotfill & \enacom@local\\
		\meetingdatename\dotfill & \enacom@date\\
		\projectname\dotfill & \enacom@title\\
		\enacom@print@tabular@update \\		
		\end{tabularx}

		% information
		\section*{\enacom@assignment@infosection}
		\subsection*{\entitiesname}
		\enacom@print@tabular@partner \\
		
		\ifnum\value{enacom@guest@count}>0
			\subsection*{\guestname}
			\begin{tabularx}{\textwidth}{p{4cm}p{3cm}X}
				\enacom@print@tabular@guest
			\end{tabularx}
		\fi
		
		% objective
		\ifx\enacom@abstract\enacom@empty
			\relax
		\else
			\section*{\enacom@assignment@objectivesection}
			\enacom@abstract
		\fi

		% issues
		\section*{\enacom@assignment@issuesection}
		\rowbicolor{5}
		\begin{longtable}{p{10mm}p{115mm}p{20mm}}
			\hline\hline
			\MakeLowercase{\itemname} & \MakeLowercase{\subjectname} & \MakeLowercase{\timeframename} \\
			\hline\hline
			\endhead
			\enacom@print@tabular@issue
			\hline\hline
			\hiderowcolors
		\end{longtable}
	}
	
	\AtEndDocument{
		\phantomsection
		\label{page.last}
	}
	
	\renewcommand{\maketitle}{
	}
\fi

% record
\ifx\enacom@option@type\enacom@type@record
	\AtBeginDocument{
		% header
		\fancyhead{}
		\fancyhead[LO,LE]{\enacom@info@logo}
		\fancyhead[RO,RE]{\small{\MakeLowercase{\pagename}~\thepage~\ofname~\pageref{page.last}}}
		
		% title
		\section*{\enacom@record@headersection}
		\begin{tabularx}{\textwidth}{p{3cm}l}
		\localname\dotfill & \enacom@local\\
		\datename\dotfill & \enacom@date\\
		\projectname\dotfill & \enacom@title\\
		\enacom@print@tabular@update \\		
		\end{tabularx}

		% information
		\section*{\enacom@record@infosection}
		\subsection*{\entitiesname}
		\enacom@print@tabular@partner \\
		
		\ifnum\value{enacom@participant@count}>0
			\subsection*{\participantname}
			\begin{tabularx}{\textwidth}{p{4cm}p{3cm}X}
				\enacom@print@tabular@participant
			\end{tabularx}
		\fi
		
		% objective
		\ifx\enacom@abstract\enacom@empty
			\relax
		\else
			\section*{\enacom@record@objectivesection}
			\enacom@abstract
		\fi

		% matters
		\section*{\enacom@record@mattersection}
		\rowbicolor{5}
		\begin{longtable}{p{10mm}p{115mm}p{20mm}}
			\hline\hline
			\MakeLowercase{\itemname} & \MakeLowercase{\subjectname} & \MakeLowercase{\solutionname} \\
			\hline\hline
			\endhead
			\enacom@print@tabular@matter
			\hline\hline
			\hiderowcolors
		\end{longtable}
							
		% actions
		\section*{\enacom@record@actionsection}
		\rowbicolor{5}
		\begin{longtable}{p{10mm}p{65mm}p{40mm}p{25mm}}
			\hline\hline
			\MakeLowercase{\itemname} & \MakeLowercase{\actionname} & \MakeLowercase{\responsiblename} & \MakeLowercase{\deadlinename} \\
			\hline\hline
			\endhead
			\enacom@print@tabular@action
			\hline\hline
			\hiderowcolors
		\end{longtable}
	}
	
	\AtEndDocument{
		\phantomsection
		\label{page.last}
	}
	
	\renewcommand{\maketitle}{
	}
\fi

% poster
\ifx\enacom@option@type\enacom@type@poster
	\AtBeginDocument{
		\maketitle
		\setlength{\columnsep}{4cm}
		\begin{multicols}{2}
		
		% abstract
		\ifx\enacom@abstract\enacom@empty
			\relax
		\else
			\section{\abstractname}
			\enacom@abstract
		\fi
	}
	
	\AtEndDocument{
		\end{multicols}
	}
	
	\renewcommand{\maketitle}{
		\thispagestyle{empty}
		\begin{tabularx}{\textwidth}{p{10cm}Xp{10cm}}
		\small{\textbf{\developedbyname:}} \newline \enacom@print@logo@left &
		\begin{center}
			\Huge{\enacom@title}\\[20mm]
			\Large{\enacom@print@inline@author}
		\end{center}
		& \small{\textbf{\enacom@support@label:}}\newline \enacom@print@support@logo\\
		\end{tabularx}
	}
\fi

% handout
\ifx\enacom@option@type\enacom@type@handout
	\AtBeginDocument{
		% background image
		\AddToShipoutPicture{
			\put(-3,-13){
				\parbox[b][\paperheight]{\paperwidth}{
					\includegraphics[width=\paperwidth,height=\paperheight]{background}
				}
			}
		}
		
		% title
		\maketitle
		
		% paragraph settings
		\setlength{\parskip}{10pt}
	}
	
	\AtEndDocument{
	}
	
	\renewcommand{\maketitle}{
		\begin{flushleft}
			% title
			\vspace*{5mm}
			{\Huge\enacom@title}\\[15mm]	
		\end{flushleft}
	}
\fi


% operational procedure
\ifx\enacom@option@type\enacom@type@op
	\AtBeginDocument{
		% sections
		\ifdefined\enacom@conditions
			\section{\enacom@op@section@conditions}
			\begin{enumerate}
				\enacom@conditions
			\end{enumerate}
		\fi
		\ifdefined\enacom@activities
			\section{\enacom@op@section@activities}
			\begin{enumerate}
				\enacom@activities
			\end{enumerate}
		\fi
		\ifdefined\enacom@expectations
			\section{\enacom@op@section@expectations}
			\begin{enumerate}
				\enacom@expectations
			\end{enumerate}
		\fi
		\ifdefined\enacom@attachments
			\section{\enacom@op@section@attachments}
			\begin{enumerate}
				\enacom@attachments
			\end{enumerate}
		\fi
		\ifdefined\enacom@changes
			\section{\enacom@op@section@changes}
			\begin{enumerate}
				\enacom@changes
			\end{enumerate}
		\fi
		
		% fix empty body documents
		~
	}

	\AtEndDocument{
		\phantomsection
		\label{page.last}
	}

	\renewcommand{\maketitle}{
	}
\fi