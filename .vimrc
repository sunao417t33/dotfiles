" Leaderをスペースにする
let mapleader = "\<Space>"

" runtimepathにカスタマイズ用の設定ディレクトリを追加
set runtimepath+=$HOME/vim/after/

""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github からダウンロードする
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state('~/.vim/dein/')
  call dein#begin('~/.vim/dein/')

  let g:rc_dir      = expand('~/dotfiles/vim')
  let s:toml        = g:rc_dir . '/dein.toml'
  let s:lazy_toml   = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 0})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" 手動でインストールするためコメントアウト"
""if dein#check_install()
""  call dein#install()
""endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
""""""""""""""""""""""""""""""""""""""""""""""""""
" 行番号の表示
set number
" 行列番号の表示
set ruler
" ペアの括弧ハイライト
set showmatch
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf-8 
" ファイル書き込み時の文字エンコード
set fileencoding=utf-8
" ファイル読み込み時の文字エンコード
set fileencodings=utf-8,euc-jp,cp932
" スクロール時の下が見えるようにする
set scrolloff=5
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
" .swapファイルを作成しない
set noswapfile
" バックアップファイルを作成しない
set nowritebackup
" バックアップを無効
set nobackup
" ビープ音を消す
set  vb t_vb=
set noerrorbells
set novisualbell
autocmd GUIEnter * set vb t_vb=

" マウス操作を有効にする
set mouse=a

if !has('nvim')
  set ttymouse=sgr
endif
" OSのクリップボードを使う
set clipboard=unnamed
" 改行時に前の行のインデントを継続
set autoindent
" タブ入力を空白文字に変更
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" Vimが挿入するインデント幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行の構文をチェックし次の行のインデントを増減
set smartindent
" 行頭の余白内でTabが shiftwidth の数だけインデントする
set smarttab

" 不可視文字を表示する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"hi NonText    ctermbg=None ctermfg=17 guibg=NONE guifg=None
"hi SpecialKey ctermbg=None ctermfg=17 guibg=NONE guifg=None

" インクリメンタルサーチ
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" <Space> + a でハイライトを切替え
nnoremap <Leader>a :<C-u>set nohlsearch!<CR>
" カーソル行のハイライト
set cursorline
" カーソル左右の移動で行末から次の行への移動が可能
set whichwrap=b,s,h,l,<,>,[,],~
" 表示行単位でカーソルを移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" コマンドモードの補完
set wildmenu
set wildmode=full
" コマンド履歴
set history=5000
" bashを使用
set shell=/bin/bash

" 括弧の補完
"inoremap { {}<LEFT>
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>

" クオーテートの補完
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>

"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

" Ctrl + hjklだけでウィンドウ移動できるようにする
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" 拡張正規表現をデフォルトにする
nnoremap / /\v
nnoremap ? ?\v

" カラースキーム
set t_Co=256
set background=dark
colorscheme jellybeans

" 行番号を赤色にする
highlight LineNr ctermfg=red

