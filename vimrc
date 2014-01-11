" My VIMRC File :
" ---------------
" @AUTHOR : http://guillaumeseren.com
" @LICENSE: www.opensource.org/licenses/bsd-license.php
" ---------------

"============== Custom scripts ===============
"============== Filetype stuff ===============
"============== Script configs ===============
" We can add some modular files like : 
" source ~/.vim/startup/yaml.vim


" Plein de défauts bien pratiques (à garder en début de fichier)
set nocompatible

" 20131206: Passage de Vundle à NeoBundle
""" Required by vundle 
""filetype off
""" vundle set-up :
""set rtp+=~/.vim/bundle/vundle/
""call vundle#rc()
"" ==========================================
"" let Vundle manage Vundle
"" required! 
"Bundle 'gmarik/vundle'
" 20131206: Add NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
"===========================================
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" Neo
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
" https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim.git'
" 
"
NeoBundle 'Shougo/neocomplete'

NeoBundle 'Shougo/neosnippet'
" Ultimate auto-completion system for Vim.
" http://www.vim.org/scripts/script.php?script_id=2620
" https://github.com/Shougo/neocomplcache.vim
NeoBundle 'Shougo/neocomplcache.vim.git'
" Powerful shell implemented by vim.
" https://github.com/Shougo/vimshell.vim
NeoBundle 'Shougo/vimshell.vim.git'
" vimfiler.vim
" Powerful file explorer implemented by Vim script
" https://github.com/Shougo/vimfiler.vim
NeoBundle 'Shougo/vimfiler.vim'
" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
NeoBundle 'tpope/vim-fugitive'
" surround.vim: quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
NeoBundle 'tpope/vim-surround'
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
" https://github.com/tpope/vim-speeddating
NeoBundle 'tpope/vim-speeddating.git'
" key combos for 'pairs' of things. Mostly previous/next type stuff
" https://github.com/tpope/vim-unimpaired
NeoBundle 'tpope/vim-unimpaired'
" rails.vim: Ruby on Rails power tools
" https://github.com/tpope/vim-rails
NeoBundle 'tpope/vim-rails.git'
" vinegar.vim: combine with netrw to create a delicious salad dressing
" https://github.com/tpope/vim-vinegar 
NeoBundle 'tpope/vim-vinegar.git'
" repeat.vim: enable repeating supported plugin maps with "."
" http://www.vim.org/scripts/script.php?script_id=2136
" https://github.com/tpope/vim-repeat
NeoBundle 'https://github.com/tpope/vim-repeat'
" Vim motions on speed!
" https://github.com/Lokaltog/vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'
" Vim plugin that displays tags in a window, ordered by class etc.
" https://github.com/majutsushi/tagbar
NeoBundle 'majutsushi/tagbar'
" BASH IDE -- Write and run BASH-scripts using menus and hotkeys.
" https://github.com/vim-scripts/bash-support.vim
"NeoBundle 'vim-scripts/bash-support.vim'
" On remplace Xdebug par Vdebug apparement plus performant
" http://www.vim.org/scripts/script.php?script_id=4170
" https://github.com/joonty/vdebug
" Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
NeoBundle 'joonty/vdebug.git'
" A simple Vim alignment plugin
" https://github.com/junegunn/vim-easy-align
"NeoBundle 'junegunn/vim-easy-align'
" A fancy start screen for Vim.
" https://github.com/mhinz/vim-startify
"NeoBundle 'mhinz/vim-startify'
" A tree explorer plugin for vim.
" https://github.com/scrooloose/nerdtree
"NeoBundle 'scrooloose/nerdtree'
" Vim plugin for intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
NeoBundle 'scrooloose/nerdcommenter'
" Check a file's syntax when saving a file (php, ruby, tex ...) with vim
" https://github.com/tomtom/checksyntax_vim
"NeoBundle 'tomtom/checksyntax_vim'
" Matrix Screen for VIM
" https://github.com/uguu-org/vim-matrix-screensaver
"NeoBundle 'uguu-org/vim-matrix-screensaver'
" lcd to the root of the project everytime you BufEnter a file inside a project.
" https://github.com/amiorin/vim-project
NeoBundle 'amiorin/vim-project'
" Miscellaneous auto-load Vim scripts required by easytags
" https://github.com/xolox/vim-misc
NeoBundle 'xolox/vim-misc.git'
" Automated tag file generation and syntax highlighting of tags in Vim
" https://github.com/xolox/vim-easytags
"NeoBundle 'xolox/vim-easytags.git'
" Extended session management for Vim (:mksession on steroids)
" https://github.com/xolox/vim-session
NeoBundle 'xolox/vim-session.git'
" lean & mean status/tabline for vim that's light as air
" https://github.com/bling/vim-airline 
NeoBundle 'bling/vim-airline'
" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/kien/ctrlp.vim
NeoBundle 'kien/ctrlp.vim.git'
" cra.vim
" Vim plugin to create yearly timesheet
NeoBundle 'YannMoisan/cra.vim'
" Just for ex of multi repo
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" My personal favorite 'everywhere' theme.
" OLDIES :
" An awesome debugging client for Vim, Xdebug and PHP
" https://github.com/vim-scripts/Xdebug
"Bundle 'joonty/vim-xdebug.git'
"===========================================
NeoBundle 'd11wtq/tomorrow-theme-vim'
" vim-scripts repos
"===========================================
"Bundle 'vcscommand.vim'
NeoBundle 'SuperTab'
NeoBundle 'Zenburn'
NeoBundle 'darkspectrum'
NeoBundle 'php.vim'
NeoBundle 'taglist.vim'
" non github repos
"===========================================
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"===========================================
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ==========================================
 
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" easymotion key:
"let g:EasyMotion_leader_key = ''

" PHP.vim
" HighLight sql
let php_sql_query = 1
" HighLight HTML
let php_htmlInStrings = 1
" to highlight superglobals like $_GET, $_SERVER, etc.
let php_special_vars = 1
" to highlight functions with special behaviour
let php_special_functions = 1
" to highlight comparison operators in an alternate colour
let php_alt_comparisons = 1
" to highlight '=&' in '$foo =& $bar' in an alternate colour
let php_alt_assignByReference = 1
" syntax works out whether -> indicates a property or method
let php_smart_members = 1
" ... use a different color for '->' based on whether it is used
" " for property access, method access, or dynamic access (using
" " '->{...}')
" " * requires php_smart_members
let php_alt_properties = 1
" ... 1: for folding classes and functions
" " 2: for folding all { } regions
" " 3: for folding only functions
" " TODO: documentation for php_folding_manual
let php_folding = 3

" EasyTags setup
"let g:easytags_file = '~/.vim/tags/generic'
" Set tags generic for vim
set tags='~/.vim/tags'
let g:easytags_autorecurse = 1
let g:easytags_dynamic_file = 1
let g:easytags_auto_update = 0

"Vdebug
let g:vdebug_keymap = {
    \    "run" : "<F5>",
    \    "run_to_cursor" : "<F1>",
    \    "step_over" : "<F2>",
    \    "step_into" : "<F3>",
    \    "step_out" : "<F4>",
    \    "close" : "<F6>",
    \    "detach" : "<F7>",
    \    "set_breakpoint" : "<F10>",
    \    "get_context" : "<F11>",
    \    "eval_under_cursor" : "<F12>",
    \    "eval_visual" : "<Leader>e",
    \}

" =======
" COLOR :
" =======
" Coloration syntaxique, indispensable pour ne pas se perdre dans les longs fichiers
syntax on
" Syntax : 
" The colors get messed up when I scroll. Vim uses various heuristics to save
" time when determining the highlighting, and sometimes they cause problems.
" Look up :h syn-sync for a more detailed explanation.
syn sync fromstart


" Détection du type de fichier pour l'indentation
if has("autocmd")
  filetype indent on
endif

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Récupération de la position du curseur entre 2 ouvertures de fichiers
" Parfois ce n'est pas ce qu'on veut ...
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Use UTF-8.
set encoding=utf-8

" Show autocomplete menus.
set wildmenu

" " Show editing mode
set showmode

" " Error bells are displayed visually.
set visualbell

" SI c'est pas déjà fait, affiche la position du curseur
set ruler

" Affiche toujours les diffs en vertical
set diffopt=vertical

" Change le colorsheme en mode diff
if &diff
	    "colorscheme evening
	    "colorscheme darkblue
	    colorscheme blue

	    "colorscheme wombat256mod
endif

" Recherche en minuscule -> indépendante de la casse, une majuscule -> stricte
set smartcase

" Ne jamais respecter la casse (attention totalement indépendant du précédent mais de priorité plus faible)
set ignorecase

" Déplacer le curseur quand on écrit un (){}[] (attention il ne s'agit pas du highlight
"set showmatch

" Affiche le nombre de lignes sélectionnées en mode visuel ou la touche/commande qu'on vient de taper en mode commande
set showcmd

" Déplace le curseur au fur et a mesure qu'on tape une recherche, pas toujours pratique, j'ai abandonné
"set incsearch

" Utilise la souris pour les terminaux qui le peuvent (tous ?)
" pratique si on est habitué à coller sous la souris et pas sous le curseur, attention fonctionnement inhabituel
set mouse=a

" A utiliser en live, paste désactive l'indentation automatique (entre autre) et nopaste le contraire
set nopaste

" Indiquer le nombre de modification lorsqu'il y en a plus de 0 suite à une commande
set report=0

" Met en évidence TOUS les résultats d'une recherche, A consommer avec modération
set hlsearch

" Crée des fichiers ~ un peu partout ...
set backup

:" La ruse de sioux pour ne pas qu'ils soient partout (à vous de faire le mkdir)
" En général n'édite pas 2 fichiers de même noms fréquemment dans des répertoires différents, sinon évitez
" -> voir by eric plus bas

" Laisse les lignes déborder de l'écran si besoin
" set nowrap
" Ne laisse pas les ligne deborder de l'écran
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak
set textwidth=80

" En live pour quand vous écrivez anglais (le fr est à trouver dans les méandres du net)
" Chiant pour programmer, mais améliorable avec des dico 
" perso et par languages
"set spell
" [s / ]s : saute au prochain / précédant mot avec faute.
" z= : affiche la liste de sggestion pour corriger. 
set spelllang=fr


" Spécial développeurs
"
" Indispensable pour ne pas tout casser avec ce qui va suivre
set preserveindent
" indentation automatique
set autoindent
" Largeur de l'autoindentation
set shiftwidth=4
" Arrondit la valeur de l'indentation
set shiftround
" Largeur du caractère tab
set tabstop=4
" Largeur de l'indentation de la touche tab
set softtabstop=4
" Remplace les tab par des expaces
"set expandtab

" by acieroid
" -----------
" Pour highlighter la ligne courante (pour mieux se repérer) en bleu :
set cursorline
" highlight CursorLine ctermbg=white

" Pour activer les numéros de lignes dans la marge :
set number

" by eric
" -----------
" Utilise shiftwidth à la place de tabstop en début de ligne (et backspace supprime d'un coup si ce sont des espaces)
set smarttab

" sauvegarder les fichier ~ dans ~/.vim/backup avec création du répertoire si celui-ci n'existe pas
if filewritable(expand("~/.vim/backup")) == 2
  set backupdir=$HOME/.vim/backup
else
  if has("unix") || has("win32unix")
    call system("mkdir -p $HOME/.vim/backup")
    set backupdir=$HOME/.vim/backup
  endif
endif

" Modif tmp
set swapfile
" Modif tmp
"set dir=~/.vimrc/backup
set directory=~/.vim/backup

" donner des droits d'exécution si le fichier commence par #! et contient /bin/ dans son chemin
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
      silent !chmod a+x <afile>
    endif
  endif
endfunction

au BufWritePost * call ModeChange()

" by anonyme
" -----------
" autoindent n'est spécifique à aucun langage et fonctionne en général moins bien
set noautoindent
" Requis aussi pour vundle
filetype plugin indent on
"filetype indent on

" by gnuk
" -----------
" On peut passer rapidement du mode paste au mode nopaste avec un raccourcis,
" builtin sur les versions récentes de vim >= 7, sinon il faudrait créer une fonction :
set pastetoggle=<F5>

" Toujours laisser des lignes visibles (içi 3) au dessus/en dessous du curseur quand on
" atteint le début ou la fin de l'écran :
set scrolloff=3

" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Format de la barre d'état (tronquée au début, fichier, flags,  :
"set statusline=%<%f%m\ %r\ %h\ %w%=%l,%c\ %p%%

" Permettre l'utilisation de la touche backspace dans tous les cas :
set backspace=2

" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

" Tenter de rester toujours sur la même colonne lors de changements de lignes :
set nostartofline

" Nombre de commandes maximale dans l'historique :
set history=50

" Afficher une liste lors de complétion de commandes/fichiers :
"set wildmode=list:full
"
"@TODO: Code Beautifer to reformat xml
"

" shebang automatique lors de l'ouverture nouveau
" d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
:autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: UTF8 -*-\<nl>\<nl>\"|$

" Shortcuts :
" Permet de sauvegarder par ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>
" Completion avec ctrl + space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Activation de Single compile 
" url : http://www.vim.org/scripts/script.php?script_id=3115
filetype plugin on
" Mapping Custom pour single compile:
" F9 compile 
"nmap <F9> :SCCompile<cr>
" F10 Compile et lance
"nmap <F10> :SCCompileRun<cr> 

" custom status line, see :help 'statusline' for details
" Disabled for airline
"if has("statusline")
"
"	" Highlight the status line
"	highlight StatusLine ctermfg=black ctermbg=green
"
"	set statusline=   " clear the statusline for when vimrc is reloaded
"	set statusline+=%-3.3n\                      " buffer number
"	set statusline+=%f\                          " file name
"	set statusline+=%h%m%r%w                     " flags
"	set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"	set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"	set statusline+=%{&fileformat}]              " file format
"	set statusline+=%=                           " right align
"	set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"	set statusline+=%b,0x%-8B\                   " current char
"	set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "File+path
"set statusline+=%2*\ %y\                                  "FileType
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
"set statusline+=%9*\ col:%03c\                            "Colnr
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
"
"function! HighlightSearch()
"	if &hls
"		return 'H'
"	else
"		return ''
"	endif
"endfunction
"
"hi User1 guifg=#ffdad8  guibg=#880c0e
"hi User2 guifg=#000000  guibg=#F4905C
"hi User3 guifg=#292b00  guibg=#f4f597
"hi User4 guifg=#112605  guibg=#aefe7B
"hi User5 guifg=#051d00  guibg=#7dcc7d
"hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
"hi User8 guifg=#ffffff  guibg=#5b7fbb
"hi User9 guifg=#ffffff  guibg=#810085
"hi User0 guifg=#ffffff  guibg=#094afe
""endif 

