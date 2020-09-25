" plug config
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
"Plug 'djoshea/vim-autoread'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'easymotion/vim-easymotion'
Plug 'swordjjjkkk/vim-monokai'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'Chiel92/vim-autoformat'
Plug 'StanAngeloff/php.vim'
Plug 'swordjjjkkk/coc-todolist', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

let g:indentLine_setConceal=0

"COC PLUGIN
let g:coc_global_extensions=['coc-json','coc-phpls', 'coc-highlight','coc-pairs','coc-snippets','coc-clangd','coc-cmake','coc-python','coc-sh','coc-translator' ]
"basic config
set runtimepath^=~/.vim/plugged/coc-todolist
set noswapfile
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction
autocmd FileChangedShell * :e!<cr>
set autoread
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
let mapleader = "\<Space>"
xnoremap < <gv
xnoremap > >gv
syntax on
set clipboard+=unnamedplus
if(has("win32")||has("win64"))
    let g:python3_host_prog=$HOME . '\AppData\Local\Programs\Python\Python38\python.exe'
else
    let g:python3_host_prog='/usr/bin/python3'
endif
let g:loaded_python_provider=0
set showtabline=2
set number
vnoremap <leader>th :s/\v([0123456789ABCDEFabcdef]{2})/0x\1,/g<cr>
vnoremap <leader>pth :s/\v([0123456789ABCDEFabcdef]{2})/\\x\1/g<cr>
nnoremap x "_x
nnoremap X "_X
nnoremap dd "_dd
nnoremap dw "_dw
nnoremap diw "_diw


filetype plugin on
set ambiwidth=double
set showmatch " 高亮匹配括号
set matchtime=1
set report=0
set ignorecase
set nocompatible
set noeb
set softtabstop=4
set shiftwidth=4
set nobackup
set autoread
set nu "设置显示行号
set backspace=2 "能使用backspace回删
syntax on "语法检测
set laststatus=2 "两行状态行+一行命令行
set ts=4
set expandtab
set t_Co=256 "指定配色方案为256
set tabstop=4 "设置TAB宽度
set history=1000 "设置历史记录条数
set background=dark
set shortmess=atl
set cmdheight=3
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set updatetime=300
set shortmess+=c
set signcolumn=yes
"set foldmethod=indent " 设置默认折叠方式为缩进
"set foldlevelstart=99 " 每次打开文件时关闭折叠


"map config

if(has("win32")||has("win64"))
    :nnoremap <F12> :silent execute 'vsplit '.$HOME . '\AppData\Local\nvim\rplugin\python3\TestPlugin.py '<cr>
else
    :nnoremap <F12> :silent execute 'vsplit '.$HOME . '/.config/nvim/rplugin/python3/TestPlugin.py '<cr>
endif
:nnoremap <leader>ev :hide :edit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>sp :UpdateRemotePlugins<cr>
:nnoremap <F3> :TerminalToggle<cr>
:nnoremap <F5> :TestCommand<cr>
:nnoremap <F6> :TestCommand2<cr>
:inoremap jj <esc>
:inoremap <esc> <nop>
:nnoremap <F1> :vert h<cr>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
nnoremap e <C-e>
nnoremap w <C-y>
nnoremap x "_x
nnoremap X "_X
nnoremap dd "_dd
nnoremap <C-a> ggVG
nnoremap gb <C-o>
nnoremap gf <C-i>
nnoremap <C-o> :CocCommand clangd.switchSourceHeader<cr>


" airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>bq <Plug>AirlineSelectPrevTab
nmap <leader>bp <Plug>AirlineSelectNextTab
nmap <leader>bc :bp<cr>:bd #<cr>
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"


"comment config

au FileType python let g:NERDSpaceDelims = 0
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1


" rainbow config

let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
            \   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}


"indent line config

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level=2


" monokai config
color monokai
" nerdtree config

nnoremap <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] |exe 'NERDTree'| endif
let g:NERDTreeWinSize = 35 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"autocmd vimenter * if !argc()|NERDTree|endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"easy-motion config

nmap ss <Plug>(easymotion-s2)


"tagbar config

let g:tagbar_width=30
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


"coc.nvim config

" if hidden is not set, TextEdit might fail.
" set hidden
" " Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns

"always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-y>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <expr> <C-j> pumvisible()? "\<C-n>":"\<C-j>"

inoremap <expr> <C-k> pumvisible()? "\<C-p>":"\<C-k>"

snoremap <TAB> a<BackSpace><TAB>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()




" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-g>u":"\<CR>"
:
" Use `[g` and `]g` to navigate diagnostics
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
"
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"
xmap <leader>cf :Autoformat<cr>
nmap <leader>cf :Autoformat<cr>

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
"
command! -nargs=0 Format :call CocAction('format')
"nnoremap <leader>cfm :Format <cr>

" Use `:Fold` to fold current buffer
"
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
"
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



"viml stuff
"
"
"
inoremap <expr> { getline('.')=~"^ *$" ? "{}\<left>\<cr>\<Up>\<right>\<cr>" :"{}\<left>"


function IfEmptyLine()

    let current_line=getline('.')

    if strlen(current_line) == 0
        return 1
    else
        return 0
    endif
endfunction
" autoformat config

if(has("win32")||has("win64"))
    let g:formatterpath = ["C:\\Program Files\\LLVM\\bin\\clangd.exe"]
endif
let g:formatdef_custom_c='"clang-format --style=Microsoft"'
let g:formatters_c = ['custom_c']

"coc-translator config
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
"leaderf config
nnoremap <Leader>m mp:LeaderfFunction<cr>
nnoremap <Leader>rg mp:Leaderf rg 
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 0,
        \ 'Colorscheme': 0,
        \ 'Rg': 1,
        \ 'Gtags': 0
        \}
"php vim config
let g:php_var_selector_is_identifier=1 
"coc-todolist config
nnoremap <leader>ctd :CocCommand todolist.create<cr>
nnoremap <leader>td :CocList todolist<cr>
