"=========================================================================
" DesCRiption: 适合于编写HTML、CSS、javascript、php
" Last Change: 2011年07月31日
" Author:      (强哥仔)Johnny
" Blog:        http://www.cnblogs.com/qiangji/
" Version:     3.0
"=========================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 系统路径
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编辑vim配置文件
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
	let $VIMFILES = $HOME."/.vim"
	let helptags=$VIM.'\vimfiles\doc'
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<cr>
	let $VIMFILES = $VIM."/vimfiles"
	set directory=.,$TEMP
	set directory=.,$VIM."/vimfiles/temp"
	
	" Chinese Docs
	let helptags=$VIM.'\vimfiles\doc'
endif

if has("persistent_undo")
    set undofile
    set undolevels=1000

    if has("win32")
        set undodir=$VIM\undodir
        au BufWritePre undodir/* setlocal noundofile
    else
        set undodir=~/.undodir
        au BufWritePre ~/.undodir/* setlocal noundofile
    endif
endif


" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf


" 自动切换当前目录为当前文件所在的目录
set autochdir                   


"插件管理
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()



" =====================
" 环境配置
" =====================
" 中文帮助
set helplang=cn

" 保留历史记录
set history=500

" 行控制
set linebreak " 英文单词在换行时不被截断
set nocompatible " 设置不兼容VI
"set textwidth=80 " 设置每行80个字符自动换行，加上换行符
set wrap " 设置自动折行

" 标签页
set tabpagemax=15 " 最多15个标签
set showtabline=2 " 总是显示标签栏

" 关闭遇到错误时的声音提示
set noerrorbells
set novisualbell
set t_vb= " close visual bell

" 行号和标尺
set ruler " 显示标尺
set number " 行号
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set cmdheight=1        " 设置命令行的高度
set laststatus=2       " 始终显示状态行
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "设置状态栏的信息


" 搜索
set hlsearch  " 高亮显示搜索的内容
set noincsearch " 关闭显示查找匹配过程
set ignorecase  " 搜索时无视大小写
"set magic     " Set magic on, for regular expressions
"set showmatch " Show matching bracets when text indicator is over them
"set mat=2     " How many tenths of a second to blink


" 制表符(设置所有的tab和缩进为4个空格)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " 使用空格来替换tab
set smarttab

" 状态栏显示目前所执行的指令
set showcmd

" 缩进
set autoindent " 设置自动缩进
set smartindent " 设置智能缩进

" 自动重新读入
set autoread " 当文件在外部被修改，自动更新该文件

" 设定在任何模式下鼠标都可用
set mouse=a

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 备份和缓存
set nobackup
set nowb
"set noswapfile


" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-


set wildmenu "打开 wildmenu 选项，启动具有菜单项提示的命令行自动完成。
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]


"光标可以定位在没有实际字符的地方
set ve=block

" 重启后撤销历史可用 persistent undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

" Set hidden to undo buffer
set hidden


" =====================
"    默认为 UTF-8 编码
" =====================
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


" =====================
" 图形界面
" =====================
syntax on
 
if has("gui_running")
    "set background=light
    colorscheme yytextmate
	set guifont=Consolas:h11:cDEFAULT
    set cursorline       " Highlight current
    "set cursorcolumn
    "hi cursorline guibg=#4c4c4c
    "hi CursorColumn guibg=#4c4c4c
endif


"去除当前所编辑文件的路径信息，只保留文件名
set guitablabel=%{ShortTabLabel()}
function ShortTabLabel()
    let bufnrlist = tabpagebuflist(v:lnum)
    let label = bufname(bufnrlist[tabpagewinnr(v:lnum) -1])
    let filename = fnamemodify(label, ':t')
    return filename
endfunction


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



" =====================
" AutoCmd 自动运行
" =====================
if has("autocmd")
    filetype plugin indent on " 打开文件类型检测

    "根据当前buffer切换到该文件所在工作目录
    "autocmd BufRead * :lcd! %:p:h

    augroup vimrcEx " 记住上次文件位置
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

    " Auto Check Syntax
    au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)

    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
    au BufRead,BufNewFile *.js setf jquery

    " 给各语言文件添加 Dict
    if has('win32')
        au FileType php setlocal dict+=$VIM/vimfiles/dict/php_funclist.dict
        au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict
        au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict
    else
        au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
        au FileType css setlocal dict+=~/.vim/dict/css.dict
        au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
    endif

    " 格式化 JavaScript 文件
    au FileType javascript map <leader>jb :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    " 增加 ActionScript 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.as setf actionscript

    " CSS3 语法支持
    "au BufRead,BufNewFile *.css set ft=css syntax=css3

    " 增加 Objective-C 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m,*.h setf objc

    " 将指定文件的换行符转换成 UNIX 格式
    au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
endif

" 自动载入VIM配置文件
autocmd! bufwritepost vimrc source $MYVIMRC


" =====================
" 快捷键
" =====================
"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","

nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 快速修改 vimrc 文件
if has("win32")
    map <silent> <leader>ee :e $VIM/_vimrc<cr>
    map <silent> <leader>rc :source $VIM/_vimrc<cr> " 快速载入 vimrc 文件
else
    map <silent> <leader>ee :e ~/.vim/vimrc<cr>
    map <silent> <leader>rc :source ~/.vim/vimrc<cr> " 快速载入 vimrc 文件
endif

" 全选
map <leader>a ggVG


" Remove the Windows ^M
map <leader>M :%s/\r//g<cr>

"插入模式下使用 Meta 键（Windows下是Alt键）+自定义快捷键来移动光标。
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

" Fast reloading of the .vimrc
map <leader>es :e $VIM/_vimrc<cr>
map <leader>s :source $VIM/_vimrc<cr>

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>


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
    if has("unix")
		let Tlist_Ctags_Cmd = '/usr/bin/ctags'
	else
		let Tlist_Ctags_Cmd = '"'.$VIMFILES.'/ctags.exe"'
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
    " :NERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
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
    " plugin - NeoComplCache.vim
    "-----------------------------------------------------------------
	"禁用自动完成
	let g:NeoComplCache_Disable_Auto_complete = 1
	"启用自动代码提示
	map <Leader>en :NeoComplCacheEnable<CR>
	"禁用自动代码提示
	map <Leader>dis :NeoComplCacheDisable<CR>
        	
	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : '',
		\ 'css' : $VIMFILES.'/dict/css.dic',
		\ 'php' : $VIMFILES.'/dict/php.dic',
		\ 'javascript' : $VIMFILES.'/dict/javascript.dic'
		\ }
	let g:neocomplcache_snippets_dir=$VIMFILES."/snippets"
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
	
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Use camel case completion.
	let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplcache_enable_underbar_completion = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	
	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	
	" Plugin key-mappings.
	imap <a-k>     <Plug>(neocomplcache_snippets_expand)
	smap <a-k>     <Plug>(neocomplcache_snippets_expand)
	"inoremap <expr><C-g>     neocomplcache#undo_completion()
	"inoremap <expr><C-l>     neocomplcache#complete_common_string()
	
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	"inoremap <expr><c-y>  neocomplcache#close_popup()
	"inoremap <expr><c-e>  neocomplcache#cancel_popup()
	
	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	
	" Enable heavy omni completion.
	if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	
	au BufNewFile,BufRead *.snip set syntax=snippet ft=snippet foldmethod=indent


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
   " let g:vimwiki_use_mouse = 1
   " let g:vimwiki_list = [{'path': 'D:/Dropbox/vimwiki/',
   "     \ 'path_html': 'D:/Dropbox/vimwiki/html/',
   "     \ 'html_header': 'D:/Dropbox/vimwiki/template/header.tpl',}]

   "let g:vimwiki_camel_case = 0        "关闭驼峰英文成为维基词条
   "let g:vimwiki_hl_cb_checked = 1     " 标记为完成的 checklist 项目会有特别的颜色
   "let g:vimwiki_menu = ''
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

    "------------------------------------------------------------------
    "  plugin - mru.vim
    "------------------------------------------------------------------
    let MRU_Max_Entries = 30
    let MRU_Window_Height=10
    let MRU_Auto_Close=1
	if has("win32")
		let MRU_File = $VIM.'\_vim_mru_files'
	else
		" try for Terminal.
		try
			let MRU_File = ~/.vim_mru_files
		catch /.*/
		endtry
	endif
	 
	 
	"------------------------------------------------------------------
    "  plugin -  Session.vim
    "------------------------------------------------------------------
	"自动载入会话
	"let g:session_autoload = 1
	"自动保存会话
	"let g:session_autosave = 1
	set shellquote=
	set shellslash
	set shellxquote=
	set shellpipe=2>&1\|tee
	set shellredir=>%s\ 2>&1
	let g:session_directory=$VIMFILES

"工作目录
:cd E:\project