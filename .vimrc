""""""""""""""""""""""""""""""
" Plugの導入
""""""""""""""""""""""""""""""
call plug#begin()
  " ファイルをtree表示してくれる
  Plug 'scrooloose/nerdtree'
  map <C-n> :NERDTreeToggle<CR>

  " コメントON/OFFを手軽に実行
  Plug 'tomtom/tcomment_vim'

  " 複数行を一気にコメントアウトできる
  Plug 'tpope/vim-commentary'

  " Gitの追加/削除/変更された行を行番号の左に表示してくれる
  Plug 'airblade/vim-gitgutter'

  " vimのsyntaxを強化
  Plug 'sheerun/vim-polyglot'

  " インデントに色を付けて見やすくする
  Plug 'nathanaelkane/vim-indent-guides'

  " 行末の半角スペースを可視化
  Plug 'bronson/vim-trailing-whitespace'

  " 対応する閉タグを自動生成
  Plug 'jiangmiao/auto-pairs'

  " htmlなどの閉じタグを自動生成
  Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.html,*.erb,*.vue,*.js'

  " javascript用のsyntaxハイライト
  Plug 'othree/yajs.vim'

  " javascript開発用プラグイン
  Plug 'pangloss/vim-javascript'

  " vue.js用のsyntaxハイライト
  Plug 'posva/vim-vue'

  "タグや括弧等を編集しやすくする
  Plug 'tpope/vim-surround'

  " スニペット
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'

  " vim colorscheme
  Plug 'jacoborus/tender.vim'
call plug#end()

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ステータス行に現在のgitブランチを表示する
" set statusline+=%{fugitive#statusline()}

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 入力中のコマンドを表示する
set showcmd

" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vimbackup

" 検索結果をハイライト表示する
set hlsearch

" 暗い背景色に合わせた配色にする
set background=dark

" タブ入力を複数の空白入力に置き換える
set expandtab

" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" 不可視文字を表示する
set list

" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<

" 行番号を表示する
set number

" 対応する括弧やブレースを表示する
set showmatch

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" タブ文字の表示幅
set tabstop=2

" Vimが挿入するインデントの幅
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 構文毎に文字色を変化させる
syntax enable

set background=dark

" コメントの色
hi Comment ctermfg=grey

" 行番号の色
" highlight LineNr ctermfg=lightblue

" 勝手に改行するのを防ぐ
" set textwidth=0
set formatoptions=q

" textwidthでフォーマットさせたくない
set formatoptions=q

" 行頭へ移動
noremap <C-a> ^
" 行末へ移動
noremap <C-g> $
" インサートモードでの移動
" inoremap <C-h> <Left>
" インサートモードでの移動
inoremap <C-l> <Right>
" インサートモードでの移動
inoremap <C-k> <Up>
" インサートモードでの移動
inoremap <C-j> <Down>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

colorscheme tender

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on


