set encoding=utf-8
scriptencoding=utf-8
set clipboard+=unnamed
set mouse=a

if &compatible
  set nocompatible
endif

filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'MattesGroeger/vim-bookmarks'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mattn/vim-sonictemplate'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'cohama/lexima.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'chrisbra/csv.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'folke/tokyonight.nvim'

call plug#end()

nnoremap <silent> ts :tabe<CR> 
nnoremap <silent> tc :tabclose<CR> 
nnoremap <C-w>s <C-w>v
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる

"文字コードをUFT-8に設定
set fenc=utf-8
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
" プレビューを無効化
"set completeopt=menuone

" 見た目系
" 行番号を表示
set number
" 行番号を相対的に表示
set relativenumber
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ステータスラインを常に表示
set laststatus=2

" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent
" cindent を有効
set cindent

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

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

" set clipboard+=unnamed
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap <C-[><C-[> :nohlsearch<CR><Esc>

" if hidden is not set, TextEdit might fail.
set hidden
" always show signcolumns
set signcolumn=yes

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" ドットファイルをデフォルトで表示
let g:fern#default_hidden = 1

" Terminal のインサートモードを抜けるコマンドを変更
:tnoremap <C-[> <C-\><C-n>

colorscheme lucius

" Lightline
let g:lightline = {
        \ 'colorscheme': 'tokyonight',
        \ 'tabline': {
        \   'left': [ ['buffers'] ],
        \ },
        \ 'component_expand': {
        \   'buffers': 'lightline#bufferline#buffers'
        \ },
        \ 'component_type': {
        \   'buffers': 'tabsel'
        \ }
        \ }
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
" transparent background in statusbar
let l:palette = lightline#palette()

let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let l:palette.inactive.middle = l:palette.normal.middle
" let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction

hi CursorLineNr ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE
hi SignColumn ctermbg=NONE
hi LineNr ctermfg=NONE ctermbg=NONE

" --- Coc.nvim settings ---
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Use <C-k> for jump to next placeholder.
let g:coc_snippet_next = '<c-k>'

" Use <C-j> for jump to previous placeholder.
let g:coc_snippet_prev = '<c-j>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc.nvim mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gk <Plug>(coc-float-jump)
nmap <C-n> <Plug>(coc-rename)

" vim-fmt でのインデントをスペース4つ分に変更
au FileType go setlocal sw=4 ts=4 sts=4 noet

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" Add missing imports on save when editing go files
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Disable split window documentation by vim-go plugin
let g:go_doc_keywordprg_enabled = 0

nnoremap <C-m> :Fern . -reveal=% -drawer -toggle -width=40<CR>

