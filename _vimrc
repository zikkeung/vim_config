"=========================================================================
" DesCRiption: 适合于编写HTML、CSS、javascript、php
" Last Change: 2011年07月31日
" Author:      (强哥仔)Johnny
" Blog:        http://www.cnblogs.com/qiangji/
" Version:     3.0
"=========================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle "gmarik/vundle"

" original repos on github
Bundle "mattn/zencoding-vim"
"Bundle "drmingdrmer/xptemplate"

" vim-scripts repos
Bundle "L9"
Bundle "snipMate"
Bundle "FuzzyFinder"
Bundle "bufexplorer.zip"
Bundle "taglist.vim"
Bundle "Mark"
Bundle "The-NERD-tree"
Bundle "matrix.vim"
Bundle "closetag.vim"
Bundle "The-NERD-Commenter"
"Bundle "AuthorInfo"
Bundle "matchit.zip"
Bundle "AutoComplPop"
Bundle "jsbeautify"
Bundle "YankRing.vim"
Bundle "surround.vim"
Bundle "xml.vim"
"Bundle 'html5.vim'
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 系统路径
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

if version >= 730
    set autochdir " 文件路径设置为当前路径
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM 用户界面配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                       " 自动语法高亮
set number                      " 显示行号
set numberwidth=4               "行号栏的宽度
set cursorline                  " 突出显示当前行
set ruler                       " 打开状态栏标尺
set shiftwidth=4                " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4               " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4                   " 设定 tab 长度为 4
set cmdheight=2                 " 设定命令行的行数为 2
set laststatus=2                " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
                                " 设置在状态行显示的信息
set showmatch    				" Show matching bracets
set showfulltag
set mat=2                       " How many tenths of a second to blink
set showcmd					    " show incomplete commands
set wildmenu
set wildmode=longest,full       "在输入命令时列出匹配项目，也就是截图底部的效果
set switchbuf=usetab
set stal=2
"set columns=120                 "初始窗口的宽度
"set lines=30                    "初始窗口的高度
"winpos 52 42                    "初始窗口的位置
"set nowrap                      "禁止自动换行
set matchpairs=(:),{:},[:],<:>  "匹配括号的规则，增加针对html的<>
set matchtime=5					"Show matchtime in 0.5s
set whichwrap=b,s,<,>,[,]       "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set hlsearch                    " 搜索高亮
set virtualedit=block           "在可视模式下可以选择方块
set equalalways                 "分割窗口时保持相等的宽/高
set guioptions-=b 				" 隐藏底部滚动条
"set guioptions-=R 				" 隐藏右边滚动条
"set guioptions-=r
set guioptions-=l 				" 隐藏左边滚动条
set guioptions-=L
set mat=2						" How many tenths of a second to blink

set iskeyword+=_,$,@,%,#,-     " Don't break the words with following character
set viminfo+=!				   " make sure it can save viminfo
set guitablabel=%t             " 去掉tab上文件名的路径


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors & Fonts & Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
    colorscheme molokai
    set guifont=Consolas:h11:cDEFAULT
    set cursorline       " Highlight current
   " set cursorcolumn
    hi cursorline guibg=#4c4c4c
    hi CursorColumn guibg=#4c4c4c
endif


" Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff


"syntax enable
au BufRead,BufNewFile *.js set ft=javascript
au BufRead,BufNewFile *.vm set ft=html
au BufNewFile,BufRead *.log setf log


" syntax/2html.vim，可以用:runtime! syntax/2html.vim    " 让 html 产生有 CSS 语法的 html
let html_use_css=1
au BufRead,BufNewFile *.css set ft=css syntax=css3      " CSS3 语法支持
au BufNewFile,BufRead *.less set filetype=less

if has("win32")
    au GUIEnter * simalt ~x
elseif has("unix")
    au GUIEnter * winpos 0 0
    "set lines=999 columns=9999
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM 功能配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin  on
set nobackup                    " 覆盖文件时不备份
set backupcopy=yes              " 设置备份时的行为为覆盖
set autochdir                   " 自动切换当前目录为当前文件所在的目录
set noerrorbells                " 关闭错误信息响铃
set novisualbell                " 关闭使用可视响铃代替呼叫
set hidden                      " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
let helptags=$VIMFILES.'/doc'   " 设定doc文档目录
set magic                       " Set magic on
set browsedir=buffer            " Make GUI File Open use current directory
set mouse=a                     " Have the mouse enabled all the time
set history=800                 " Sets how many lines of history VIM har to remember
filetype indent on              " 自动格式化设置
set autoread                    "自动更新
"set shellslash                   "路径问题
set dir-=.    " 设置缓冲区文件
"set clipboard+=unnamed          "让 Vim 的默认寄存器和系统剪贴板共享

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc


" 重启后撤销历史可用 persistent undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set FileEncodeing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置中文编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map auto complete of (, ", ', [,{
inoremap ( ()<esc>:let leavechar=")"<cr>i
inoremap [ []<esc>:let leavechar="]"<cr>i
inoremap { {}<esc>:let leavechar="}"<cr>i
inoremap < <><esc>:let leavechar=">"<cr>i
inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i
inoremap )) (<esc>o)<esc>:let leavechar=")"<cr>O
inoremap ]] [<esc>o]<esc>:let leavechar="]"<cr>O
inoremap }} {<esc>o}<esc>:let leavechar="}"<cr>O

vnoremap #( <esc>`>a)<esc>`<i(<esc>
vnoremap #[ <esc>`>a]<esc>`<i[<esc>
vnoremap #{ <esc>`>a}<esc>`<i{<esc>
vnoremap #< <esc>`>a><esc>`<i<<esc>
vnoremap #' <esc>`>a'<esc>`<i'<esc>
vnoremap #" <esc>`>a"<esc>`<i"<esc>

"map <leader>t2 :set shiftwidth=2<cr>
"map <leader>t4 :set shiftwidth=4<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "---------------------------
    " plugin ZenCoding.vim
    "---------------------------
    let g:user_zen_expandabbr_key = '<c-e>'

    "-----------------------------------------------------------------
    " plugin - bufexplorer.vim Buffers切换
    " \be 全屏方式查看全部打开的文件列表
    " \bv 左右方式查看   \bs 上下方式查看
    "-----------------------------------------------------------------
    let g:bufExplorerSortBy='mru'
	let g:bufExplorerDefaultHelp=0
	let g:bufExplorerMaxHeight=25
	let g:bufExplorerResize=1
	let g:bufExplorerShowRelativePath=1
	let g:bufExplorerSortBy='mru'
	let g:bufExplorerSplitBelow=1
	let g:bufExplorerSplitRight=0        " 从左边出
	let g:bufExplorerSplitVertSize = 30  " 分开高度
	let g:bufExplorerSplitVertical=1     " 垂直分开
	let g:bufExplorerUseCurrentWindow=1  " 在新窗口打开

    "-----------------------------------------------------------------
    " plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
    " \m  mark or unmark the word under (or before) the cursor
    " \r  manually input a regular expression. 用于搜索.
    " \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
    " \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
    " \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
    "-----------------------------------------------------------------

    "-----------------------------------------------------------------
    " plugin - taglist.vim  查看函数列表，需要ctags程序
    " F4 打开隐藏taglist窗口
    "-----------------------------------------------------------------
    if MySys() == "windows"                " 设定windows系统中ctags程序的位置
        let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
    elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
        let Tlist_Ctags_Cmd = '/usr/bin/ctags'
    endif
    nnoremap <silent><F4> :TlistToggle<CR>
	let Tlist_Auto_Open = 0 " let the tag list open automagically
	let Tlist_Close_OnSelect = 1
	let Tlist_Compact_Format = 1 " show small menu
	let Tlist_Ctags_Cmd = 'ctags' " location of ctags
	let Tlist_Enable_Fold_Column = 0 " do show folding tree
	let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
	let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
	let Tlist_GainFocus_On_ToggleOpen = 1
	let Tlist_Inc_Winwidth = 0
	let Tlist_Show_Menu = 1
	let Tlist_Show_One_File = 1 "Show single file tags only
	let Tlist_Sort_Type = "name" " order by
	let Tlist_Use_Right_Window = 1 " split to the right side of the screen
	let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always) read my functions
	let g:tlist_php_settings = 'php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'
    let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
    "-----------------------------------------------------------------
    " plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
    " :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
    " o 打开关闭文件或者目录         t 在标签页中打开
    " T 在后台标签页中打开           ! 执行此文件
    " p 到上层目录                   P 到根目录
    " K 到第一个节点                 J 到最后一个节点
    " u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
    " r 递归刷新当前目录             R 递归刷新当前根目录
    "-----------------------------------------------------------------
    " F3 NERDTree 切换
    map <F3> :NERDTreeToggle<CR>
    imap <F3> <ESC>:NERDTreeToggle<CR>
	let g:NERDTreeShowBookmarks = 1
	let g:NERDTreeChDirMode = 2
	let NERDTreeIgnore=['\.pyc$','\.svn$','\.tmp$','\.bak$','\~$']

    "-------------------------------------------------------------------
    " plugin - matrix.vim  屏保
    " :Matrix 打开
    "-------------------------------------------------------------------

    "-------------------------------------------------------------------
    " plugin - closetag
    "        - matchi\t
    "-------------------------------------------------------------------

    "-----------------------------------------------------------------
    " plugin - NERD_commenter.vim   注释代码用的，
    " [count],cc 光标以下count行逐行添加注释(7,cc)
    " [count],cu 光标以下count行逐行取消注释(7,cu)
    " [count],cm 光标以下count行尝试添加块注释(7,cm)
    " ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
    " 注：count参数可选，无则默认为选中行或当前行
    "-----------------------------------------------------------------
    let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
    let NERDCompactSexyComs=1   " 多行注释时样子更好看

    "-----------------------------------------------------------------
    " plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
    " % 正向匹配      g% 反向匹配
    " [% 定位块首     ]% 定位块尾
    "-----------------------------------------------------------------

    "-----------------------------------------------------------------
    " plugin - acp.vim
    "-----------------------------------------------------------------
	set completeopt=longest,menu
	autocmd FileType c set omnifunc=ccomplete#Complete
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
	autocmd FileType php setlocal dict+=$VIMFILES/dict/php_functions.txt
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

    "-----------------------------------------------------------------
    " plugin - Jsbeautify.vim
    " <leader>ff
    "-----------------------------------------------------------------
    "au FileType javascript map <f12> :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS


    "-----------------------------------------------------------------
    " plugin - template.vim
    "-----------------------------------------------------------------
    "let g:TemplatePath=$VIM.'/vimfiles/template/'
    "let g:TemplateCursorFlag='#cursor#'


    "------------------------------------------------------------------
    "plugin - vimwiki.vim
    "------------------------------------------------------------------
    let g:vimwiki_use_mouse = 1
    let g:vimwiki_list = [{'path': 'D:/Dropbox/vimwiki/',
        \ 'path_html': 'D:/Dropbox/vimwiki/html/',
        \ 'html_header': 'D:/Dropbox/vimwiki/template/header.tpl',}]

    let g:vimwiki_camel_case = 0        "关闭驼峰英文成为维基词条
    let g:vimwiki_hl_cb_checked = 1     " 标记为完成的 checklist 项目会有特别的颜色
    let g:vimwiki_menu = ''
    "let g:vimwiki_folding = 1          " 是否开启按语法折叠  会让文件比较慢

    "------------------------------------------------------------------
    "  plugin - xptemplate.vim
    "------------------------------------------------------------------
    let g:xptemplate_vars = "SParg="
    let g:xptemplate_brace_complete=1

    "------------------------------------------------------------------
    "  plugin - yankring.vim
    "  :YRShow 显示剪贴板
    "  <C-p> <C-n> 侧换剪贴板
    "------------------------------------------------------------------


"===================================================================
"  javascript
"===================================================================
let b:javascript_fold = 1                 "打开JavaScript折叠
let javascript_enable_domhtmlcss = 1      "打开JavaScript对dom、html和css的支持

"设置字典 ~/.vim/dict/javascript.dict是字典文件的路径
autocmd FileType javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype html set dictionary=$VIMFILES/dict/html.dict


""===================================================================
"" => Php
""===================================================================
""设置php字典
"autocmd FileType php set dictionary=$VIMRUNTIME/dict/php.dict
"autocmd FileType php set dictionary+=$VIMRUNTIME/dict/sql.dict
"
"" Check the syntax of a PHP file
"" CodeAnalyzer
""map <F7> :call CheckPHPSyntax()<CR>
""function CheckPHPSyntax()
""    let codeanalyzercmd = '"'.$VIMRUNTIME.'\ZendCodeAnalyzer --disable var-arg-unused"'
""
""    let exeFile = expand("%:t")
""    let &makeprg = php_check_syntax_cmd
""    set errorformat=%f(line\ %l):\ %m
""    silent make %
""    if len(getqflist())>2
""        call setqflist(remove(getqflist(),2,-1))
""        copen
""    else
""        cclose
""        normal :
""        echohl WarningMsg | echo "Check over,No error!" | echohl None
""    endif
""endf
""===================================================================
"" => python
""===================================================================
"" Check the syntax of a python file
"function! CheckPythonSyntax()
"    if &filetype != 'python'
"        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
"        return
"    endif
"    setlocal makeprg=python\ -u\ %
"    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"   echohl WarningMsg | echo 'Syntax checking output:' | echohl None
"   if &modified == 1
"       silent write
"   endif
"   exec "silent make -c \"import py_compile;py_compile.compile(r'".bufname("%")."')\""
"    clist
"endfunction
"au filetype python map <F7> :call CheckPythonSyntax()<CR>
"au filetype python imap <F7> <ESC>:call CheckPythonSyntax()<CR>
"
"
"" Open a temporary PHP file in a new window
"function! PHPSandBox()
"    let tmpfile = tempname().'.php'
"    exe 'new '.tmpfile
"    call setline('.', '<?php')
"    normal o
"    normal o
"    call setline('.', '?>')
"    normal k
"    startinsert
"endfunction
"" Open a temporary Python file in a new window
"function! PySandBox()
"    let tmpfile = tempname().'.py'
"    exe 'new '.tmpfile
"    call setline('.', '#!/usr/bin/python')
"    normal o
"    call setline('.', '# -*- coding: utf-8 -*-')
"    normal o
"    startinsert
"endfunction
"nmap <leader>sbpy :call PySandBox()<CR>
"nmap <leader>sbph :call PHPSandBox()<CR>
"
"" Run a PHP script
"function! ExecutePHPScript()
"    if &filetype != 'php'
"        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
"        return
"    endif
"    setlocal makeprg=php\ -f\ %
"    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"    echohl WarningMsg | echo 'Execution output:' | echohl None
"    if &modified == 1
"        silent write
"    endif
"    silent make
"    clist
"endfunction
"au filetype php map <C-F7> :call ExecutePHPScript()<CR>
"au filetype php imap <C-F7> <ESC>:call ExecutePHPScript()<CR>
"
"" Run a python script
"function! ExecutePythonScript()
"    if &filetype != 'python'
"        echohl WarningMsg | echo 'This is not a Python file !' | echohl None
"        return
"    endif
"    setlocal makeprg=python\ -u\ %
"    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"   echohl WarningMsg | echo 'Execution output:' | echohl None
"   if &modified == 1
"       silent write
"   endif
"   silent make
"   clist
"endfunction
"au filetype python map <C-F7> :call ExecutePythonScript()<CR>
"au filetype python imap <C-F7> <ESC>:call ExecutePythonScript()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                " Auto indent
set smartindent               " Smart indet
set cindent                   " C-style indeting
set tabstop=4                 " Set tabstop width
set shiftwidth=4
set softtabstop=4
filetype on                  " Enable filetype plugin
filetype plugin on
filetype indent on
set smarttab                 " Set <BS> delete fake tabs
set expandtab                " Insert spaces instead of real tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置','为leader快捷键
let mapleader = ","

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>

nmap <C-t>   :tabnew<cr>
nmap <C-p>   :tabprevious<cr>
nmap <C-n>   :tabnext<cr>
nmap <C-k>   :tabclose<cr>
nmap <C-Tab> :tabnext<cr>


" Normal Mode, Visual Mode, and Select Mode,
" use <Tab> and <Shift-Tab> to indent
" @see http://c9s.blogspot.com/2007/10/vim-tips.html
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"插入模式下使用 Meta 键（Windows下是Alt键）+自定义快捷键来移动光标。
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

" 窗口间的移动设置。
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" 全选
map <leader>a ggVG
" Switch to current dir, see also :set autochdir
map <leader>cd :cd %:p:h<cr> :set tags=./tags <cr>
" Temp text buffer
map <leader>e :e ~/.buffer<cr>
" Remove the Windows ^M
map <leader>M :%s/\r//g<cr>
" Fast Quit
map <leader>q :q<cr>
" Fast reloading of the .vimrc
map <leader>es :e $VIM/_vimrc<cr>
map <leader>s :source $VIM/_vimrc<cr>

" Fast saving
map <leader>w :w!<cr>
map <c-s> <Esc>:w !sudo tee %


" 关闭VIM的时候保存会话，按F5读取会话
set sessionoptions=buffers,sesdir,help,tabpages,winsize
let $VIMSESSION = $VIMFILES . '/extra/session.vim'
au VimLeave * mks! $VIMSESSION
nmap <F5> :so $VIMSESSION<CR>

" Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=xhtml<cr>
map <leader>2 :set ft=css<cr>
map <leader>3 :set ft=javascript<cr>
map <leader>4 :set syntax=python<cr>
map <leader>5 :set ft=php<cr>
map <leader>$ :syntax sync fromstart<cr>


"使用热键切换Vim的QuickFix窗口打开状态
nmap <leader>co :QFix<CR>
nmap <leader>ct :call QFixToggle(1)<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction

augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
