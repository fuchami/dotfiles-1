"python3 settings--------------------
let g:python_host_prog3 = expand($HOME) . '/.pyenv/shims/python3'
"end python3 settings----------------

"dein settings---------------------------
if &compatible
  set nocompatible
endif

" directory plugin installed
let s:dein_dir = expand('~/.cache/dein')
" directory dein.vim installed
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if dein.vim isn't installed, download from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" begin settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " plugin list TOML
  let g:rc_dir    = expand('~/dotfiles/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " load TOML, cache
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif

" check install
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"End dein settings^-----------------------

"ale settings-----------------------------
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
"End ale settings-------------------------

"emmet settings---------------------------
let g:user_emmet_settings = {
\ 'variables': {
\ 'lang' : 'ja'
\ }
\}
"End emmet settings-----------------------

"NERDTree settings------------------------
map <C-e> :NERDTreeToggle<CR>
"End NERDTree settings--------------------

" lightline settings----------------------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" End lightline settings------------------

" general settings
" 文字コードをUTF-8に設定
set fenc=utf-8
" 記号が崩れないようにする
set ambiwidth=double
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" マウスを使えるようにする
" set mouse=a

" 見た目系
" カラースキーム
set background=dark
colorscheme lucius
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
