" plugin/neovim_defaults.vim - Neovim defaults for Vim
" Maintainer: Noah Frederick

if exists('g:loaded_neovim_defaults') || &compatible
  finish
else
  let g:loaded_neovim_defaults = 1
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Settings based on :help nvim-defaults
set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set cscopeverbose
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
set mouse=
set nrformats=hex
set ruler
set sessionoptions-=options
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!
set wildmenu

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" vim: fdm=marker:sw=2:sts=2:et
