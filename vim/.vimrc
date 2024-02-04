"===============================================================================
" basic-setting.vim
"===============================================================================

"-----[ 一般設定 ]------------------------------------------------------------- 
set t_Co=256                  "256色化
set fenc=utf-8                "文字コードをUFT-8に設定
set history=100               "コロンコマンドを記録する数
set helplang=ja,en            "vimのヘルプ機能を日本語化
set background=dark           "黒背景を指定
set ambiwidth=double          "記号などで字が潰れるのを防ぐ
set clipboard+=unnamed        "クリップボードを有効化
set fileformats=unix,dos,mac  "改行コード識別
set hid                       "編集中の内容を保持して別画面に切り替え
set ruler                     "カーソルの位置を表示
set hidden                    "バッファが編集中でもその他のファイルを開けるように
set showcmd                   "入力中のコマンドをステータスに表示
set notitle                   "vimを使ってくれてありがとうを非表示
set autoread                  "外部のエディタで編集中のファイルが変更されたら自動で読み直す
set nobackup                  "バックアップファイルを作らない
set noswapfile                "スワップファイルを作らない

" タブ、空白、改行を可視化
set list                      "制御文字を表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"バッファ
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

"-----[ 装飾関連 ]------------------------------------------------------------- 
set laststatus=2           "ステータスラインを常に表示
set virtualedit=onemore    "行末の1文字先までカーソルを移動できるように
set wildmode=list:longest  "コマンドラインの補完
set title                  "タイトルをウィンドウ枠に表示
set ruler                  "カーソルの現在値を表示
set showcmd                "入力中のコマンドをステータスに表示
set wildmenu               "補間候補を表示
set showmatch              "括弧入力時の対応する括弧を表示
set visualbell             "ビープ音を可視化
set smartindent            "インデントはスマートインデント
set nocursorline           "カーソル行のハイライトを無効化
set nocursorcolumn         "カーソル列のハイライトを無効化
set norelativenumber       "行番号の表示を無効化

" 行番号の表示切り替え
nnoremap <Space>n :set invnumber<CR>

"ステータスラインに文字コードと改行文字を表示
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=%l,%c%V%8P
endif

"折り返し時に表示行単位での移動できるように
nnoremap j gj
nnoremap k gk

"シンタックスハイライトの有効化・80文字でラインを可視化
syntax on
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  "対象言語
  autocmd FileType sh,vim,sql,scala,html,css,scss,js,ts,vue,go setlocal textwidth=80
endif

"VSCodeライクなカラースキーマに変更
let g:airline_theme = 'codedark'

"-----[ 編集、文書整形関連 ]----------------------------------------------------
set tabstop=2                   "タブ幅
set textwidth=0                 "自動改行を無効化
set shiftwidth=2                "cindentやautoindent時に挿入されるタブ幅
set softtabstop=0               "インサート時の見た目上の空白数を設定
set formatoptions=q             "gq で選択部分をコメント整形
set backspace=indent,eol,start  "削除できる文字範囲を指定
set expandtab                   "タブ入力を空白文字に置換
set autoindent                  "改行時のカレント行のインデントをキープ

" HTMLとXMLの閉じタグの補完
augroup MyXML
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" </ でHTMLの閉じタグ補完
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml,html,css,scss,scala,vue,js,ts inoremap <buffer> </ </<C-x><C-o><ESC>F<i
augroup END

" インサートモード時のキーマッピング
" ()と{}と[]と引用符の補完
inoremap (<Enter> ()<Left>
inoremap {<Enter> {}<Left>
inoremap [<Enter> []<Left>
inoremap "<Enter> ""<Left>
inoremap '<Enter> ''<Left>
inoremap `<Enter> ``<Left>

"inoremap {<Space> {}<Left><CR><ESC><S-o>
inoremap [<Space> []<Left><CR><ESC><S-o>

" インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" cp でペーストモードに
nnoremap cp :set paste<CR>

"インサート解除時にペーストモードを解除
autocmd InsertLeave * set nopaste

"-----[ 検索関連 ]--------------------------------------------------------------
set ignorecase  "検索文字列が小文字の場合は大文字小文字を区別しない
set smartcase   "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan    "検索時に最後まで行ったら最初に戻る
set incsearch   "検索文字列入力時に順次対象文字列にヒットさせる
set hlsearch    "検索結果文字列のハイライトを有効に

"Escで検索時のハイライトを無効化
nmap <Esc><Esc> :nohlsearch<CR><Esc>
