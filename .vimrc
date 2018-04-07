syntax on
set ts=2 sw=2
set softtabstop=2
set number

"---------------------------------------
""ゆとり仕様(カーソルキーとかBSキーとか)
"---------------------------------------
""viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
""BSで削除できるものを指定する
" indent  : 行頭の空白
" " eol     : 改行
" " start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
set t_Co=256
colorscheme molokai
set fileencoding=utf-8
augroup InsertHook
   autocmd!
   autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
   autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
set clipboard+=unnamed
set history=1000
augroup vimrcEx
   autocmd!
   autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line('$') |
			\   exe "normal! g`\"" |
			\ endif
augroup END

set ruler
set cursorline 
set cursorcolumn 
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
set showmatch 
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
   augroup InsertHook
	  autocmd!
	  autocmd InsertEnter * call s:StatusLine('Enter')
	  autocmd InsertLeave * call s:StatusLine('Leave')
   augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCでキー入力待ちになる対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
   if a:mode == 'Enter'
	  silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
	  silent exec g:hi_insert
   else
	  highlight clear StatusLine
	  silent exec s:slhlcmd
	  redraw
   endif
endfunction 

function! ZenkakuSpace()
   highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
   augroup ZenkakuSpace
	  autocmd!
	  " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
	  autocmd ColorScheme       * call ZenkakuSpace()
	  " 全角スペースのハイライト指定
	  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
   augroup END
   call ZenkakuSpace()
endif
set showmatch matchtime=1
set showmatch matchtime=1
"タブを設定
"set ts=4 sw=4 sts=4
"自動的にインデントする
set autoindent
set smartindent
"Cインデントの設定
set cinoptions+=:0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
   syntax on
endif
"#############################################


" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
   if &compatible
	  set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"" エラーが発生してる
NeoBundle 'Shougo/neosnippet-snippets'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neosnippet'
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'plasticboy/vim-markdown'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
au BufRead,BufNewFile *.md set filetype=markdown

" auto comment off
augroup auto_comment_off
   autocmd!
   autocmd BufEnter * setlocal formatoptions-=r
   autocmd BufEnter * setlocal formatoptions-=o
augroup END

hi Comment ctermfg=2000

"--- <F6>  タイムスタンプを挿入してinsertモードへ移行 ----
nmap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><CR>
