" SET VARS {{{
" ----------------------------------------------------------------
let s:is_win = has('win32') || has('win64')
let s:is_mac = has('mac')
" }}}

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
  
  " Required:
  set runtimepath+=/home/ec2-user/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/ec2-user/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/BlockDiff'
NeoBundle 'tetsuwo/unchi.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'editorconfig/editorconfig-vim'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" BASIC SETTING {{{
" ----------------------------------------------------------------
let mapleader = "," 
syntax on
set t_Co=256
set iminsert=0     " ime off when the INSERT-MODE
set number         " indicate line number
"set columns=100   " window width
"set lines=50      " window height
set nocompatible   " Vi互換off
set hidden         " 新たに開く場合に変更中のファイルを保存しないで他のファイル表示
set incsearch      " incremental search
set smartcase      " 検索時に大文字小文字混合の場合のみ、大文字小文字通りに処理それ以外は大文字小文字無視
set wrapscan       " when search not loop
set imsearch=0     " ime of when searching
set nolist         " タブ文字、行末等の不可視文字非表示
" listの文字指定
set listchars=eol:$,tab:>\ ,extends:< 
set tabstop=4        " tabサイズ
set expandtab        " タブをスペースに展開しない (expandtab:展開する)
set shiftwidth=4
set autoindent       " インデントを現在行と同一化
set cindent          " C言語型インデント
set smartindent      " 新しい行は自動インデント
set fileformat=unix  " 改行コード
set fileformats=unix,dos
set backspace=2 " backspaceでindent、改行を削除
" 行頭行末でカーソルを止めない
set whichwrap=b,s,h,l,<,>,[,] 
set formatoptions+=mM " 自動折返しを日本語対応
set showmatch     " 閉じカッコ挿入時に対応カッコ強調
"set noswapfile    " swapを作らない
"set nobackup      " backupを作らない
set backupdir=~/.vim/tmp  " backup files
set directory=~/.vim/tmp  " swap files
set autoread      " 同時編集しているファイルが更新された場合、追随更新
set wildmenu      " コマンドライン補完強化
set cmdheight=2   " コマンドラインの高さ
set showcmd       " コマンドをステータス行に表示
set title         " titleを表示
set statusline=\%t\%=\[%{&filetype}]\[%{&fileencoding}] " indicate status bar
set laststatus=2            " indicate last status bar
set diffopt=filler,iwhite   " diff
set splitbelow              " window split direction
set visualbell t_vb=        " beep tone sound
" vimdiff時の不要な表示をしない
set diffopt-=filler diffopt=iwhite,vertical  
set browsedir=buffer " ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に指定
set undodir=~/.vim/undo
set runtimepath+=~/.vim/

" for highlight 
set hlsearch
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?                
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
autocmd ColorScheme * highlight Search ctermfg=0 ctermbg=216

"
" winの場合、クリップボード連携
if s:is_win
  set clipboard=unnamed
  endif

  " encoding
  set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
  " }}}

" FUNCTION SETTING {{{
" ----------------------------------------------------------------
function! PHPLint()
    let result = system( &ft . ' -l ' . bufname(""))
    echo result
endfunction
" }}}

" EACH FILE SETTING {{{
" ----------------------------------------------------------------
autocmd BufWritePost *.php call PHPLint()
autocmd BufNewFile,BufRead *.twig set filetype=php
" }}}

colorscheme molokai


