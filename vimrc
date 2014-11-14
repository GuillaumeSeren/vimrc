" My VIMRC File :
" ---------------
" @AUTHOR  : Guillaume Seren
" @WEBSITE : http://guillaumeseren.com
" @LICENSE : www.opensource.org/licenses/bsd-license.php
" @Link    : https://github.com/GuillaumeSeren/vimrc
" ---------------

" Summary {{{ :
" ===========
" Let's try to split this file into several clear part
" 1 - startup
" 2 - keyboard layout
" 3 - screen
"   - text color
"   - encoding
"   - line-wrap
"   -
"   -
" 4 - status bar
" 5 - state bar
" 6 - specific features
"   - session
"   - tags
"   - backup
"   - copy / paste
"   - diff
"   - spell checker
"   - search
"   - mouse
"   - history
"   - shebang
"   - plugins (etc)
"   - shortcut(s)
" }}}

" TODO-LIST {{{:
" ===========
"@TODO: Desactivate arrow.
"@TODO: Add shortcut to follow link, man / class.
" }}}

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" REMAP KEYBOARD for bépo {{{ :
" ==========
" I use kind ofdvorak-fr the «bépo» layout on my keyboard.
source ~/.vim/vimrc.bepo
" remap number for direct access
source ~/.vim/vimrc.num
" }}}

" Startup config {{{ :
" ===========
" We can export some config in modular files like :
" source ~/.vim/startup/yaml.vim
" Change the default mode of vim.
" @TODO: really need ?
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" }}}

" NeoBundle conf {{{ :
" ==========
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

" Check if bundle dir is available for new install
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif


" 20131206: Add NeoBundle
"set runtimepath+=~/.vim/bundle/neobundle.vim/
"call neobundle#rc(expand('~/.vim/bundle/'))
" 13-10-2014: NeoBundle change call to begin
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"=============================================
" }}}

" NeoBundle list {{{ :
"============== VimProc :     ================
" Recommended to install
" original repos on github
" After install, turn shell ~/.vim/bundle/vimproc,
" (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
            \ 'build'       : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin'  : 'make -f make_cygwin.mak',
            \     'mac'     : 'make -f make_mac.mak',
            \     'unix'    : 'make -f make_unix.mak',
            \    },
            \ }
"============== Unite :       ================
" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
" https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim.git'
"============== NeoComplete :     ================
" @TODO: Complete infos
NeoBundle 'Shougo/neocomplete'
"============== NeoSnippet :     ================
" @TODO: Complete infos
NeoBundle 'Shougo/neosnippet'
"============== NeoSnippet-snippets ==========
" Snippet for neosnippet
NeoBundle 'Shougo/neosnippet-snippets'
"=============================================
"============== Unite Plugin : OUTLINE =========
" https://github.com/h1mesuke/unite-outline
" outline source for unite.vim
" http://d.hatena.ne.jp/h1mesuke/20101107/p1
" Call it with :unite outline
NeoBundle 'h1mesuke/unite-outline'
"===============================================
" https://github.com/ujihisa/unite-colorscheme
" A unite.vim plugin
NeoBundle 'ujihisa/unite-colorscheme'
"============== SYNTASTIC  : ===============
" Syntax checking hacks for vim
" https://github.com/scrooloose/syntastic
NeoBundle 'scrooloose/syntastic.git'
"============== DBEXT :       ==============
" vim-scripts/dbext.vim
" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL,
" DBI,..)
" http://www.vim.org/scripts/script.php?script_id=356
" https://github.com/vim-scripts/dbext.vim
" help : ':h dbext-tutorial'
NeoBundle 'vim-scripts/dbext.vim'
"============== GUNDO :       ==============
" Gundo.vim is Vim plugin to visualize your Vim undo tree.
" sjl / gundo.vim
" A git mirror of gundo.vim
" http://sjl.bitbucket.org/gundo.vim/
NeoBundle 'sjl/gundo.vim.git'
"===========================================
" Extended search commands and maps for Vim
" https://github.com/dahu/SearchParty
"NeoBundle 'dahu/SearchParty'
"============== SHABERU : ==================
" supermomonga/shaberu.vim
" めっちゃしゃべる
" https://github.com/supermomonga/shaberu.vim
" Shaberu.vim is the wrapper of speech synethis. You can make your vim speak
" easily with Shaberu.vim.
NeoBundle 'supermomonga/shaberu.vim'
"=============== VIM WIKI :    ==============
" Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
NeoBundle 'vimwiki/vimwiki'
" Key bindings
" see :h vimwiki-mappings
"
" normal mode:
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Folow/Create wiki link
" <Shift-Enter> -- Split and folow/create wiki link
" <Ctrl-Enter> -- Vertical split and folow/create wiki link
" <Backspace> -- Go back to parent(previous) wiki link
" <Tab> -- Find next wiki link
" <Shift-Tab> -- Find previous wiki link
"===========================================
"=============== TABULAR : =================
" https://github.com/godlygeek/tabular
" Vim script for text filtering and alignment
" one  : 1
" two  : 2
" tree : 3
" select text in visual mode, then hit : Tabularize /:
" change the : with the needed char to align
NeoBundle 'godlygeek/tabular'
"===========================================
"============= YouCompleteMe : ================
"A code-completion engine for Vim
"http://valloric.github.io/YouCompleteMe/
"https://github.com/Valloric/YouCompleteMe
"NeoBundle 'Valloric/YouCompleteMe'
"============== VimShell :     ================
" Powerful shell implemented by vim.
" https://github.com/Shougo/vimshell.vim
NeoBundle 'Shougo/vimshell.vim.git'
"============== VimFiler :     ================
" vimfiler.vim
" Powerful file explorer implemented by Vim script
" https://github.com/Shougo/vimfiler.vim
NeoBundle 'Shougo/vimfiler.vim'
"============== Fugitive :     ================
" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
NeoBundle 'tpope/vim-fugitive'
"============== Surround :     ================
" surround.vim: quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
NeoBundle 'tpope/vim-surround'
"============== SpeedDating :     ================
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
" https://github.com/tpope/vim-speeddating
NeoBundle 'tpope/vim-speeddating.git'
"============== UniPaired :     ================
" key combos for 'pairs' of things. Mostly previous/next type stuff
" https://github.com/tpope/vim-unimpaired
NeoBundle 'tpope/vim-unimpaired'
"============== Rails :     ================
" rails.vim: Ruby on Rails power tools
" https://github.com/tpope/vim-rails
NeoBundle 'tpope/vim-rails.git'
"============== Vinegar :     ================
" vinegar.vim: combine with netrw to create a delicious salad dressing
" https://github.com/tpope/vim-vinegar
NeoBundle 'tpope/vim-vinegar.git'
"============== Repeat :     ================
" repeat.vim: enable repeating supported plugin maps with "."
" http://www.vim.org/scripts/script.php?script_id=2136
" https://github.com/tpope/vim-repeat
NeoBundle 'tpope/vim-repeat'
"============== RagTag :      ================
" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
" http://www.vim.org/scripts/script.php?script_id=1896
" https://github.com/tpope/vim-ragtag
NeoBundle 'tpope/vim-ragtag'
" CTRL+X /       Close the last open HTML tag
" CTRL+X SPACE   Create open/close HTML tags from the typed word
" CTRL+X CR      The same as CTRL+X SPACE but puts a newspace in between
" CTRL+X !       Insert HTML doctype
" CTRL+X @       Insert CSS stylesheet
" CTRL+X #       Insert meta content-type meta tag
" CTRL+X $       Load JavaScript document
"
" For the following mappings, suppose that
" you have typed "foo".
"
" Mapping        Result
" ---------      -----------
" CTRL+X =       foo<%= | %>
" CTRL+X +       <%= foo| %>
" CTRL+X -       foo<% | %>
" CTRL+X _       <% foo| %>
" CTRL+X '       foo<%# | %>
" CTRL+X "       <%# foo| %>
"============== vim-eunuch : ====================
" tpope/vim-eunuch
" eunuch.vim: helpers for UNIX
" http://www.vim.org/scripts/script.php?script_id=4300
" https://github.com/tpope/vim-eunuch
NeoBundle 'tpope/vim-eunuch'
"============== vim-gitgutter : ====================
" airblade/vim-gitgutter
" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
NeoBundle 'airblade/vim-gitgutter'

"============== sparkup : =======================
" A parser for a condensed HTML format
" Deprecated: car requiert Python
" https://github.com/rstacruz/sparkup
" NeoBundle 'rstacruz/sparkup'
"============== EasyMotion :     ================
" Vim motions on speed!
" https://github.com/Lokaltog/vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'
"============== Stupid-EasyMotion :     ================
" A dumbed down version of EasyMotion
" that aids navigation on the current line
" We use the global leader
" <Leader><Leader>w  - make every word a target
" <Leader><Leader>W  - make every space separated word a target
" <Leader><Leader>fx - make every character x in the line a target
NeoBundle 'joequery/Stupid-EasyMotion'
"=======================================================
"============== ACK.VIM ================================
" https://github.com/mileszs/ack.vim
" Vim plugin for the Perl module / CLI script 'ack'
NeoBundle 'mileszs/ack.vim'
"========================================================
"============== AG.VIM ================================
" https://github.com/rking/ag.vim
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
NeoBundle 'rking/ag.vim'
"========================================================
" https://github.com/fabi1cazenave/suckless.vim
" This plugin emulates the excellent wmii <http://wmii.suckless.org/> window
" manager in Vim.
NeoBundle 'fabi1cazenave/suckless.vim'
"============== TagBar :     ================
" Vim plugin that displays tags in a window, ordered by class etc.
" https://github.com/majutsushi/tagbar
NeoBundle 'majutsushi/tagbar'
"============== BashSupport :     ================
" BASH IDE -- Write and run BASH-scripts using menus and hotkeys.
" https://github.com/vim-scripts/bash-support.vim
"NeoBundle 'vim-scripts/bash-support.vim'
"============== vDebug :     ================
" On remplace Xdebug par Vdebug apparement plus performant
" http://www.vim.org/scripts/script.php?script_id=4170
" https://github.com/joonty/vdebug
" Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
NeoBundle 'joonty/vdebug.git'
"============== EasyAlign :     ================
" A simple Vim alignment plugin
" https://github.com/junegunn/vim-easy-align
"NeoBundle 'junegunn/vim-easy-align'
"============== Startify :     ================
" A fancy start screen for Vim.
" https://github.com/mhinz/vim-startify
"NeoBundle 'mhinz/vim-startify'
"============== NerdTree :     ================
" A tree explorer plugin for vim.
" https://github.com/scrooloose/nerdtree
"NeoBundle 'scrooloose/nerdtree'
"============== NerdCommenter :     ================
" Vim plugin for intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
NeoBundle 'scrooloose/nerdcommenter'
"============== ChekSyntax :     ================
" Check a file's syntax when saving a file (php, ruby, tex ...) with vim
" https://github.com/tomtom/checksyntax_vim
"NeoBundle 'tomtom/checksyntax_vim'
"============== Matrix Screensaver :     ================
" Matrix Screen for VIM
" https://github.com/uguu-org/vim-matrix-screensaver
NeoBundle 'uguu-org/vim-matrix-screensaver'
"============== SearchParty : ================
" dahu/SearchParty
" Extended search commands and maps for Vim
" https://github.com/dahu/SearchParty
NeoBundle 'dahu/SearchParty'
" Remap * to #
nmap * <Plug>SearchPartyVisualFindNext
" SearchParty
"
" Enhanced searches, highlights and matches for Vim
" Tip
" If you like SearchParty and want to share the W00t!, I’m grateful for tips
" or beverages.
" Visual Searches
"
" * Searches for the next occurrence of the currently selected visual
"   text. <Plug>SearchPartyVisualFindNext
"
" # Searches for the prior occurrence of the currently selected visual
"   text. <Plug>SearchPartyVisualFindPrior
"
" & Starts a :substitute using the currently selected visual text.
"   <Plug>SearchPartyVisualFindSubstitute
"=============================================
"============== vim-github-dashboard : =======
" junegunn/vim-github-dashboard
" Browse GitHub events in Vim
" Browse GitHub events (user dashboard, user/repo activity) in Vim.
NeoBundle 'junegunn/vim-github-dashboard'
" Commands
" With authentication
"
" :GHDashboard
" :GHDashboard USER
" :GHActivity
" :GHActivity USER
" :GHActivity USER/REPO
" Without authentication (60 calls/hour limit, only public
" activities)
"
" :GHDashboard! USER
" :GHActivity! USER
" :GHActivity! USER/REPO
"
" Navigation
"
" Use Tab and Shift-Tab to navigate back and
" forth through the links.
"
" Press Enter key or double-click on a link to
" open it in the browser.
"
" Press R to refresh the window.
"
" Press q to close the window.
"=============================================
"============== Project :     ================
" lcd to the root of the project everytime you BufEnter a file inside a project.
" https://github.com/amiorin/vim-project
NeoBundle 'amiorin/vim-project'
"============== VimMisc :     ================
" Miscellaneous auto-load Vim scripts required by easytags
" https://github.com/xolox/vim-misc
NeoBundle 'xolox/vim-misc.git'
"============== BlockIt :     ================
" sk1418 / blockit
" a vim plugin to wrap lines in a block
" https://github.com/sk1418/blockit
NeoBundle 'sk1418/blockit.git'
"============== HowMuch :     ================
" sk1418 / HowMuch
" A Vim plugin to calculate visual selected expressions
" https://github.com/sk1418/HowMuch
NeoBundle 'sk1418/HowMuch.git'
"============== EasyTags :     ================
" Automated tag file generation and syntax highlighting of tags in Vim
" https://github.com/xolox/vim-easytags
"@FIXME: Fix the generation process :
" - Provide a command to generate a tag in a project.
" - Use specific tag file by project.
" - Load / Reload only tag file selected by the pwd value project name ?
" - In theory the base tag file should be provided by a call from the VCS.
" -
"NeoBundle 'xolox/vim-easytags.git'
"@TODO: Fix easytags call to be lighter
" EasyTags setup
"let g:easytags_file = '~/.vim/tags/generic'
" Set tags generic for vim
"set tags='~/.vim/tags/'
"let g:easytags_autorecurse = 1
"let g:easytags_include_members = 1
"let g:easytags_dynamic_file = 2
" Refresh Tags on write file
"let g:easytags_events = ['BufWritePost']
" Updtate highlight
"let g:easytags_auto_update = 0
"@TODO: Add async call to avoid freezing vim.
"let g:eastags_async = 1
"============== VimSession :     ================
" Extended session management for Vim (:mksession on steroids)
" https://github.com/xolox/vim-session
NeoBundle 'xolox/vim-session.git'
"============== VimAirline :     ================
" lean & mean status/tabline for vim that's light as air
" https://github.com/bling/vim-airline
NeoBundle 'bling/vim-airline'
"============== CtrlP :     ================
" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/kien/ctrlp.vim
"NeoBundle 'kien/ctrlp.vim.git'
"============== CRA :     ================
" cra.vim
" Vim plugin to create yearly timesheet
NeoBundle 'YannMoisan/cra.vim'
"=========================================
"============== OLD / DEMO ========
" Demo :
" Just for ex of multi repo
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Old :
" An awesome debugging client for Vim, Xdebug and PHP
" https://github.com/vim-scripts/Xdebug
" NeoComplCache : depercated
" Ultimate auto-completion system for Vim.
" http://www.vim.org/scripts/script.php?script_id=2620
" https://github.com/Shougo/neocomplcache.vim
" NeoBundle 'Shougo/neocomplcache.vim.git'
" Deprecated : If you use Vim 7.3.885 or above with if_lua feature, you should
" use neocomplete. It is faster than neocomplcache.
"===========================================
"============== VimProc :     ================
" @TODO: Complete infos
NeoBundle 'd11wtq/tomorrow-theme-vim'
" vim-scripts repos
"===========================================

"=============== CALENDAR : ================
" A calendar application for Vim
" https://github.com/itchyny/calendar.vim
NeoBundle 'itchyny/calendar.vim'
"===========================================
"============== COLOR :       ==============
" Colour schemes for a variety of editors created by Dayle Rees.
" http://daylerees.github.io
"NeoBundle 'daylerees/colour-schemes', { "rtp": "vim-themes/" }
"===========================================
" quick setup : http://sjl.bitbucket.org/gundo.vim/#installation
"let g:gundo_width = 60
"let g:gundo_preview_height = 40
"let g:gundo_right = 1
"nnoremap <F5> :GundoToggle<CR>
"===========================================

"============== VCSCOMMAND:     ================
" @TODO: Complete infos
NeoBundle 'vcscommand.vim'
"============== VimProc :     ================
" @TODO: Complete infos
"NeoBundle 'SuperTab'

"============== ColorSheme :  =============
" vim-colors-solarized
" precision colorscheme for the vim text editor
" http://ethanschoonover.com/solarized
" https://github.com/altercation/vim-colors-solarized
NeoBundle 'altercation/vim-colors-solarized.git'
" morhetz / gruvbox :
" Retro groove color scheme for Vim
" https://github.com/morhetz/gruvbox
NeoBundle 'morhetz/gruvbox.git'
" zeis / vim-kolor
" Vim color scheme.
" https://github.com/zeis/vim-kolor
NeoBundle 'zeis/vim-kolor.git'
" junegunn / seoul256.vim
" a low-contrast Vim color scheme based on Seoul Colors
NeoBundle 'junegunn/seoul256.vim.git'
" Moria :
" A color scheme for GUI supposed to be highly readable
" http://www.vim.org/scripts/script.php?script_id=1464
NeoBundle 'vim-scripts/moria'
" Bad Wolf
" A Vim color scheme.
" https://github.com/sjl/badwolf/
NeoBundle 'sjl/badwolf'
"============== Molokai :     ================
" tomasr/molokai
" Molokai color scheme for Vim
" https://github.com/tomasr/molokai
NeoBundle 'tomasr/molokai'
"============== VimProc :     ================
" @TODO: Complete infos
NeoBundle 'Zenburn'
"============== Vividchalk :     ================
" vividchalk.vim:
" a colorscheme strangely reminiscent of Vibrant Ink for a
" certain OS X editor
" https://github.com/tpope/vim-vividchalk
" http://www.vim.org/scripts/script.php?script_id=1891
NeoBundle 'tpope/vim-vividchalk.git'
"============== VimProc :     ===============
" @TODO: Complete infos
NeoBundle 'darkspectrum'
"============== ROGUE.VIM     ===============
" katono/rogue.vim
" Porting of Rogue-clone II for Vim
NeoBundle 'katono/rogue.vim'
"============== Characterize  ===============
" tpope/vim-characterize
" characterize.vim:
" Unicode character metadata

" http://www.vim.org/scripts/script.php?script_id=4410
NeoBundle 'tpope/vim-characterize'
"============== PHP :     ================
" @TODO: Complete infos
"NeoBundle 'php.vim'
" 20141028: Change to new StanAngeloff
" https://github.com/StanAngeloff/php.vim
NeoBundle 'StanAngeloff/php.vim'
"============== Better PHP indent: =======
" The official VIm indent script for PHP
" http://www.2072productions.com/to/phpindent.txt
" https://github.com/2072/PHP-Indenting-for-VIm
NeoBundle '2072/PHP-Indenting-for-VIm'
"============== Twig plugin : ============
" evidens/vim-twig
" Twig syntax highlighting, snipMate, etc.
" https://github.com/evidens/vim-twig
NeoBundle 'evidens/vim-twig'
"============== Twig Indent : ================
" Vim script for indentation of html twig file.
" https://github.com/tokutake/twig-indent
"NeoBundle 'tokutake/twig-indent'
"============== TagList :     ================
" @TODO: Complete infos
NeoBundle 'taglist.vim'
"============== CSS color :   ================
" Highlight colors in css files
" NeoBundle 'skammer/vim-css-color'
" NOT WORKING
"Highlight colors in css files
" http://ap.github.io/vim-css-color/
"NeoBundle 'ap/vim-css-color'
"=============== CSS VIM : ====================
" css.vim
" Cutting-edge vim css syntax file
" http://www.vim.org
"NeoBundle "JulesWang/css.vim"
"=============================================
"============== Bundle old samples ===========
" non github repos:
"============== CommandT :     ================
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"==============  :     ================
"Bundle 'file:///Users/gmarik/path/to/plugin'

call neobundle#end()
 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" }}}

" NeoBundle list {{{ :
"============== VimProc :     ================
" Recommended to install
" original repos on github
" After install, turn shell ~/.vim/bundle/vimproc,
" (n,g)make -f your_machines_makefile
"=============================================
"============== Unite :       ================
" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
" https://github.com/Shougo/unite.vim
" interresting :
" http://www.reddit.com/r/vim/comments/1fpti5/unitevim_the_plugin_you_didnt_know_you_need/
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" nnoremap <C-p> :Unite file_rec/async<cr>
" Unite grep
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
" Unite history / Yank
nnoremap <space>y :Unite history/yank<cr>
" Unite in buffer
nnoremap <space>s :Unite -quick-match buffer<cr>
" Show mapping
nnoremap <space>m :Unite mapping<cr>
" Show Syntastic error
nnoremap <space>x :Error<cr>

" Format th e unite output to better
" http://eblundell.com/thoughts/2013/08/15/Vim-CtrlP-behaviour-with-Unite.html
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
" Custom source :
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ ], '\|'))
" Default filters :
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" Emulate ctrl-p behavior quite general unite (all type)
nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
" Keep actions shortcut in distinct function: s:unite_settings()
autocmd FileType unite call s:unite_settings()
" Function unite_settings()
" add distinct action to be used in a unite buffer
function! s:unite_settings()
    " To keep ?
    " seem's to overide supertab to not be used in unite,
    " not sure to want it.
    let b:SuperTabDisabled=1
    " original up j / down k
    " ctrl+t : Move down in the list
    imap <buffer> <C-t>   <Plug>(unite_select_next_line)
    " ctrl+s : Move up in the list
    imap <buffer> <C-s>   <Plug>(unite_select_previous_line)
    " ctrl+x : Open file in a new split
    imap <silent><buffer><expr> <C-x> unite#do_action('split')
    " ctrl+v : Open file in a new vertical split
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    " ctrl+t : Open file in a new tab
    imap <silent><buffer><expr> <C-g> unite#do_action('tabopen')
    " Quit on escape
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
"=============================================
"============== NeoComplete :     ================
" @TODO: Complete infos
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"@todo: find new dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default'  : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme'   : $HOME.'/.gosh_completions'
            \ }
let g:neocomplcache_disabled_sources_list = {'_' : ['dictionary_complete']}
" Define keyword.
" je fais esprét de me trompait

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"============== NeoSnippet :     ================
" @TODO: Complete infos
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"d============== Unite Plugin : OUTLINE =========
" https://github.com/h1mesuke/unite-outline
" outline source for unite.vim
" http://d.hatena.ne.jp/h1mesuke/20101107/p1
" Call it with :unite outline
"===============================================
" https://github.com/ujihisa/unite-colorscheme
" A unite.vim plugin
"============== SYNTASTIC  : ===============
" Syntax checking hacks for vim
" https://github.com/scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers             = ['php', 'phpcs', 'phpmd']
"let g:syntastic_phpcs_conf               = '--standard=PSR2'
" from : https://github.com/scrooloose/syntastic/wiki/PHP%3A---phpcs
"let g:syntastic_php_phpcs_args='--tab-width=0'
"set tabstop=8
"let g:syntastic_php_phpcs_args=" --standard=PSR2 "
let g:syntastic_php_phpcs_args="--encoding=utf-8 --tab-width=4 --standard=PSR2"
"let g:syntastic_php_phpcs_args="--encoding=utf-8 --tab-width=4 --standard=/home/gseren/src/pro/bd/git_tool_gseren/hooks/bd_standart.xml"
"let g:syntastic_php_phpcs_args="--encoding=utf-8 --tab-width=4 --standard=PEAR"
"let g:syntastic_phpcs_conf='--standard=Drupal --extensions=php,module,inc,install,test,profile,theme'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_aggregate_errors         = 1
"
"function! PhpSyntaxOverride()
"  hi! def link phpDocTags  phpDefine
"  hi! def link phpDocParam phpType
"endfunction
"
"augroup phpSyntaxOverride
"  autocmd!
"  autocmd FileType php call PhpSyntaxOverride()
"augroup END
"
"===========================================
"============== DBEXT :       ==============
" vim-scripts/dbext.vim
" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL,
" DBI,..)
" http://www.vim.org/scripts/script.php?script_id=356
" https://github.com/vim-scripts/dbext.vim
" help : ':h dbext-tutorial'
" Default database (local)
" MySQL
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd='':dbname=mysql'
"===========================================
"============== GUNDO :       ==============
" Gundo.vim is Vim plugin to visualize your Vim undo tree.
" sjl / gundo.vim
" A git mirror of gundo.vim
" http://sjl.bitbucket.org/gundo.vim/
"===========================================
" Extended search commands and maps for Vim
" https://github.com/dahu/SearchParty
"============== SHABERU : ==================
" supermomonga/shaberu.vim
" めっちゃしゃべる
" https://github.com/supermomonga/shaberu.vim
" Shaberu.vim is the wrapper of speech synethis. You can make your vim speak
" easily with Shaberu.vim.
"=============== VIM WIKI :    ==============
" Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
" Key bindings
" see :h vimwiki-mappings
"
" normal mode:
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Folow/Create wiki link
" <Shift-Enter> -- Split and folow/create wiki link
" <Ctrl-Enter> -- Vertical split and folow/create wiki link
" <Backspace> -- Go back to parent(previous) wiki link
" <Tab> -- Find next wiki link
" <Shift-Tab> -- Find previous wiki link
"===========================================
"=============== TABULAR : =================
" https://github.com/godlygeek/tabular
" Vim script for text filtering and alignment
" one  : 1
" two  : 2
" tree : 3
" select text in visual mode, then hit : Tabularize /:
" change the : with the needed char to align
"===========================================
"============= YouCompleteMe : ================
"A code-completion engine for Vim
"http://valloric.github.io/YouCompleteMe/
"https://github.com/Valloric/YouCompleteMe
"============== VimShell :     ================
" Powerful shell implemented by vim.
" https://github.com/Shougo/vimshell.vim
"============== VimFiler :     ================
" vimfiler.vim
" Powerful file explorer implemented by Vim script
" https://github.com/Shougo/vimfiler.vim
"============== Fugitive :     ================
" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
"============== Surround :     ================
" surround.vim: quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
"============== SpeedDating :     ================
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
" https://github.com/tpope/vim-speeddating
"============== UniPaired :     ================
" key combos for 'pairs' of things. Mostly previous/next type stuff
" https://github.com/tpope/vim-unimpaired
"============== Rails :     ================
" rails.vim: Ruby on Rails power tools
" https://github.com/tpope/vim-rails
"============== Vinegar :     ================
" vinegar.vim: combine with netrw to create a delicious salad dressing
" https://github.com/tpope/vim-vinegar
"============== Repeat :     ================
" repeat.vim: enable repeating supported plugin maps with "."
" http://www.vim.org/scripts/script.php?script_id=2136
" https://github.com/tpope/vim-repeat
"============== RagTag :      ================
" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
" http://www.vim.org/scripts/script.php?script_id=1896
" https://github.com/tpope/vim-ragtag
" CTRL+X /       Close the last open HTML tag
" CTRL+X SPACE   Create open/close HTML tags from the typed word
" CTRL+X CR      The same as CTRL+X SPACE but puts a newspace in between
" CTRL+X !       Insert HTML doctype
" CTRL+X @       Insert CSS stylesheet
" CTRL+X #       Insert meta content-type meta tag
" CTRL+X $       Load JavaScript document
"
" For the following mappings, suppose that
" you have typed "foo".
"
" Mapping        Result
" ---------      -----------
" CTRL+X =       foo<%= | %>
" CTRL+X +       <%= foo| %>
" CTRL+X -       foo<% | %>
" CTRL+X _       <% foo| %>
" CTRL+X '       foo<%# | %>
" CTRL+X "       <%# foo| %>
"============== vim-eunuch : ====================
" tpope/vim-eunuch
" eunuch.vim: helpers for UNIX
" http://www.vim.org/scripts/script.php?script_id=4300
" https://github.com/tpope/vim-eunuch

"============== sparkup : =======================
" A parser for a condensed HTML format
" Deprecated: car requiert Python
" https://github.com/rstacruz/sparkup
" NeoBundle 'rstacruz/sparkup'
"============== EasyMotion :     ================
" Vim motions on speed!
" https://github.com/Lokaltog/vim-easymotion
" easymotion key:
let g:EasyMotion_leader_key = '\'
"============== Stupid-EasyMotion :     ================
" A dumbed down version of EasyMotion
" that aids navigation on the current line
" We use the global leader
" <Leader><Leader>w  - make every word a target
" <Leader><Leader>W  - make every space separated word a target
" <Leader><Leader>fx - make every character x in the line a target
"=======================================================
"============== ACK.VIM ================================
" https://github.com/mileszs/ack.vim
" Vim plugin for the Perl module / CLI script 'ack'
"========================================================
"============== AG.VIM ================================
" https://github.com/rking/ag.vim
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
"========================================================
" https://github.com/fabi1cazenave/suckless.vim
" This plugin emulates the excellent wmii <http://wmii.suckless.org/> window
" manager in Vim.
"============== TagBar :     ================
" Vim plugin that displays tags in a window, ordered by class etc.
" https://github.com/majutsushi/tagbar
"============== BashSupport :     ================
" BASH IDE -- Write and run BASH-scripts using menus and hotkeys.
" https://github.com/vim-scripts/bash-support.vim
"NeoBundle 'vim-scripts/bash-support.vim'
"============== vDebug :     ================
" On remplace Xdebug par Vdebug apparement plus performant
" http://www.vim.org/scripts/script.php?script_id=4170
" https://github.com/joonty/vdebug
" Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
"Vdebug tweak
let g:vdebug_keymap = {
            \    "run"               : "<F5>",
            \    "run_to_cursor"     : "<F1>",
            \    "step_over"         : "<F2>",
            \    "step_into"         : "<F3>",
            \    "step_out"          : "<F4>",
            \    "close"             : "<F6>",
            \    "detach"            : "<F7>",
            \    "set_breakpoint"    : "<F10>",
            \    "get_context"       : "<F11>",
            \    "eval_under_cursor" : "<F12>",
            \    "eval_visual"       : "<Leader>e",
            \}

"============== EasyAlign :     ================
" A simple Vim alignment plugin
" https://github.com/junegunn/vim-easy-align
"NeoBundle 'junegunn/vim-easy-align'
"============== Startify :     ================
" A fancy start screen for Vim.
" https://github.com/mhinz/vim-startify
"NeoBundle 'mhinz/vim-startify'
"============== NerdTree :     ================
" A tree explorer plugin for vim.
" https://github.com/scrooloose/nerdtree
"NeoBundle 'scrooloose/nerdtree'
"============== NerdCommenter :     ================
" Vim plugin for intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
"============== ChekSyntax :     ================
" Check a file's syntax when saving a file (php, ruby, tex ...) with vim
" https://github.com/tomtom/checksyntax_vim
"NeoBundle 'tomtom/checksyntax_vim'
"============== Matrix Screensaver :     ================
" Matrix Screen for VIM
" https://github.com/uguu-org/vim-matrix-screensaver
"NeoBundle 'uguu-org/vim-matrix-screensaver'
"============== Project :     ================
" lcd to the root of the project everytime you BufEnter a file inside a project.
" https://github.com/amiorin/vim-project
"============== VimMisc :     ================
" Miscellaneous auto-load Vim scripts required by easytags
" https://github.com/xolox/vim-misc
"============== BlockIt :     ================
" sk1418 / blockit
" a vim plugin to wrap lines in a block
" https://github.com/sk1418/blockit
"============== HowMuch :     ================
" sk1418 / HowMuch
" A Vim plugin to calculate visual selected expressions
" https://github.com/sk1418/HowMuch
"============== EasyTags :     ================
" Automated tag file generation and syntax highlighting of tags in Vim
" https://github.com/xolox/vim-easytags
"@FIXME: Fix the generation process :
" - Provide a command to generate a tag in a project.
" - Use specific tag file by project.
" - Load / Reload only tag file selected by the pwd value project name ?
" - In theory the base tag file should be provided by a call from the VCS.
" -
"NeoBundle 'xolox/vim-easytags.git'
"@TODO: Fix easytags call to be lighter
" EasyTags setup
"let g:easytags_file = '~/.vim/tags/generic'
" Set tags generic for vim
"set tags='~/.vim/tags/'
"let g:easytags_autorecurse = 1
"let g:easytags_include_members = 1
"let g:easytags_dynamic_file = 2
" Refresh Tags on write file
"let g:easytags_events = ['BufWritePost']
" Updtate highlight
"let g:easytags_auto_update = 0
"@TODO: Add async call to avoid freezing vim.
"let g:eastags_async = 1
"============== VimSession :     ================
" Extended session management for Vim (:mksession on steroids)
" https://github.com/xolox/vim-session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
"let g:session_autosave_periodic = 1

"============== VimAirline :     ================
" lean & mean status/tabline for vim that's light as air
" https://github.com/bling/vim-airline
"============== CtrlP :     ================
" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/kien/ctrlp.vim
"NeoBundle 'kien/ctrlp.vim.git'
"============== CRA :     ================
" cra.vim
" Vim plugin to create yearly timesheet
"=========================================
"============== OLD / DEMO ========
" Demo :
" Just for ex of multi repo
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Old :
" An awesome debugging client for Vim, Xdebug and PHP
" https://github.com/vim-scripts/Xdebug
" NeoComplCache : depercated
" Ultimate auto-completion system for Vim.
" http://www.vim.org/scripts/script.php?script_id=2620
" https://github.com/Shougo/neocomplcache.vim
" NeoBundle 'Shougo/neocomplcache.vim.git'
" Deprecated : If you use Vim 7.3.885 or above with if_lua feature, you should
" use neocomplete. It is faster than neocomplcache.
"===========================================
"============== VimProc :     ================
" @TODO: Complete infos
" vim-scripts repos
"===========================================

"=============== CALENDAR : ================
" A calendar application for Vim
" https://github.com/itchyny/calendar.vim
"===========================================
"============== COLOR :       ==============
" Colour schemes for a variety of editors created by Dayle Rees.
" http://daylerees.github.io
"NeoBundle 'daylerees/colour-schemes', { "rtp": "vim-themes/" }
"===========================================
" quick setup : http://sjl.bitbucket.org/gundo.vim/#installation
"let g:gundo_width = 60
"let g:gundo_preview_height = 40
"let g:gundo_right = 1
"nnoremap <F5> :GundoToggle<CR>
"===========================================

"============== VimProc :     ================
" @TODO: Complete infos
"Bundle 'vcscommand.vim'
"============== VimProc :     ================
" @TODO: Complete infos
"NeoBundle 'SuperTab'

" =======
" COLOR :
" =======
" Coloration syntaxique, indispensable pour ne pas se perdre dans les longs fichiers
" syntax on
" https://github.com/Shougo/vimshell.vim/issues/73
" Change to syntax enable
syntax enable
" Syntax :
" The colors get messed up when I scroll. Vim uses various heuristics to save
" time when determining the highlighting, and sometimes they cause problems.
" Look up :h syn-sync for a more detailed explanation.
"syn sync fromstart
" Coloration syntaxique des fichiers zarb :
" TWIG :
au BufRead,BufNewFile *.twig set syntax=htmldjango

"============== ColorSheme :  =============
" vim-colors-solarized
" precision colorscheme for the vim text editor
" http://ethanschoonover.com/solarized
" https://github.com/altercation/vim-colors-solarized
" morhetz / gruvbox :
" Retro groove color scheme for Vim
" https://github.com/morhetz/gruvbox
" zeis / vim-kolor
" Vim color scheme.
" https://github.com/zeis/vim-kolor
" junegunn / seoul256.vim
" a low-contrast Vim color scheme based on Seoul Colors
" Moria :
" A color scheme for GUI supposed to be highly readable
" http://www.vim.org/scripts/script.php?script_id=1464
" Bad Wolf
" A Vim color scheme.
" https://github.com/sjl/badwolf/
"============== Molokai :     ================
" tomasr/molokai
" Molokai color scheme for Vim
" https://github.com/tomasr/molokai
"============== VimProc :     ================
" @TODO: Complete infos
"============== Vividchalk :     ================
" vividchalk.vim:
" a colorscheme strangely reminiscent of Vibrant Ink for a
" certain OS X editor
" https://github.com/tpope/vim-vividchalk
" http://www.vim.org/scripts/script.php?script_id=1891
"============== VimProc :     ===============
" @TODO: Complete infos
"============== ROGUE.VIM     ===============
" katono/rogue.vim
" Porting of Rogue-clone II for Vim
"============== Characterize  ===============
" tpope/vim-characterize
" characterize.vim:
" Unicode character metadata

" http://www.vim.org/scripts/script.php?script_id=4410
"============== PHP :     ================
" @TODO: Complete infos
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
" 2: for folding all { } regions
" 3: for folding only functions
" TODO: documentation for php_folding_manual
let php_folding = 3

"============== TagList :     ================
" @TODO: Complete infos
"============== CSS color :   ================
" Highlight colors in css files
" NeoBundle 'skammer/vim-css-color'
" NOT WORKING
"Highlight colors in css files
" http://ap.github.io/vim-css-color/
"NeoBundle 'ap/vim-css-color'
"=============== CSS VIM : ====================
" css.vim
" Cutting-edge vim css syntax file
" http://www.vim.org
"=============================================
"============== Bundle old samples ===========
" non github repos:
"============== CommandT :     ================
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"==============  :     ================
"Bundle 'file:///Users/gmarik/path/to/plugin'

call neobundle#end()
 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
" }}}

" Folding {{{ :
" I like some folding ideas from :
" http://dougblack.io/words/a-good-vimrc.html#colors
set foldmethod=marker
"set foldmethod=indent
"set foldmethod=syntax
" Then we want it to close every fold by default so that we have this high level
" view when we open our vimrc.
set foldlevel=0
" }}}

" KEYBOARD CUSTOM {{{ :
" ===========
" Change default leader key
" NOT WORKING
" Note the required backslash.
"let mapleader = "\<space>"
let mapleader = ","
" Show command (usefull for leader) :
set showcmd
" Permettre l'utilisation de la touche backspace dans tous les cas :
set backspace=2
" }}}

" AutoReLoad vimrc {{{ :
" ==========
" Auto apply modification to vimrc
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
    "autocmd! BufWritePost vimrc.bepo source ~/.vim/vimrc.bepo
endif
" }}}

" SHORTCUTS {{{ :
" ==========
" @todo add global copy / paste with a shortcut
" Permet de sauvegarder par ctrl + s
:nmap <c-s> :w<CR>
" Fonctionne aussi en mode edition
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

" Completion avec ctrl + space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
" }}}

" INDENTING {{{ :
" ===========
" Détection du type de fichier pour l'indentation
filetype plugin indent on
" Do we need to test on autocmd
if has("autocmd")
    "filetype indent on
    filetype plugin indent on
endif
" Automatically indent when adding a curly bracket, etc.
set smartindent
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
set expandtab ts=4 sw=4 ai
" Utilise shiftwidth à la place de tabstop en début de ligne (et backspace supprime d'un coup si ce sont des espaces)
set smarttab
" 20140901: Add for test.
" redraw only when we need to.
set lazyredraw
" autoindent n'est spécifique à aucun langage et fonctionne en général moins bien
set noautoindent
" Requis aussi pour vundle
"filetype plugin indent on
"filetype indent on
" Detection de l'indentation
set cindent
set smartindent


" }}}

" COLORSHEME {{{ :
" set the background light or dark
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
" Change tabeline display
"hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
"hi TabLineSel   guifg=red guibg=green gui=bold ctermfg=red ctermbg=green cterm=bold
"hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
"colorscheme blue
" Change le colorsheme en mode diff
if &diff
    "colorscheme evening
    "colorscheme darkblue
    colorscheme solarized
    "colorscheme wombat256mod
endif
" }}}

" SESSION {{{ :
" =========
" Récupération de la position du curseur entre 2 ouvertures de fichiers
" Parfois ce n'est pas ce qu'on veut ...
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif
" }}}

" ENCODING {{{ :
" ==========
" Use UTF-8.
set encoding=utf-8
"@TODO: Add exception for man page.
"set fileencoding=utf-8
" }}}

" Clipboard {{{ :
" Set the clipboard if running inside X11
if has("X11")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
" }}}

" COMPLETION MENU {{{ :
" ============
" Show autocomplete menus.
set wildmenu
" Afficher une liste lors de complétion de commandes/fichiers :
set wildmode=list:full
" Allow completion on filenames right after a '='.
" Uber-useful when editing bash scripts
set isfname-==
" }}}

" ========
" STATUS :
" ========
" Show editing mode
set showmode

" =============
" VISUAL BELL :
" =============
" Error bells are displayed visually.
set visualbell

" =======
" RULER :
" =======
" SI c'est pas déjà fait, affiche la position du curseur
set ruler

" ======
" DIFF :
" ======
" Affiche toujours les diffs en vertical
set diffopt=vertical

" Split {{{ :
" Set the split below the active region.
set splitbelow
" }}}

" SEARCH {{{ :
" ========
" Recherche en minuscule -> indépendante de la casse,
" une majuscule -> stricte
set smartcase

" Ne jamais respecter la casse (attention totalement indépendant du précédent mais de priorité plus faible)
set ignorecase

" Déplace le curseur au fur et a mesure qu'on tape une recherche, pas toujours pratique, j'ai abandonné
set incsearch

" Met en évidence TOUS les résultats d'une recherche, A consommer avec modération
set hlsearch
" }}}

" Déplacer le curseur quand on écrit un (){}[] (attention il ne s'agit pas du highlight
set showmatch

" Affiche le nombre de lignes sélectionnées en mode visuel ou la touche/commande qu'on vient de taper en mode commande
set showcmd

" MOUSE {{{ :
" =======
" Utilise la souris pour les terminaux qui le peuvent (tous ?)
" pratique si on est habitué à coller sous la souris et pas sous le curseur,
" attention fonctionnement inhabituel
set mouse=a
" }}}

" PASTE / NOPASTE {{{ :
" =======
"@TODO: Not certain if really needed
" A utiliser en live, paste désactive l'indentation automatique
" (entre autre) et nopaste le contraire
set nopaste

" On peut passer rapidement du mode paste au mode nopaste avec un raccourcis,
" builtin sur les versions récentes de vim >= 7,
" sinon il faudrait créer une fonction :
" 20141009: Disable the switch I did not use it.
"set pastetoggle=<F5>
" }}}

" =========
" COMMAND :
" =========
" Indiquer le nombre de modification lorsqu'il y en a plus de 0 suite à une commande
set report=0

" BACKUP {{{ :
" ========
" Modif tmp
set swapfile
" Modif tmp
let g:dotvim_backup=expand('$HOME') . '/.vim/backup'
if ! isdirectory(g:dotvim_backup)
    call mkdir(g:dotvim_backup, "p")
endif
set directory=~/.vim/backup

" Backups with persistent undos
set backup
let g:dotvim_backups=expand('$HOME') . '/.vim/backups'
if ! isdirectory(g:dotvim_backups)
    call mkdir(g:dotvim_backups, "p")
endif
exec "set backupdir=" . g:dotvim_backups
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
    exec "set undodir=" . g:dotvim_backups
endif
" }}}

" LINE WRAPPING {{{ :
" ===============
" Laisse les lignes déborder de l'écran si besoin
"set nowrap
" Ne laisse pas les ligne deborder de l'écran
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak
" Size of the linewrapping
set textwidth=80
" }}}

" HighLight 81 col {{{ :
"===========================================================================================================================================
" @todo : fix the highliht the 80th char +
" OR ELSE just the 81st column of wide lines...
"highlight ColorColumn ctermbg=magenta
"== Set colorcolumn to be enabled when it goes over colum 80.
"set colorcolumn=+0
"highlight ColorColumn ctermbg=red guibg=red
" test todo : @TODO TODO todo
"highlight todo ctermbg=green guibg=green
"match todo /TODO/
"set OverLength=+0
"highlight OverLength ctermbg=blue guibg=darkblue ctermfg=white guibg=#592929
" From «More Instantly Better Vim» - OSCON 2013
" http://youtu.be/aHm36-na4-4
highlight OverLength ctermbg=darkblue ctermfg=white guibg=darkblue guibg=white
"highlight OverLength ctermbg=white guibg=white ctermfg=white guibg=#592929
"highlight OverLength ctermbg=darkblue guibg=darkblue
"match OverLength '\%>81v.\+'
":match ErrorMsg '\%>80v.\+'
call matchadd('OverLength', '\%81v', 100)
"call matchadd('OverLength', '\%>81v.\3', 100)
"call matchadd('OverLength', '\%>81v.\%>82v', 100)
"call matchadd('OverLength', '\%>81v.\-1', 100)
"hi Error80 ctermbg=red
"syn match Error80        /\%>60v.\+/ " highlight anything past 80
"=====[ Comments are important ]==================
"highlight Comment term=bold ctermfg=white
highlight todo ctermbg=darkcyan ctermfg=white guibg=darkcyan guibg=white
call matchadd('todo', 'TODO\|@TODO', 100)
call matchadd('todo', 'MAIL\|mail', 100)
highlight SpellBad cterm=underline
highlight fix ctermbg=darkred ctermfg=white guibg=darkred guibg=white
call matchadd('fix', 'BUGFIX\|@BUGFIX\|FIXME\|@FIXME', 100)
"@TODO: Add new highlighting
" * @author Guillaume Seren
highlight author ctermfg=brown guibg=brown
call matchadd('author', 'author\|@author', 100)
" * @since 20140603
" * Description :
" * HISTORY :
" * @param string $sUrlToCall
" * @return string $sResponse
" # Mail   : guillaumeseren@gmail.com



" }}}


" Show Special Char {{{ :
" show tabs / nbsp / trailing spaces
set listchars=tab:··,trail:¤,extends:>,precedes:<
set list
" }}}

" Title {{{ :
" This is nice if you have something
" that reset the title of you term at
" each command, othersize it's annoying ...
set title
" }}}

" SPELL CHECKER {{{ :
" ===============
" En live pour quand vous écrivez anglais (le fr est à trouver dans les méandres du net)
" Chiant pour programmer, mais améliorable avec des dico
    " perso et par languages
set spell
" [s / ]s : saute au prochain / précédant mot avec faute.
    " z= : affiche la liste de suggestion pour corriger.
set spelllang=fr,en

" @TODO: Remap the mapping of the spell checker
" @TOOD: Support auto detection of the sentence language,
"        so it can support multi language fr / us / en / etc (jpn)
" }}}

" SHOW {{{ :
" ======
" Keep 3 line before / after cursor.
set scrolloff=3
" }}}

" CURSOR {{{ :
" ===================
" SHOW CURRENT LINE :
" ===================
" Pour highlighter la ligne courante (pour mieux se repérer) en bleu :
set cursorline
"highlight CursorLine ctermbg=blue

"=====================
"SHOW CURRENT COLUMN :
"=====================
set cursorcolumn
"highlight cursorcolumn ctermbg=blue

" SHOW CURSOR:
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Format json selection
map <Leader>j !python -m json.tool<CR>
" }}}

" ====================
" SHOW LINEWRAPPING :
" ====================
" Show too long lines

" SHOW LINE NUMBER {{{ :
" ==================
" Pour activer les numéros de lignes dans la marge :
"set number
" Beaucoup plus pratique pour sauter de ligne en ligne,
" zz permet de centrer l'écran
" voir stupideasymotion
set relativenumber
set number
"}}}

" SHOW NON-BREAKABLE SPACE {{{ :
" ==========================
" colorise les nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/
"}}}

" CHMOD (old) {{{ :
" =======
" donner des droits d'exécution au fichier
" si le fichier commence par #! et contient /bin/ dans son chemin
"function ModeChange()
"    if getline(1) =~ "^#!"
"        if getline(1) =~ "/bin/"
"            silent !chmod a+x <afile>
"        endif
"    endif
"endfunction
"
"au BufWritePost * call ModeChange()
"}}}

" STATUS BAR {{{ :
" ===========
" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Format de la barre d'état (tronquée au début, fichier, flags,  :
" @Deprecated: use vim airline instead
"set statusline=%<%f%m\ %r\ %h\ %w%=%l,%c\ %p%%
"}}}

" MOVE CURSOR {{{ :
" =============
" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

" Tenter de rester toujours sur la même colonne lors de changements de lignes :
set nostartofline
"}}}

" COMMAND HISTORY {{{ :
" =================
" Nombre de commandes maximale dans l'historique :
set history=10000
"}}}

" SAVE as ROOT {{{:
" use :W to sudo-write the current buffer
command! W w !sudo tee % > /dev/null
" }}}

" CLOSING {{{ :
" ZZ now saves all files, creates a session and exits
function! AutocloseSession()
    " if g:SessionLoaded || !filereadable(g:SessionPath)
    "     exec 'mksession! ' . g:SessionPath
    " endif
    wqall
endfunction
noremap <silent> ZZ :call AutocloseSession()<CR>
" }}}

" Real Vimmer forget the cross
no <down> ddp
no <left> :tabprevious<CR>
no <right> :tabnext<CR>
no <up> ddkP

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"@FIXME: Seem's to "break" file explorer.
"From:
"http://unix.stackexchange.com/questions/31575/remapping-keys-in-vims-directory-view
augroup netrw_dvorak_fix
    autocmd!
    autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
augroup END

function! Fix_netrw_maps_for_dvorak()
    " {cr} = « gauche / droite »
    " @TODO: Remap to more vinegar related feature, like:
    " - c : Go back
    " - t : Preview (ranger inspired)
    noremap <buffer> c h
    noremap <buffer> r l
    " {ts} = « haut / bas »
    noremap <buffer> t j
    noremap <buffer> s k
    " noremap <buffer> d h
    " noremap <buffer> h gj
    " noremap <buffer> t gk
    " noremap <buffer> n l
    " noremap <buffer> e d
    " noremap <buffer> l n
    " and any others...
endfunction

" OpenTab and lcd to the file {{{:
" Change local working dir upon tab creation
function! TabNewWithCwD(newpath)
    :execute "tabnew " . a:newpath
    if isdirectory(a:newpath)
        :execute "lcd " . a:newpath
    else
        let dirname = fnamemodify(a:newpath, ":h")
        :execute "lcd " . dirname
    endif
endfunction
command! -nargs=1 -complete=file TabNew :call TabNewWithCwD("<args>")
" }}}

" Man {{{ :
" Man page for work under cursor
"nnoremap K :Man <cword> <CR>
" }}}

" {{{ Custom functions
" Remove trailing whitespace
function! CleanWhiteSpace()
    let l = line(".")
    let c = col(".")
    :%s/\s\+$//e
    let last_search_removed_from_history = histdel('s', -1)
    call cursor(l, c)
endfunction()
command! -nargs=0 CleanWhiteSpace :call CleanWhiteSpace()
" Convert DOS line endings to UNIX line endings
function! FromDos()
    %s/\r//e
endfunction
command! FromDos call FromDos()
" Automatically give executable permissions if file begins with #! and
" contains '/bin/' in the path
function! MakeScriptExecuteable()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod +x <afile>
    endif
endfunction
" Used to create missing directories before writing a
" buffer
function! MkdirP()
    :!mkdir -p %:h
endfunction
command! MkdirP call MkdirP()
" }}}

" SHEBANG {{{ :
" =========
" shebang automatique lors de l'ouverture nouveau
" d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
" shell
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
" python
:autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: UTF8 -*-\<nl>\<nl>\"|$
" php
:autocmd BufNewFile *.php 0put=\"<?php\<nl>// -*- coding: UTF8 -*-\<nl>\<nl>\"|$
" Add set modifiable
":autocmd BufWinEnter * setlocal modifiable
" }}}
