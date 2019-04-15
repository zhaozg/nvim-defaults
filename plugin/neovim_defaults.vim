" plugin/neovim_defaults.vim - Neovim defaults for Vim
" Maintainer: Noah Frederick

if exists('g:loaded_neovim_defaults') || &compatible
  finish
else
  let g:loaded_neovim_defaults = 1
endif
" basic setting {{{1 "
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Settings based on :help nvim-defaults
set autoindent
set autoread
set updatetime=200
set backspace=indent,eol,start
set backupdir=~/.local/share/nvim/backup
set belloff=all
set complete-=i
set cscopeverbose
set directory=~/.local/share/nvim/swap//
set display=lastline
set encoding=utf-8
set fillchars=vert:│,fold:·
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
if exists('+langremap') && has('langmap')
  set langnoremap
endif
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set mouse=a
set nrformats=hex
set ruler
set sessionoptions-=options
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set undodir=~/.local/share/nvim/undo
set wildmenu

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif
" 1}}} "

" UI setting {{{ "
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase     " Case insensitive search
set smartcase      " ... but case sensitive when uc present
set scrolljump=5   " Line to scroll when cursor leaves screen
set scrolloff=4    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set shiftwidth=2   " Use indents of two spaces
set tabstop=2      " An indentation every two columns
set softtabstop=2  " Let backspace delete indent
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
set autowrite      " Automatically write a file when leaving a modified buffer
set mousehide      " Hide the mouse cursor while typing
set hidden         " Allow buffer switching without saving
set t_Co=256       " Use 256 colors
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen
" }}} UI setting "

" misc setting {{{ "
set nrformats=hex
set tabpagemax=50

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists("g:loaded_matchit") && findfile("plugin/matchit.vim", &runtimepath) ==# ""
  runtime! macros/matchit.vim
endif

if (has("termguicolors"))
  set termguicolors
endif

set cursorline " Highlight current line

set relativenumber number " Show relative line numbers and show actual line number on current line

set showtabline=2 " Always show tabline

set wrap linebreak " Wrap long line, don't break words

set expandtab
""" Tabs are Spaces
" Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
"	   'expandtab'.  This way you will always insert spaces.  The
"	   formatting will never be messed up when 'tabstop' is changed.

set shiftround
" Round indent to multiple of 'shiftwidth' when indenting with > and <
set smartindent " Do smart autoindenting when starting a new line

""" Auto commands
" Toggle hl off when entering insert mode ...
autocmd InsertEnter * :setlocal nohlsearch
" ... Toggle back on when leaving
autocmd InsertLeave * :setlocal hlsearch

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_ut=

set winminheight=0
set wildmode=list:longest,full

set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries
" }}} misc setting "

" encoding setting {{{ "
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" }}} encoding setting "

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows

" Change cursor shape for iTerm2 on macOS {
  " bar in Insert mode
  " inside iTerm2
  if $TERM_PROGRAM =~# 'iTerm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

" inside tmux
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif
" }

set backup
set foldenable
set foldmarker={,}
set foldlevel=0
set foldmethod=marker
set foldcolumn=3
set foldlevelstart=99

set cursorline              " Highlight current line
set fileformats=unix,dos,mac        " Use Unix as the standard file type

highlight clear SignColumn  " SignColumn should match background
" highlight clear LineNr      " Current line number row will have same background color in relative mode

if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

if has('persistent_undo')
  set undofile             " Persistent undo
  set undolevels=1000      " Maximum number of changes that can be undone
  set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
endif

if has('gui_running')
  set guioptions-=r        " Hide the right scrollbar
  set guioptions-=L        " Hide the left scrollbar
  set guioptions-=T
  set guioptions-=e
  set shortmess+=c
  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set visualbell t_vb=
endif


" vim: fdm=marker:sw=2:sts=2:et
