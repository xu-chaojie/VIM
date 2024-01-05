""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

"General
filetype plugin indent on     " required!
syntax enable

set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set clipboard=unnamed
set nobackup                     "不自动保存
set noswapfile
set undofile
set undodir=~/.vim/.undo//
" 当文件被外部程序改变，并且没有被vim改变时，自动读取它
set autoread

set iskeyword+=_  " 单词分割
set iskeyword-=. " '.' is an end of word designator
set iskeyword-=# " '#' is an end of word designator
set iskeyword-=- " '-' is an end of word designator

"VimUI
set backspace=indent,eol,start " Backspace for dummies
set number "设置行号
set relativenumber "设置相对行号
set sm "显示括号配对，输入后括号时光标跳回前括号片刻
set cul "高亮光标所在行
"set cuc "高亮光标所在列
set cc=81 "高亮第81列
set hlsearch "搜索逐字符高亮
set incsearch "随着键入即时搜索
"set ignorecase "搜索时忽略大小写
set ruler
set wildmenu
set wildmode=list:longest,full
set whichwrap+=<,>,h,l
set selection=inclusive "指定在选择文本时，光标所在位置属于被选中的范围
set scrolloff=9     " 光标移动到buffer的顶部和底部时保持x行距离
set showcmd         " 输入的命令显示出来，看的清楚些
set confirm         " 在处理未保存或只读文件的时候，弹出确认
"set autochdir       " 打开文件时自动切换到文件所在的目录
set vb t_vb= "去掉错误提示声音
"如果 CTRL-N 和 CTRL-P 补全时查找所包含的头文件，耗时会比较久。此时，可以在 complete 选项中去掉 i 标记
set complete-=i
"CTRL-A 和CTRL-X处理数字时去掉按8进制方式
set nrformats-=octal

"如果行尾有多余的空格（或 Tab 键），该配置将让这些空格成对应字符
set listchars=tab:»\ ,trail:-
"显示行尾
set list


if has('statusline')
    set laststatus=2
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
endif

"highlight CursorLine term=NONE cterm=NONE  ctermbg=234  guibg=Grey40

"Formatting
"set nowrap "关闭自动换行
set autoindent                  " Indent at the same level of the previous line
set smartindent
set cin " 打开C/C++风格的自动缩进
set ts=4 " Tab键的宽度
set sw=4 " 统一缩进为4
set et  "使用空格代替制表符
set softtabstop=4 "按退格键时可以一次删掉4个空格
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright " Puts new vsplit windows to the right of the current
"set splitbelow " Puts new split windows to the bottom of the current
set lbr "不在单词中间断行
set fo+=mB "打开断行模块对亚洲语言支持
set encoding=utf-8
lan tim en_US.UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plug')

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"need vim9, and exec ':Copilot setup' after PlugInstall
Plug 'github/copilot.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'

Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'derekwyatt/vim-fswitch'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/DoxygenToolkit.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plug 'morhetz/gruvbox'
colorscheme gruvbox
set background=dark

"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | wincmd w | endif

"Use NERDTree and netrw both
let NERDTreeHijackNetrw=0
let NERDTreeShowLineNumbers=1
let g:netrw_list_hide= netrw_gitignore#Hide()

"Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tagbar#enabled = 0 "与tagbar冲突，禁用airline的tagbar扩展

"Plug preservim/tagbar"
let g:tagbar_type_markdown = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' : '~/.vim/plugin/markdown2ctags.py',
            \ 'ctagsargs' : '-f - --sort=yes',
            \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }

"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1

"Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_focus = {
            \ "at": "start"
            \ }

"Plug 'neoclide/coc.nvim'
let g:coc_disable_startup_warning = 1

"Plug 'github/copilot.vim'
let g:copilot_filetypes = {
    \ '*': v:true,
    \ }

" 由于copilot插件的关系，关闭自动注释，避免注释行下一行自动添加注释导致困扰
au filetype * setlocal formatoptions-=cro

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键盘映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"列出当前目录文件
nnoremap <F2> :NERDTreeFind<CR>
inoremap <F2> <ESC> :NERDTreeFind<CR>
nnoremap <Space>w :NERDTreeToggle<CR>

"去除行尾空格
nnoremap <F3> :%s/\s\+$//e<CR>
inoremap <F3> <ESC> :%s/\s\+$//e<CR>
nnoremap <Space>e :%s/\s\+$//e<CR>

"切换头文件与源文件
nnoremap <F4> :FSHere<CR>
nnoremap <Space>r :FSHere<CR>

"C，C++ 按F5编译运行
nnoremap <F5> :call CompileRunGcc()<CR>
nnoremap <Space>t :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++14 -fsanitize=address -g -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!open -a '/Applications/Google Chrome.app' % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec "!open -a '/Applications/Typora.app' %"
    endif
endfunc

"代码格式优化化
nnoremap <F6> :call FormartSrc()<CR><CR>
nnoremap <Space>y :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=google --indent=spaces=4 --keep-one-line-blocks --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "!astyle --style=google --indent=spaces=4 --keep-one-line-blocks --suffix=none %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc

"查找单词
nnoremap <F7> :CtrlSF 
nnoremap <Space>u :CtrlSF 
"查找选中的单词
vmap <F7> <Plug>CtrlSFVwordExec
vmap <Space>u <Plug>CtrlSFVwordExec

"高亮当前单词
"nnoremap <F8> :match incsearch /\<<C-R>=expand("<cword>")<CR>\>/ <CR>
nnoremap <silent><F8> :silent! let @/ = "\\<<C-R>=expand("<cword>")<CR>\\>" <CR>:set hls<CR>
nnoremap <silent><Space>i :silent! let @/ = "\\<<C-R>=expand("<cword>")<CR>\\>" <CR>:set hls<CR>

nnoremap <F9> :TagbarOpen fj<CR>
nnoremap <Space>o :TagbarToggle<CR>

" Space
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>f  :<C-u>CocList outline<cr>

nnoremap <Space>/ :Dox<CR>
nnoremap <Space>v :DoxLic<CR>

" <c-n> <c-p>
nnoremap <c-p> :GFiles<CR>

nnoremap <c-n>f :FZF<CR>
nnoremap <c-n>g :GFiles?<CR>
nnoremap <c-n>b :Buffers<CR>
nnoremap <c-n>l :BLines<CR>
nnoremap <c-n>t :BTags<CR>
nnoremap <c-n>m :Marks<CR>
nnoremap <c-n>h :History<CR>
nnoremap <c-n>k :Commands<CR>
nnoremap <c-n>/ :History/<CR>
nnoremap <c-n>c :BCommits<CR>

nmap <silent> <c-n>d <Plug>(coc-definition)
nmap <silent> <c-n>y <Plug>(coc-type-definition)
nmap <silent> <c-n>i <Plug>(coc-implementation)
nmap <silent> <c-n>r <Plug>(coc-references)

" others
nnoremap zc [{zf%
xnoremap <silent> p p:silent! let @"=@0<CR>:silent! let @*=@0<CR>
noremap Q @q

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" copilot next & previous
inoremap <C-J> <Plug>(copilot-next)
inoremap <C-K> <plug>(copilot-previous)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.md exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'markdown'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
        call append(line("."), "")
    else
        call setline(1, "")
    endif
    if expand("%:e") == 'h'
        call append(line("."), "#ifndef ".toupper(substitute(expand("%:r"), '\/', '_', 'g'))."_H_")
        call append(line(".")+1, "#define ".toupper(substitute(expand("%:r"), '\/', '_', 'g'))."_H_")
        call append(line(".")+2, "")
        call append(line(".")+3, "")
        call append(line(".")+4, "")
        call append(line(".")+5, "#endif  // ".toupper(substitute(expand("%:r"), '\/', '_', 'g'))."_H_")
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" others
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd BufNewFile * normal G

"记忆文件关闭时光标位置
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif

au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType java setlocal dict+=~/.vim/dict/java.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"自动删除行尾空格
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

" 防止tmux下vim的背景色显示异常
if &term =~ '256color'
    set t_ut=
endif

