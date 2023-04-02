if &compatible
  set nocompatible
endif

if ( has('mac') || has('unix') )
  set shell=/bin/zsh
else
  set shell=/bin/bash
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'


if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_dir)
  let s:toml_dir = expand('~/dotfiles/nvim')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy':0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy':1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,cp932,sjis,utf-16le

if ( has('win32') || has('win64') )
  set fileformats=dos,unix
else
  set fileformats=unix,dos
endif

colorscheme slate
"set statusline=%F%m%h%w\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ %=[CODE=0x%02B]\ [POS=%l/%L(%02v)]
set laststatus=2
set ruler
set showmode
set showcmd
set number
set cursorline

set hidden
set wildmenu
set clipboard=unnamed
set iminsert=0
set imsearch=-1
inoremap <silent><ESC> <ESC>:set iminsert=0<CR>

set autoindent
set noundofile
set backup
if ( has('win32') || has('win64') )
  set backupdir=$TEMP
else
  set backupdir=/tmp
endif
set noswapfile

set shiftwidth=4 softtabstop=0 tabstop=4
set expandtab
set smartindent
set splitbelow
set splitright

set hlsearch
set incsearch
set ignorecase

let mapleader = "\<Space>"

set vb t_vb=
set noerrorbells
set novisualbell


inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>

inoremap " ""<LEFT>
inoremap ' ''<LEFT>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk


nnoremap / /\v
nnoremap ? ?\v
nnoremap <Leader>a :<C-u>set nohlsearch!<CR>

highlight LineNr ctermfg=red
highlight LineNr ctermbg=none
