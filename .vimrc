set nocompatible

" for neobundle
if has('vim_starting')
    set nocompatible " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'windows' : 'make -f make_mingw32.mak',
            \     'cygwin'  : 'make -f make_cygwin.mak',
            \     'mac'     : 'make -f make_mac.mak',
            \     'unix'    : 'make -f make_unix.mak',
            \    },
            \ }

NeoBundleLazy 'Shougo/neocomplete.vim', {
            \ 'autoload' : {
            \     'insert' : 1,
            \ }}

NeoBundle 'c9s/perlomni.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/unite.vim'
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "jceb/vim-hier"
NeoBundle "dannyob/quickfixstatus"

" plugin config
let g:vimproc_dll_path  = $HOME.'/.vim/bundle/vimproc/autoload/vimproc_mac.so'
let g:quickrun_config = {}

let g:quickrun_config._    = {'runner' : 'vimproc'}
let g:quickrun_config.perl = {'command' : 'perl', 'cmdopt': '-MProject::Libs' }

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" オムニ補完の関数呼び出し, 動作重め
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case  = 1
let g:unite_enable_smart_case   = 1

" auto reload vimrc when edited.
autocmd! bufwritepost .vimrc source ~/.vimrc

" interface & color
syntax on
set number
set list
set listchars=tab:>-,trail:_,extends:\
set t_Co=256
set hlsearch

colorscheme Tomorrow-Night

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

" tab
set expandtab
set tabstop=4
set shiftwidth=4

" コピペ
set clipboard+=autoselect,unnamed

" カーソル移動
set whichwrap=b,s,h,l,<,>,[,] " http://vimwiki.net/?%27whichwrap%27
set backspace=indent,eol,start

" backup, swap, viminfo
" http://nanasi.jp/articles/howto/file/seemingly-unneeded-file.html#id5
set noswapfile
set nobackup

" 前回終了させた場所で再開
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 全角のあれこれ(効いてない気がする)
set ambiwidth=double

" 全角スペースがあれこれ
hi ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=#ffffff
au BufNewFile,BufRead * match ZenkakuSpace /　/

" ショートカット
nmap ,rp  :<C-u>Ref perldoc<Space>
nmap ,rpm :<C-u>Ref perldoc -m<Space>
nmap ,j   :%!python -m json.tool<CR>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap <C-p> :Unite source<CR>

"  filetype
filetype plugin indent on
autocmd FileType javascript execute ':setlocal tabstop=2'
autocmd FileType jsx        execute ':setlocal tabstop=2'
autocmd FileType html       execute ':setlocal tabstop=2'
autocmd Filetype html       execute ':setlocal shiftwidth=2'
autocmd FileType css        execute ':setlocal tabstop=2'
autocmd Filetype css        execute ':setlocal shiftwidth=2'
autocmd FileType ruby       execute ':setlocal tabstop=2'
autocmd Filetype ruby       execute ':setlocal shiftwidth=2'

autocmd BufEnter *.node    execute ":setlocal filetype=javascript"
autocmd BufEnter *.t       execute ":setlocal filetype=perl"
autocmd BufEnter *.psgi    execute ":setlocal filetype=perl"
autocmd BufEnter cpanfile  execute ":setlocal filetype=perl"
autocmd BufEnter *.coffee  execute ":setlocal filetype=coffee"
autocmd BufEnter *Cakefile execute ":setlocal filetype=coffee"
autocmd BufEnter *.md      execute ":setlocal filetype=markdown"
autocmd BufEnter *.dart    execute ":setlocal filetype=dart"
autocmd BufEnter *.tx      execute ":setlocal filetype=xslate"
autocmd BufEnter *.mt      execute "setlocal filetype=tmt2html"

NeoBundleCheck
