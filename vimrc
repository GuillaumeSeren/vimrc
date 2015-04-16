" My VIMRC File :
" ---------------
" @AUTHOR  : Guillaume Seren
" @WEBSITE : http://guillaumeseren.com
" @LICENSE : www.opensource.org/licenses/bsd-license.php
" @Link    : https://github.com/GuillaumeSeren/vimrc
" ---------------
" Summary {{{1
" ===========
" Let's try to split this file into several clear part
" - Keyboard BÉPO
" - Plugins
" - Tweaking
" - Display
" - Input
" - AutoCmd

" TODO-LIST {{{1
" - Clean LazyLoading of all non default pluqin.
" - Define augroup to configure pluqin if loaded.
" - Clean bépo conflict with vim plugin (comment, unipaired, surround).
" - Clean oldies.
" - Still a bug on direct number access on '9'.

" Skip initialization for vim-tiny or vim-small {{{1
if !1 | finish | endif

" REMAP KEYBOARD for bépo {{{1
" @TODO: Detect keyboard layout (qwerty / bépo)
" I use kind dvorak-fr the «bépo» layout on my keyboard.
source ~/.vim/vimrc.bepo
" remap number for direct access
source ~/.vim/vimrc.num

" Auto Install NeoBundle {{{1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

" Check if bundle dir is available for new install
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Startup config {{{1
" ===========
" We can export some config in modular files like :
" Change the default mode of vim.
" @TODO: really need ?
if has('vim_starting')
    " Be iMproved
    set nocompatible
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundle List {{{1
" All the addons
" NeoBundle base {{{2
" 20131206: Add NeoBundle
" 13-10-2014: NeoBundle change call to begin
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" Some more customisation:
" from: https://github.com/rkaneko/dotfiles/blob/master/.vimrc.init
" let g:neobundle#install_max_processes = 4
let g:neobundle#install_process_timeout = 1500
" My Bundles here:
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" VIMPROC {{{2
" Recommended to install
" original repos on github
" After install, turn shell ~/.vim/bundle/vimproc,
" (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
    \ 'build'       : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin'  : 'make -f make_cygwin.mak',
        \ 'mac'     : 'make -f make_mac.mak',
        \ 'unix'    : 'make -f make_unix.mak',
        \ },
    \ }

" UNITE {{{2
" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
" https://github.com/Shougo/unite.vim
NeoBundle 'Shougo/unite.vim.git'

" NeoComplete {{{2
" https://github.com/Shougo/neocomplete.vim
" Next generation completion framework after neocomplcache
NeoBundle 'Shougo/neocomplete'

" YouCompleteMe {{{2
" A code-completion engine for Vim
" http://valloric.github.io/YouCompleteMe/
" https://github.com/Valloric/YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build'      : {
         \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
         \ 'unix'    : './install.sh --clang-completer --system-libclang',
         \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
         \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
         \ }
      \ }
" Add or remove arguments to install.sh as necessary.
" Additional steps might be necessary for Windows, as always. ;)

" NeoSnippet {{{2
" https://github.com/Shougo/neosnippet.vim
" neo-snippet plugin contains neocomplcache snippets source
NeoBundle 'Shougo/neosnippet'

" NeoSnippet-snippets {{{2
" https://github.com/Shougo/neosnippet-snippets
" The standard snippets repository for neosnippet
NeoBundle 'Shougo/neosnippet-snippets'

" unite-outline {{{2
" Unite Plugin : OUTLINE =========
" https://github.com/h1mesuke/unite-outline
" outline source for unite.vim
" http://d.hatena.ne.jp/h1mesuke/20101107/p1
" Call it with :unite outline
NeoBundle 'h1mesuke/unite-outline'

" unite-colorscheme {{{2
" https://github.com/ujihisa/unite-colorscheme
" A unite.vim plugin
NeoBundle 'ujihisa/unite-colorscheme'

" SYNTASTIC {{{2
" Syntax checking hacks for vim
" https://github.com/scrooloose/syntastic
NeoBundle 'scrooloose/syntastic.git'

" VimShell {{{2
" Powerful shell implemented by vim.
" https://github.com/Shougo/vimshell.vim
NeoBundle 'Shougo/vimshell.vim.git'

" VimFiler {{{2
" vimfiler.vim
" Powerful file explorer implemented by Vim script
" https://github.com/Shougo/vimfiler.vim
NeoBundle 'Shougo/vimfiler.vim'

" Sensible {{{2
" sensible.vim: Defaults everyone can agree on
" http://www.vim.org/scripts/script.php?script_id=4391
NeoBundle 'tpope/vim-sensible'

" Fugitive {{{2
" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
NeoBundle 'tpope/vim-fugitive'

" Committia {{{2
" A Vim plugin for more pleasant editing on commit messages
NeoBundle 'rhysd/committia.vim'

" VimMisc {{{2
" Miscellaneous auto-load Vim scripts required by easytags
" https://github.com/xolox/vim-misc
NeoBundle 'xolox/vim-misc.git'

" VimSession {{{2
" Extended session management for Vim (:mksession on steroids)
" https://github.com/xolox/vim-session
NeoBundle 'xolox/vim-session.git'

" Repeat {{{2
" repeat.vim: enable repeating supported plugin maps with "."
" http://www.vim.org/scripts/script.php?script_id=2136
" https://github.com/tpope/vim-repeat
NeoBundle 'tpope/vim-repeat'

" SpeedDating {{{2
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
" https://github.com/tpope/vim-speeddating
NeoBundle 'tpope/vim-speeddating.git'

" EditorConfig {{{2
" EditorConfig plugin for Vim http://editorconfig.org
NeoBundle 'editorconfig/editorconfig-vim'

" Vinegar {{{2
" vinegar.vim: combine with netrw to create a delicious salad dressing
" https://github.com/tpope/vim-vinegar
NeoBundle 'tpope/vim-vinegar.git'

" vim-eunuch {{{2
" tpope/vim-eunuch
" eunuch.vim: helpers for UNIX
" http://www.vim.org/scripts/script.php?script_id=4300
" https://github.com/tpope/vim-eunuch
NeoBundle 'tpope/vim-eunuch'

" Multiple-Cursor {{{2
" terryma/vim-multiple-cursors
" True Sublime Text style multiple selections for Vim
NeoBundle 'terryma/vim-multiple-cursors'

" Recover.vim {{{2
" chrisbra/Recover.vim
" A Plugin to show a diff, whenever recovering a buffer
" http://www.vim.org/scripts/script.php?script_id=3068
NeoBundle 'chrisbra/Recover.vim'

"" UniPaired {{{2
"" key combos for 'pairs' of things. Mostly previous/next type stuff
"" https://github.com/tpope/vim-unimpaired
"NeoBundle 'tpope/vim-unimpaired'
"
" Surround {{{2
" surround.vim: quoting/parenthesizing made simple
" https://github.com/tpope/vim-surround
let g:surround_no_mappings= 1
NeoBundle 'tpope/vim-surround'
nmap ds  <Plug>Dsurround
nmap hs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
"xmap S   <Plug>VSurround
"xmap gS  <Plug>VgSurround

" Vim-commentary {{{2
" http://www.vim.org/scripts/script.php?script_id=3695
" tpope/vim-commentary
" commentary.vim: comment stuff out
NeoBundle 'tpope/vim-commentary'

" Clang complete {{{2
" Use of Clang for completing C, C++, Objective-C and Objective-C++
NeoBundleLazy 'Rip-Rip/clang_complete', {
    \ 'autoload': {
        \ 'filetypes': ['c', 'cpp']
    \}}

"" RagTag {{{2
"" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)
"" http://www.vim.org/scripts/script.php?script_id=1896
"" https://github.com/tpope/vim-ragtag
"" CTRL+X /       Close the last open HTML tag
"" CTRL+X SPACE   Create open/close HTML tags from the typed word
"" CTRL+X CR      The same as CTRL+X SPACE but puts a newspace in between
"" CTRL+X !       Insert HTML doctype
"" CTRL+X @       Insert CSS stylesheet
"" CTRL+X #       Insert meta content-type meta tag
"" CTRL+X $       Load JavaScript document
"" For the following mappings, suppose that
"" you have typed "foo".
"" Mapping        Result
"" ---------      -----------
"" CTRL+X =       foo<%= | %>
"" CTRL+X +       <%= foo| %>
"" CTRL+X -       foo<% | %>
"" CTRL+X _       <% foo| %>
"" CTRL+X '       foo<%# | %>
"" CTRL+X "       <%# foo| %>
"NeoBundle 'tpope/vim-ragtag'

" VimAirline {{{2
" lean & mean status/tabline for vim that's light as air
" https://github.com/bling/vim-airline
NeoBundle 'bling/vim-airline'

" vimwiki {{{2
" Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
" Key bindings
" see :h vimwiki-mappings
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
NeoBundle 'vimwiki/vimwiki'

" EasyMotion {{{2
" Vim motions on speed!
" https://github.com/Lokaltog/vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '\'

" Stupid-EasyMotion {{{2
" A dumbed down version of EasyMotion
" that aids navigation on the current line
" We use the global leader
" <Leader><Leader>w  - make every word a target
" <Leader><Leader>W  - make every space separated word a target
" <Leader><Leader>fx - make every character x in the line a target
NeoBundle 'joequery/Stupid-EasyMotion'

" vim-gitgutter {{{2
" airblade/vim-gitgutter
" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
NeoBundle 'airblade/vim-gitgutter'

" SearchParty {{{2
" dahu/SearchParty
" Extended search commands and maps for Vim
" https://github.com/dahu/SearchParty
" NeoBundle 'dahu/cearchParty'
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
NeoBundle 'dahu/SearchParty'

" DBEXT {{{2
" vim-scripts/dbext.vim
" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL,
" DBI,..)
" http://www.vim.org/scripts/script.php?script_id=356
" https://github.com/vim-scripts/dbext.vim
" help : ':h dbext-tutorial'
NeoBundle 'vim-scripts/dbext.vim'

" VCSCOMMAND {{{2
" http://www.vim.org/scripts/script.php?script_id=90
" https://code.google.com/p/vcscommand/
NeoBundle 'vcscommand.vim'

" vDebug {{{2
" On remplace Xdebug par Vdebug apparement plus performant
" http://www.vim.org/scripts/script.php?script_id=4170
" https://github.com/joonty/vdebug
" Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)
NeoBundle 'joonty/vdebug.git'

" vim-github-dashboard {{{2
" junegunn/vim-github-dashboard
" Browse GitHub events in Vim
" Browse GitHub events (user dashboard, user/repo activity) in Vim.

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
" Navigation

" Use Tab and Shift-Tab to navigate back and
" forth through the links.
" Press Enter key or double-click on a link to
" open it in the browser.
" Press R to refresh the window.
" Press q to close the window.
NeoBundle 'junegunn/vim-github-dashboard'

" AG.VIM {{{2
" https://github.com/rking/ag.vim
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module /
" CLI script 'ack'
NeoBundle 'rking/ag.vim'

" SUCKLESS {{{2
" https://github.com/fabi1cazenave/suckless.vim
" This plugin emulates the excellent wmii <http://wmii.suckless.org/> window
" manager in Vim.
NeoBundle 'fabi1cazenave/suckless.vim'

" cra.vim {{{2
" cra.vim
" Vim plugin to create yearly timesheet
NeoBundleLazy 'YannMoisan/cra.vim', {
    \ 'autoload': {
        \ 'filetypes':['cra']
    \ }}
" define cra filetype for lazy loading
au BufRead,BufNewFile *.cra set filetype=cra

" CALENDAR {{{2
" A calendar application for Vim
" https://github.com/itchyny/calendar.vim
NeoBundle 'itchyny/calendar.vim'

" a.vim {{{2
" A few of quick commands to swtich between source files and header files
" quickly.
NeoBundle 'a.vim'

" BlockIt ASCII art array {{{2
" sk1418 / blockit
" a vim plugin to wrap lines in a block
" https://github.com/sk1418/blockit
NeoBundle 'sk1418/blockit.git'

" HowMuch {{{2
" sk1418 / HowMuch
" A Vim plugin to calculate visual selected expressions
" https://github.com/sk1418/HowMuch
NeoBundle 'sk1418/HowMuch.git'

" Vim-Move {{{2
" https://github.com/matze/vim-move
" Plugin to move lines and selections up and down
" http://www.vim.org/scripts/script.php?script_id=4687
NeoBundle 'matze/vim-move'

" SHABERU {{{2
" supermomonga/shaberu.vim
" めっちゃしゃべる
" https://github.com/supermomonga/shaberu.vim
" Shaberu.vim is the wrapper of speech synethis. You can make your vim speak
" easily with Shaberu.vim.
NeoBundle 'supermomonga/shaberu.vim'
" Speak Japanese voice on OS X
let g:shaberu_user_define_say_command = 'espeak -v french "%%TEXT%%"'

" Tabularize ! {{{2
" https://github.com/godlygeek/tabular
" Vim script for text filtering and alignment
" one  : 1
" two  : 2
" tree : 3
" select text in visual mode, then hit : Tabularize /:
" change the : with the needed char to align
NeoBundle 'godlygeek/tabular'

"" EasyAlign {{{2
"" A simple Vim alignment plugin
"" 20150121: Certainement doublons avec Tabularize,
""           donc a comparer en details
"" https://github.com/junegunn/vim-easy-align
""NeoBundle 'junegunn/vim-easy-align'
"
" Characterize {{{2
" tpope/vim-characterize
" characterize.vim:
" Unicode character metadata
" http://www.vim.org/scripts/script.php?script_id=4410
NeoBundle 'tpope/vim-characterize'

" vim-scriptease {{{2
" tpope/vim-scriptease
" scriptease.vim: A Vim plugin for Vim plugins
" http://www.vim.org/scripts/script.php?script_id=4394
NeoBundle 'tpope/vim-scriptease'

" vim-colors-solarized {{{2
" precision colorscheme for the vim text editor
" http://ethanschoonover.com/solarized
" https://github.com/altercation/vim-colors-solarized
NeoBundle 'altercation/vim-colors-solarized.git'

" Rails {{{2
" rails.vim: Ruby on Rails power tools
" https://github.com/tpope/vim-rails
NeoBundle 'tpope/vim-rails.git'

" lua-ftplugin {{{2
" Lua file type plug-in for the Vim text editor
" http://peterodding.com/code/vim/lua-ftplugin
" https://github.com/xolox/vim-lua-ftplugin
NeoBundleLazy 'xolox/vim-lua-ftplugin' , {
    \ 'autoload': {
        \ 'filetypes': ['lua']},
    \ 'depends' : 'xolox/vim-misc',
    \ }

" elzr: json {{{2
" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
" https://github.com/elzr/vim-json
NeoBundleLazy 'elzr/vim-json', {
    \ 'autoload' : {
        \ 'filetypes' : ['javascript']
    \ }}

" yaml {{{2
NeoBundleLazy 'avakhov/vim-yaml', {
    \ 'autoload' : {
        \ 'filetypes' : ['python', 'yaml']
    \ }}

" Vim-Markdown {{{2
NeoBundleLazy 'tpope/vim-markdown', {
    \ 'autoload':{
        \ 'filetypes':['markdown']
    \ }}

" php.vim {{{2
" old::
" NeoBundle 'php.vim'
" 20141028: Change to new StanAngeloff
" https://github.com/StanAngeloff/php.vim
NeoBundleLazy 'StanAngeloff/php.vim', {
    \ 'autoload': {
        \ 'filetypes':['php']
    \ }}

" Better PHP indent {{{2
" The official VIm indent script for PHP
" http://www.2072productions.com/to/phpindent.txt
" https://github.com/2072/PHP-Indenting-for-VIm
NeoBundleLazy '2072/PHP-Indenting-for-VIm', {
    \ 'autoload': {
        \ 'filetypes':['php']
    \ }}

" PHP Getter / Setter {{{2
" php_getset.vim
" Automatically add getter/setters for PHP4 properties.
" Commands:
"  :InsertGetterSetter
"      Inserts a getter/setter for the property on the current line, or
"      the range of properties specified via a visual block or x,y range
"      notation.  The user is prompted to determine what type of method
"      to insert.
"
"  :InsertGetterOnly
"      Inserts a getter for the property on the current line, or the
"      range of properties specified via a visual block or x,y range
"      notation.  The user is not prompted.
"
"  :InsertSetterOnly
"      Inserts a setter for the property on the current line, or the
"      range of properties specified via a visual block or x,y range
"      notation.  The user is not prompted.
"
"  :InsertBothGetterSetter
"      Inserts a getter and setter for the property on the current line,
"      or the range of properties specified via a visual block or x,y
"      range notation.  The user is not prompted.
NeoBundleLazy 'vim-scripts/php_getset.vim', {
    \ 'autoload': {
        \ 'filetypes':['php']
    \ }}

" Textobjs {{{2
" Text-object like motion for arguments
NeoBundleLazy 'kana/vim-textobj-user'
NeoBundleLazy 'osyo-manga/vim-textobj-multiblock', {
    \ 'depends': 'vim-textobj-user',
    \ 'autoload': {
    \ 'mappings': [[ 'ox', '<Plug>' ]]
    \ }}

" CSS color {{{2
" Highlight colors in css files
" NeoBundle 'skammer/vim-css-color'
" NOT WORKING
"Highlight colors in css files
" http://ap.github.io/vim-css-color/
NeoBundleLazy 'ap/vim-css-color', {
    \ 'autoload': {
        \ 'filetypes':['css']
    \ }}

" css.vim {{{2
" css.vim
" Cutting-edge vim css syntax file
" http://www.vim.org
NeoBundleLazy "JulesWang/css.vim", {
    \ 'autoload': {
        \ 'filetypes':['css']
    \ }}

" vim-css3-syntax {{{2
" Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
" https://github.com/hail2u/vim-css3-syntax
NeoBundleLazy 'hail2u/vim-css3-syntax', {
    \ 'autoload': {
        \ 'filetypes':['css']
    \ }}

"" Twig plugin {{{2
"" 20150121: Seem's to break color disable it
"" evidens/vim-twig
"" Twig syntax highlighting, snipMate, etc.
"" https://github.com/evidens/vim-twig
"NeoBundleLazy 'evidens/vim-twig', {
"    \ 'autoload': {
"        \ 'filetypes':['twig']
"    \ }}
"
"" Twig Indent {{{2
"" Vim script for indentation of html twig file.
"" https://github.com/tokutake/twig-indent
"NeoBundleLazy 'tokutake/twig-indent', {
"    \ 'autoload': {
"        \ 'filetypes':['twig']
"    \ }}

" sparkup {{{2
" A parser for a condensed HTML format
" https://github.com/rstacruz/sparkup
NeoBundleLazy 'rstacruz/sparkup', {
    \ 'autoload': {
        \ 'filetypes':['html', 'xhtml']
    \ }}

"" emmet for vim: {{{2
"" http://emmet.io/
"" 20150121: Useless with sparkup ?
"" https://github.com/mattn/emmet-vim
"NeoBundleLazy 'mattn/emmet-vim', {
"    \ 'autoload': {
"        \ 'filetypes': ['html', 'xhtml', 'css', 'xml']
"    \}}

" vim-latex {{{2
" lervag/vim-latex
" https://github.com/lervag/vim-latex
" A simple and lightweight vim-plugin for editing LaTeX files.
NeoBundleLazy 'lervag/vim-latex', {
    \ 'autoload': {
        \ 'filetypes':['tex']
    \ }}

" BashSupport {{{2
" BASH IDE -- Write and run BASH-scripts using menus and hotkeys.
" https://github.com/vim-scripts/bash-support.vim
NeoBundleLazy 'vim-scripts/bash-support.vim', {
    \ 'autoload': {
        \ 'filetypes':['sh']
    \ }}

" Vividchalk {{{2
" a colorscheme strangely reminiscent of Vibrant Ink for a
" certain OS X editor
" https://github.com/tpope/vim-vividchalk
" http://www.vim.org/scripts/script.php?script_id=1891
NeoBundle 'tpope/vim-vividchalk.git'

" Vim-Portal {{{2
" Hello and, again, this is the Portal Gun for Vim.
" https://github.com/thinca/vim-portal
NeoBundle 'thinca/vim-portal'

" vim-threes {{{2
" Play Threes! in Vim!
" https://github.com/thinca/vim-threes
NeoBundle 'thinca/vim-threes'

"" TagBar {{{2
"" Vim plugin that displays tags in a window, ordered by class etc.
"" https://github.com/majutsushi/tagbar
"NeoBundle 'majutsushi/tagbar'
"
"" EasyTags {{{2
"" Automated tag file generation and syntax highlighting of tags in Vim
"" https://github.com/xolox/vim-easytags
""@FIXME: Fix the generation process :
"" - Provide a command to generate a tag in a project.
"" - Use specific tag file by project.
"" - Load / Reload only tag file selected by the pwd value project name ?
"" - In theory the base tag file should be provided by a call from the VCS.
"" -
""NeoBundle 'xolox/vim-easytags.git'
""@TODO: Fix easytags call to be lighter
"" EasyTags setup
""let g:easytags_file = '~/.vim/tags/generic'
"" Set tags generic for vim
""set tags='~/.vim/tags/'
""let g:easytags_autorecurse = 1
""let g:easytags_include_members = 1
""let g:easytags_dynamic_file = 2
"" Refresh Tags on write file
""let g:easytags_events = ['BufWritePost']
"" Updtate highlight
""let g:easytags_auto_update = 0
""@TODO: Add async call to avoid freezing vim.
""let g:eastags_async = 1
"
"" TagList {{{2
"NeoBundle 'taglist.vim'
"
"" ROGUE.VIM {{{2
"" katono/rogue.vim
"" Porting of Rogue-clone II for Vim
"NeoBundle 'katono/rogue.vim'
"
"" GUNDO {{{2
"" @TODO: Should be replaced by a unite call
"" Gundo.vim is Vim plugin to visualize your Vim undo tree.
"" sjl / gundo.vim
"" A git mirror of gundo.vim
"" http://sjl.bitbucket.org/gundo.vim/
"" quick setup : http://sjl.bitbucket.org/gundo.vim/#installation
""let g:gundo_width = 60
""let g:gundo_preview_height = 40
""let g:gundo_right = 1
""nnoremap <F5> :GundoToggle<CR>
""===========================================
"NeoBundle 'sjl/gundo.vim.git'
"
"" MatchIt {{{2
"" 20150121: Not usefull because it is in basic vim now.
""extended % matching for HTML, LaTeX, and many other languages
""http://www.vim.org/scripts/script.php?script_id=39
"NeoBundle 'benjifisher/matchit.zip'
"
"" ACK.VIM {{{2
"" https://github.com/mileszs/ack.vim
"" Vim plugin for the Perl module / CLI script 'ack'
"NeoBundle 'mileszs/ack.vim'
"
"" Startify {{{2
"" A fancy start screen for Vim.
"" https://github.com/mhinz/vim-startify
""NeoBundle 'mhinz/vim-startify'
"
"" NerdTree {{{2
"" A tree explorer plugin for vim.
"" https://github.com/scrooloose/nerdtree
""NeoBundle 'scrooloose/nerdtree'
"
"" ChekSyntax {{{2
"" 20150121: Useless avec syntastic.
"" Check a file's syntax when saving a file (php, ruby, tex ...) with vim
"" https://github.com/tomtom/checksyntax_vim
""NeoBundle 'tomtom/checksyntax_vim'
"
"" Project {{{2
"" lcd to the root of the project everytime you BufEnter a file inside a project.
"" https://github.com/amiorin/vim-project
"NeoBundle 'amiorin/vim-project'
"
"" CtrlP {{{2
"" Fuzzy file, buffer, mru, tag, etc finder.
"" https://github.com/kien/ctrlp.vim
""NeoBundle 'kien/ctrlp.vim.git'
"
"" tomorrow-themes-vim {{{2
"" Tomorrow Theme for Vim
"NeoBundle 'd11wtq/tomorrow-theme-vim'
"
"" COLOR {{{2
"" Colour schemes for a variety of editors created by Dayle Rees.
"" http://daylerees.github.io
""NeoBundle 'daylerees/colour-schemes', { "rtp": "vim-themes/" }
"
"
"" SuperTab {{{2
"" https://github.com/ervandew/supertab
"" Perform all your vim insert mode completions with Tab
""NeoBundle 'SuperTab'
"
"" ColorSheme {{{2
"
"" morhetz / gruvbox {{{2
"" Retro groove color scheme for Vim
"" https://github.com/morhetz/gruvbox
"NeoBundle 'morhetz/gruvbox.git'
"
"" zeis / vim-kolor {{{2
"" Vim color scheme.
"" https://github.com/zeis/vim-kolor
"NeoBundle 'zeis/vim-kolor.git'
"
"" junegunn / seoul256.vim {{{2
"" a low-contrast Vim color scheme based on Seoul Colors
"NeoBundle 'junegunn/seoul256.vim.git'
"
"" Moria {{{2
"" A color scheme for GUI supposed to be highly readable
"" http://www.vim.org/scripts/script.php?script_id=1464
"NeoBundle 'vim-scripts/moria'
"
"" Bad Wolf {{{2
"" A Vim color scheme.
"" https://github.com/sjl/badwolf/
"NeoBundle 'sjl/badwolf'
"
"" Molokai {{{2
"" tomasr/molokai
"" Molokai color scheme for Vim
"" https://github.com/tomasr/molokai
"NeoBundle 'tomasr/molokai'
"
"" Zenburn {{{2
"NeoBundle 'Zenburn'
"
"" darkspectrum {{{2
"" @TODO: Complete infos
"NeoBundle 'darkspectrum'
"
"" Matrix Screensaver {{{2
"" 20150121: Break the whole thing drop it.
"" Matrix Screen for VIM
"" https://github.com/uguu-org/vim-matrix-screensaver
"NeoBundle 'uguu-org/vim-matrix-screensaver'

"" Bundle samples {{{2
"" non github repos{{{3
"" CommandT :     ================
""Bundle 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (ie. when working on your own plugin)
""Bundle 'file:///Users/gmarik/path/to/plugin'
"" Just for ex of multi repo {{{3
""NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Old {{{2
" An awesome debugging client for Vim, Xdebug and PHP
" https://github.com/vim-scripts/Xdebug
" NeoComplCache : depercated
" Ultimate auto-completion system for Vim.
" http://www.vim.org/scripts/script.php?script_id=2620
" https://github.com/Shougo/neocomplcache.vim
" NeoBundle 'Shougo/neocomplcache.vim.git'
" Deprecated : If you use Vim 7.3.885 or above with if_lua feature, you should
" use neocomplete. It is faster than neocomplcache.

" NeoBundle end() {{{2
call neobundle#end()
" Required
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Input {{{1
" Searching {{{2
" From http://lambdalisue.hatenablog.com/entry/2013/06/23/071344
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Disable Arrow in insert mode {{{2
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Remap Arrow Up/Down to move line {{{2
" Real Vimmer forget the cross
no <down> ddp
no <up> ddkP

" Remap Arrow Right / Left to switch tab {{{2
no <left> :tabprevious<CR>
no <right> :tabnext<CR>

" Disable Arrow in visual mode {{{2
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Remap netrw arrow {{{2
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

" Change default leader key {{{2
" NOT WORKING
" Note the required backslash.
"let mapleader = "\<space>"
let mapleader = ","
" Permettre l'utilisation de la touche backspace dans tous les cas :
set backspace=2

" Permet de sauvegarder par ctrl + s {{{2
:nmap <c-s> :w<CR>
" Fonctionne aussi en mode edition
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

" Completion avec ctrl + space {{{2
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" MOUSE {{{2
" =======
" Utilise la souris pour les terminaux qui le peuvent (tous ?)
" pratique si on est habitué à coller sous la souris et pas sous le curseur,
" attention fonctionnement inhabituel
set mouse=a

" Tweaking {{{1
" AG {{{2
" if available use ag
" From: http://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Unite {{{2
" Unite and create user interfaces
" http://www.vim.org/scripts/script.php?script_id=3396
" https://github.com/Shougo/unite.vim
" interresting :
" http://www.reddit.com/r/vim/comments/1fpti5/unitevim_the_plugin_you_didnt_know_you_need/
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" nnoremap <C-p> :Unite file_rec/async<cr>
" Unite functions {{{3
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

" Unite Config {{{3
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"let g:unite_data_directory=s:get_cache_dir('unite')
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

" Default filters :
" https://github.com/bling/dotvim/blob/master/vimrc
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" Custom source :
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
" 20150121: old conf:
" http://eblundell.com/thoughts/2013/08/15/Vim-CtrlP-behaviour-with-Unite.html
"call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"    \ 'ignore_pattern', join([
"    \ '\.git/',
"    \ ], '\|'))
"function! s:get_cache_dir(suffix)
"    return resolve(expand(s:cache_dir . '/' . a:suffix))
"endfunction
" Format the unite output to better
call unite#custom#profile('default', 'context', {
    \ 'start_insert': 1,
    \ 'direction': 'botright',
    \ })

" Keep actions shortcut in distinct function: s:unite_settings()
autocmd FileType unite call s:unite_settings()

" Unite mappings {{{3
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

" Emulate ctrl-p behavior quite general unite (all type)
nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

" NeoComplete {{{2
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

" NeoSnippet {{{2
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

" SYNTASTIC {{{2
" Syntax checking hacks for vim
" https://github.com/scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_aggregate_errors         = 1
let g:syntastic_php_checkers             = ['php', 'phpcs', 'phpmd']
" from : https://github.com/scrooloose/syntastic/wiki/PHP%3A---phpcs
let g:syntastic_php_phpcs_args="--encoding=utf-8 --tab-width=4 --standard=PSR2"

" DBEXT {{{2
" vim-scripts/dbext.vim
" Provides database access to many dbms (Oracle, Sybase, Microsoft, MySQL,
" DBI,..)
" http://www.vim.org/scripts/script.php?script_id=356
" https://github.com/vim-scripts/dbext.vim
" help : ':h dbext-tutorial'
" Default database (local)
" MySQL
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd='':dbname=mysql'

" vim-commentary {{{2
" remap for bépo
" if exists(":Commentary")
    xmap gc  <Plug>Commentary
    nmap gc  <Plug>Commentary
    omap gc  <Plug>Commentary
    nmap gcc <Plug>CommentaryLine
    nmap hgc <Plug>ChangeCommentary
    nmap gcu <Plug>Commentary<Plug>Commentary
" endif

" SearchParty {{{2
" Extended search commands and maps for Vim
" Remap * to #
nmap ) <Plug>SearchPartyVisualFindNext
nmap ~ <Plug>SearchPartyVisualFindPrior
nmap & <Plug>SearchPartyVisualFindSubstitute
nmap ^l <Plug>SearchPartyHighlightClear

" Vdebug tweak {{{2
let g:vdebug_keymap = {
    \ "run"               : "<F5>",
    \ "run_to_cursor"     : "<F1>",
    \ "step_over"         : "<F2>",
    \ "step_into"         : "<F3>",
    \ "step_out"          : "<F4>",
    \ "close"             : "<F6>",
    \ "detach"            : "<F7>",
    \ "set_breakpoint"    : "<F10>",
    \ "get_context"       : "<F11>",
    \ "eval_under_cursor" : "<F12>",
    \ "eval_visual"       : "<Leader>e",
    \}

" VimSession {{{2
" Extended session management for Vim (:mksession on steroids)
" https://github.com/xolox/vim-session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
"let g:session_autosave_periodic = 1

" PHP.vim {{{2
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

" filetype detection {{{1
au BufRead /var/log/kern.log set ft=messages
au BufRead /var/log/syslog setl ft=messages
au BufNewFile,BufRead /etc/apache/* setl ft=apache
au BufNewFile,BufRead /etc/apache2/* setl ft=apache
au BufNewFile,BufRead /etc/nginx/* setl ft=nginx
au BufNewFile,BufRead /etc/exim4/* setl ft=exim
au BufNewFile,BufRead *.txt setl ft=text
au BufNewFile,BufRead *.tac setl ft=python " .tac files are used in twisted
au BufNewFile,BufRead *.override setl ft=c " pygobject overrides
au BufNewFile,BufRead *.defs setl syntax=scheme et " pygobject definitions
au BufNewFile,BufRead *.vala setl ft=vala
au BufNewFile,BufRead *.vapi setl ft=vala
au BufNewFile,BufRead *.json setl ft=javascript
au BufNewFile,BufRead *.qml setl ft=javascript
au BufNewFile,BufRead *.otl setl ft=votl
au BufNewFile,BufRead *.jeco setl ft=eco
au BufNewFile,BufRead *.glsl setl ft=c

" Display {{{1
" Folding {{{2
" I like some folding ideas from :
" http://dougblack.io/words/a-good-vimrc.html#colors
set foldmethod=marker
" Then we want it to close every fold by default so that we have this high level
" view when we open our vimrc.
set foldlevel=0

" Show command (usefull for leader) {{{2
set showcmd

" COLOR Syntax {{{2
" Coloration syntaxique, indispensable pour ne pas se perdre dans les longs fichiers
" syntax on
" https://github.com/Shougo/vimshell.vim/issues/73
" Change to syntax enable
syntax enable

" COLORSHEME {{{2
" set the background light or dark
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
" Change le colorsheme en mode diff
if &diff
    colorscheme solarized
endif

" STATUS {{{2
" Show editing mode
set showmode

" VISUAL BELL {{{2
" Error bells are displayed visually.
set visualbell

" RULER {{{2
" SI c'est pas déjà fait, affiche la position du curseur
set ruler

" DIFF {{{2
" Affiche toujours les diffs en vertical
set diffopt=vertical

" Split {{{2
" Set the split below the active region.
set splitbelow

" Display cmd mod {{{2
" Indiquer le nombre de modification lorsqu'il y en a plus de 0
" suite à une commande
set report=0

" Title {{{2
" This is nice if you have something
" that reset the title of you term at
" each command, othersize it's annoying ...
set title

" Show Special Char {{{2
" show tabs / nbsp / trailing spaces
set listchars=tab:··,trail:¤,extends:>,precedes:<
set list

" HighLight 81 col {{{2
" From «More Instantly Better Vim» - OSCON 2013
" http://youtu.be/aHm36-na4-4
highlight OverLength ctermbg=darkblue ctermfg=white guibg=darkblue guibg=white
call matchadd('OverLength', '\%81v', 100)
"=====[ Comments are important ]==================
" Highlight TODO:
highlight todo ctermbg=darkcyan ctermfg=white guibg=darkcyan guibg=white
call matchadd('todo', 'TODO\|@TODO', 100)
" Highlight MAIL:
call matchadd('todo', 'MAIL\|mail', 100)
" Highlight misspelled word
highlight SpellBad cterm=underline
" Highlight bugfix / fixme
highlight fix ctermbg=darkred ctermfg=white guibg=darkred guibg=white
call matchadd('fix', 'BUGFIX\|@BUGFIX\|FIXME\|@FIXME', 100)
" Highlight author
highlight author ctermfg=brown guibg=brown
call matchadd('author', 'author\|@author', 100)

" SHOW NON-BREAKABLE SPACE {{{2
" colorise les nbsp
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

" Cursor {{{2
" Keep 3 line before / after cursor.
set scrolloff=3
" SHOW CURRENT LINE :
set cursorline
"SHOW CURRENT COLUMN :
set cursorcolumn
" SHOW CURSOR
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" LINE NUMBER {{{2
" Show line number
set number
" Show number relative from the cursor
set relativenumber

" STATUS BAR {{{2
" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Config {{{1
" Syntax {{{2
" The colors get messed up when I scroll. Vim uses various heuristics to save
" time when determining the highlighting, and sometimes they cause problems.
" Look up :h syn-sync for a more detailed explanation.
"syn sync fromstart
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
" Do not tab expand on Makefile
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
" Utilise shiftwidth à la place de tabstop en début de ligne (et backspace supprime d'un coup si ce sont des espaces)
set smarttab
" 20140901: Add for test.
" redraw only when we need to.
set lazyredraw
" autoindent n'est spécifique à aucun langage et fonctionne en général moins bien
set noautoindent
" Detection de l'indentation
set cindent
set smartindent

" ENCODING {{{2
" Use UTF-8.
set encoding=utf-8

" Modeline {{{2
set modeline modelines=5
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"let g:git_modelines_allowed_items = [
"    \ "textwidth",   "tw",
"    \ "softtabstop", "sts",
"    \ "tabstop",     "ts",
"    \ "shiftwidth",  "sw",
"    \ "expandtab",   "et",   "noexpandtab", "noet",
"    \ "filetype",    "ft",
"    \ "foldmethod",  "fdm",
"    \ "readonly",    "ro",   "noreadonly", "noro",
"    \ "rightleft",   "rl",   "norightleft", "norl",
"    \ "cindent",     "cin",  "nocindent", "nocin",
"    \ "smartindent", "si",   "nosmartindent", "nosi",
"    \ "autoindent",  "ai",   "noautoindent", "noai",
"    \ "spell",
"    \ "spelllang"
"    \ ]

" TERM TYPE {{{2
" Let's use screen-256
" From: http://reyhan.org/2013/12/colours-on-vim-and-tmux.html
"set term=screen-256color
"set term=rxvt-unicode-256color
" Just for vimShell
"let g:vimshell_environment_term='rxvt-unicode-256color'

" Clipboard {{{2
" Set the clipboard if running inside X11
if has("X11")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" SEARCH {{{2
" Recherche en minuscule -> indépendante de la casse,
" une majuscule -> stricte
set smartcase
" Ne jamais respecter la casse
" (attention totalement indépendant du précédent mais de priorité plus faible)
set ignorecase
" Déplace le curseur au fur et a mesure qu'on tape une recherche,
" pas toujours pratique, j'ai abandonné
set incsearch
" Met en évidence TOUS les résultats d'une recherche,
" A consommer avec modération
set hlsearch
" Déplacer le curseur quand on écrit un (){}[]
" (attention il ne s'agit pas du highlight
set showmatch
" Affiche le nombre de lignes sélectionnées en mode visuel
" ou la touche/commande qu'on vient de taper en mode commande
set showcmd

" PASTE / NOPASTE {{{2
"@TODO: Not certain if really needed
" A utiliser en live, paste désactive l'indentation automatique
" (entre autre) et nopaste le contraire
set nopaste

" COMPLETION MENU {{{2
" Show autocomplete menus.
set wildmenu
" Afficher une liste lors de complétion de commandes/fichiers :
set wildmode=list:full
" Allow completion on filenames right after a '='.
" Uber-useful when editing bash scripts
set isfname-==

" On peut passer rapidement du mode paste au mode nopaste avec un raccourcis,
" builtin sur les versions récentes de vim >= 7,
" sinon il faudrait créer une fonction :
" 20141009: Disable the switch I did not use it.
"set pastetoggle=<F5>

" BACKUP {{{2
" Modif tmp
set swapfile
" Modif tmp
let g:dotvim_backup=expand('$HOME') . '/.vim/backup'
if ! isdirectory(g:dotvim_backup)
    call mkdir(g:dotvim_backup, "p")
endif
set directory=~/.vim/backup

" Backups with persistent undos {{{2
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

" LINE WRAPPING {{{2
" Laisse les lignes déborder de l'écran si besoin
"set nowrap
" Ne laisse pas les ligne deborder de l'écran
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak
" Size of the linewrapping
set textwidth=80

" SPELL CHECKER {{{2
" @TODO: Remap the mapping of the spell checker
" @TOOD: Support auto detection of the sentence language,
"        so it can support multi language fr / us / en / etc (jpn)
" En live pour quand vous écrivez anglais (le fr est à trouver dans les méandres du net)
" Chiant pour programmer, mais améliorable avec des dico
    " perso et par languages
set spell
" [s / ]s : saute au prochain / précédant mot avec faute.
    " z= : affiche la liste de suggestion pour corriger.
set spelllang=fr,en

" MOVE CURSOR {{{2
" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

" Stay on the same column if possible {{{2
" Tenter de rester toujours sur la même colonne lors de changements de lignes :
set nostartofline

" COMMAND HISTORY {{{2
" Nombre de commandes maximale dans l'historique :
set history=10000

" AutoCmd {{{1
" AutoReLoad vimrc {{{2
" Auto apply modification to vimrc
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" SESSION {{{2
" Récupération de la position du curseur entre 2 ouvertures de fichiers
" Parfois ce n'est pas ce qu'on veut ...
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif

" Functions {{{1
" Format json selection {{{2
map <Leader>j !python -m json.tool<CR>

" SAVE as ROOT {{{2
" use :W to sudo-write the current buffer
command! W w !sudo tee % > /dev/null

" CLOSING {{{2
" ZZ now saves all files, creates a session and exits
function! AutocloseSession()
    " if g:SessionLoaded || !filereadable(g:SessionPath)
    "     exec 'mksession! ' . g:SessionPath
    " endif
    wqall
endfunction
noremap <silent> ZZ :call AutocloseSession()<CR>


" OpenTab and lcd to the file {{{2
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

" Remove trailing whitespace {{{2
function! CleanWhiteSpace()
    let l = line(".")
    let c = col(".")
    :%s/\s\+$//e
    let last_search_removed_from_history = histdel('s', -1)
    call cursor(l, c)
endfunction()
command! -nargs=0 CleanWhiteSpace :call CleanWhiteSpace()

" Convert DOS line endings to UNIX line endings {{{2
function! FromDos()
    %s/\r//e
endfunction
command! FromDos call FromDos()

" Auto Chmod {{{2
" Automatically give executable permissions if file begins with #! and
" contains '/bin/' in the path
function! MakeScriptExecuteable()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod +x <afile>
    endif
endfunction

" Mkdir Create missing directory {{{2
" Used to create missing directories before writing a
" buffer
function! MkdirP()
    :!mkdir -p %:h
endfunction
command! MkdirP call MkdirP()

" SHEBANG {{{2
" shebang automatique lors de l'ouverture nouveau
" d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
" shell
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
" python
:autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: UTF8 -*-\<nl>\<nl>\"|$
" php
:autocmd BufNewFile *.php 0put=\"<?php\<nl>// -*- coding: UTF8 -*-\<nl>\<nl>\"|$
