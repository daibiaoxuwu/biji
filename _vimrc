"win上gvim经常出现编码不识别和相对行号的问题...这里也没有经过测试.

set nocompatible

source $VIMRUNTIME/vimrc_example.vim

source $VIMRUNTIME/mswin.vim

behave mswin

" Platform

function! MySys()

  if has("win16") || has("win32") || has("win64") || has("win95")

    return "windows"

  elseif has("unix")

    return "linux"

  endif

endfunction


"处理文本中显示乱码

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1

if MySys() == "windows"

  set termencoding=chinese

  set fileencoding=chinese

elseif MySys() == "linux"

  let &termencoding=&encoding

  set fileencodings=utf-8,gbk,ucs-bom,cp936

endif


"防止特殊符号无法正常显示。

if exists("&ambiwidth")

    set ambiwidth=double

endif


"使用中文菜单，并使用 UTF-8 编码。{{{

"如果没有这句的话，在非 UTF-8 的系统，如 Windows 下，用了 UTF-8 的 encoding 后

"菜单会乱码。}}}

set langmenu=zh_CN.UTF-8


"使用中文提示信息，并使用 UTF-8 编码。{{{

"如果没有这句的话，在非 UTF-8 的系统，用了 UTF-8 的 encoding 后

"系统提示会乱码。}}}

language messages zh_CN.UTF-8


" 解决菜单乱码，先指定语言。{{{>>>自己根据相关版本添加<<<

"导入删除菜单脚本，删除乱码的菜单}}}

source $VIMRUNTIME/delmenu.vim

"导入正常的菜单脚本

source $VIMRUNTIME/menu.vim

8


set nu

" 不要使用vi的键盘模式，而是vim自己的

"解决菜单乱码

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

"解决consle输出乱码

language messages zh_CN.utf-8


" history文件中需要记录的行数

set history=100


" 在处理未保存或只读文件的时候，弹出确认

set confirm


" 与windows共享剪贴板

set clipboard+=unnamed


" 侦测文件类型

filetype on


" 载入文件类型插件

filetype plugin on


" 为特定文件类型载入相关缩进文件

filetype indent on


" 保存全局变量

set viminfo+=!


" 带有如下符号的单词不要被换行分割

set iskeyword+=_,$,@,%,#,-


" 语法高亮

syntax on


" 高亮字符，让其不受100列限制

:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white

:match OverLength '\%101v.*'


" 状态行颜色

highlight StatusLine guifg=SlateBlue guibg=Yellow

highlight StatusLineNC guifg=Gray guibg=White


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 文件设置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 不要备份文件（根据自己需要取舍）

set nobackup


" 不要生成swap文件，当buffer被丢弃的时候隐藏它

setlocal noswapfile

set bufhidden=hide


" 字符间插入的像素行数目

set linespace=0


" 增强模式中的命令行自动完成操作

set wildmenu


" 在状态行上显示光标所在位置的行号和列号

set ruler

set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)


" 命令行（在状态行下）的高度，默认为1，这里是2

set cmdheight=1


" 使回格键（backspace）正常处理indent, eol, start等

set backspace=2


" 允许backspace和光标键跨越行边界

set whichwrap+=<,>,h,l


" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）

set mouse=a

set selection=exclusive

set selectmode=mouse,key


" 启动的时候不显示那个援助索马里儿童的提示

set shortmess=atI


" 通过使用: commands命令，告诉我们文件的哪一行被改变过

set report=0


" 不让vim发出讨厌的滴滴声

set noerrorbells


" 在被分割的窗口间显示空白，便于阅读

set fillchars=vert:\ ,stl:\ ,stlnc:\


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 搜索和匹配

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 高亮显示匹配的括号

set showmatch


" 匹配括号高亮的时间（单位是十分之一秒）

set matchtime=5


" 在搜索的时候忽略大小写

set ignorecase


" 要高亮被搜索的句子（phrases）

set hlsearch


" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）

set incsearch


" 输入:set list命令是应该显示些啥？

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$


" 光标移动到buffer的顶部和底部时保持3行距离

set scrolloff=3


" 不要闪烁

set novisualbell


" 我的状态行显示的内容（包括文件类型和解码）

set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}


" 总是显示状态行

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 文本格式和排版

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动格式化

set formatoptions=tcrqn


" 继承前一行的缩进方式，特别适用于多行注释

set autoindent


" 为C程序提供自动缩进

set smartindent


" 使用C样式的缩进

set cindent


" 制表符为4

set tabstop=4


" 统一缩进为4

set softtabstop=4

set shiftwidth=4


" 用空格代替制表符

set expandtab


" 不要换行

set nowrap


" 在行和段开始处使用制表符

set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags的设定

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 按照名称排序

let Tlist_Sort_Type = "name"


" 在右侧显示窗口

let Tlist_Use_Right_Window = 1


" 压缩方式

let Tlist_Compart_Format = 1


" 如果只有一个buffer，kill窗口也kill掉buffer

let Tlist_Exist_OnlyWindow = 1


" 不要关闭其他文件的tags

let Tlist_File_Fold_Auto_Close = 0


" 不要显示折叠树

let Tlist_Enable_Fold_Column = 0



" F5编译和运行C程序，F6编译和运行C++程序

" 请注意，下述代码在windows下使用会报错

" 需要去掉./这两个字符


" C的编译和运行

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

exec "w"

exec "!gcc % -o %<"

exec "! ./%<"

endfunc


" C++的编译和运行

map <F6> :call CompileRunGpp()<CR>

func! CompileRunGpp()

exec "w"

exec "!g++ % -o %<"

exec "! ./%<"

endfunc


" 能够漂亮地显示.NFO文件

set encoding=utf-8

function! SetFileEncodings(encodings)

let b:myfileencodingsbak=&fileencodings

let & fileencodings=a:encodings

endfunction

function! RestoreFileEncodings()

let & fileencodings=b:myfileencodingsbak

unlet b:myfileencodingsbak

endfunction


au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings()


" 高亮显示普通txt文件（需要txt.vim脚本）

au BufRead,BufNewFile * setfiletype txt


" 用空格键来开关折叠

set foldenable

set foldmethod=manual

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>


" minibufexpl插件的一般设置

let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplMapWindowNavArrows = 1

let g:miniBufExplMapCTabSwitchBufs = 1

let g:miniBufExplModSelTarget = 1



set diffexpr=MyDiff()

function MyDiff()

  let opt = '-a --binary '

  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif

  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

  let arg1 = v:fname_in

  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif

  let arg2 = v:fname_new

  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif

  let arg3 = v:fname_out

  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif

  let eq = ''

  if $VIMRUNTIME =~ ' '

    if &sh =~ '\<cmd'

      let cmd = '""' . $VIMRUNTIME . '\diff"'

      let eq = '"'

    else

      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'

    endif

  else

    let cmd = $VIMRUNTIME . '\diff'

  endif

  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq

endfunction







"------------------------------------------------------------------------------

"  < 判断操作系统是否是 Windows 还是 Linux >

"------------------------------------------------------------------------------

if(has("win32") || has("win64") || has("win95") || has("win16"))

    let g:iswindows = 1

else

    let g:iswindows = 0

endif

 

"------------------------------------------------------------------------------

"  < 判断是终端还是 Gvim >

"------------------------------------------------------------------------------

if has("gui_running")

    let g:isGUI = 1

else

    let g:isGUI = 0

endif

 

"------------------------------------------------------------------------------

"  < 编译、连接、运行配置 >

"------------------------------------------------------------------------------

" F9 一键保存、编译、连接存并运行

map <F9> :call Run()<CR>

imap <F9> <ESC>:call Run()<CR>

 

" Ctrl + F9 一键保存并编译

map <c-F9> :call Compile()<CR>

imap <c-F9> <ESC>:call Compile()<CR>

 

" Ctrl + F10 一键保存并连接

map <c-F10> :call Link()<CR>

imap <c-F10> <ESC>:call Link()<CR>

 

let s:LastShellReturn_C = 0

let s:LastShellReturn_L = 0

let s:ShowWarning = 1

let s:Obj_Extension = '.o'

let s:Exe_Extension = '.exe'

let s:Sou_Error = 0

 

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

 

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

 

func! Compile()

    exe ":ccl"

    exe ":update"

    if expand("%:e") == "py"

        exe ":!python %"

    elseif expand("%:e") == "java"

        exe ":!javac %"

        exe ":!java %<"

    elseif expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"

        let s:Sou_Error = 0

        let s:LastShellReturn_C = 0

        let Sou = expand("%:p")

        let Obj = expand("%:p:r").s:Obj_Extension

        let Obj_Name = expand("%:p:t:r").s:Obj_Extension

        let v:statusmsg = ''

        if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))

            redraw!

            if expand("%:e") == "c"

                if g:iswindows

                    exe ":setlocal makeprg=".s:windows_CFlags

                else

                    exe ":setlocal makeprg=".s:linux_CFlags

                endif

                echohl WarningMsg | echo " compiling..."

                silent make

            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"

                if g:iswindows

                    exe ":setlocal makeprg=".s:windows_CPPFlags

                else

                    exe ":setlocal makeprg=".s:linux_CPPFlags

                endif

                echohl WarningMsg | echo " compiling..."

                silent make

            endif

            redraw!

            if v:shell_error != 0

                let s:LastShellReturn_C = v:shell_error

            endif

            if g:iswindows

                if s:LastShellReturn_C != 0

                    exe ":bo cope"

                    echohl WarningMsg | echo " compilation failed"

                else

                    if s:ShowWarning

                        exe ":bo cw"

                    endif

                    echohl WarningMsg | echo " compilation successful"

                endif

            else

                if empty(v:statusmsg)

                    echohl WarningMsg | echo " compilation successful"

                else

                    exe ":bo cope"

                endif

            endif

        else

            echohl WarningMsg | echo ""Obj_Name"is up to date"

        endif

    else

        let s:Sou_Error = 1

        echohl WarningMsg | echo " please choose the correct source file"

    endif

    exe ":setlocal makeprg=make"

endfunc

 

func! Link()

    call Compile()

    if s:Sou_Error || s:LastShellReturn_C != 0

        return

    endif

    let s:LastShellReturn_L = 0

    let Sou = expand("%:p")

    let Obj = expand("%:p:r").s:Obj_Extension

    if g:iswindows

        let Exe = expand("%:p:r").s:Exe_Extension

        let Exe_Name = expand("%:p:t:r").s:Exe_Extension

    else

        let Exe = expand("%:p:r")

        let Exe_Name = expand("%:p:t:r")

    endif

    let v:statusmsg = ''

    if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))

        redraw!

        if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))

            if expand("%:e") == "c"

                setlocal makeprg=gcc\ -o\ %<\ %<.o

                echohl WarningMsg | echo " linking..."

                silent make

            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"

                setlocal makeprg=g++\ -o\ %<\ %<.o

                echohl WarningMsg | echo " linking..."

                silent make

            endif

            redraw!

            if v:shell_error != 0

                let s:LastShellReturn_L = v:shell_error

            endif

            if g:iswindows

                if s:LastShellReturn_L != 0

                    exe ":bo cope"

                    echohl WarningMsg | echo " linking failed"

                else

                    if s:ShowWarning

                        exe ":bo cw"

                    endif

                    echohl WarningMsg | echo " linking successful"

                endif

            else

                if empty(v:statusmsg)

                    echohl WarningMsg | echo " linking successful"

                else

                    exe ":bo cope"

                endif

            endif

        else

            echohl WarningMsg | echo ""Exe_Name"is up to date"

        endif

    endif

    setlocal makeprg=make

endfunc

 

func! Run()

    let s:ShowWarning = 0

    call Link()

    let s:ShowWarning = 1

    if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0

        return

    endif

    let Sou = expand("%:p")

    let Obj = expand("%:p:r").s:Obj_Extension

    if g:iswindows

        let Exe = expand("%:p:r").s:Exe_Extension

    else

        let Exe = expand("%:p:r")

    endif

    if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)

        redraw!

        echohl WarningMsg | echo " running..."

        if g:iswindows

            exe ":!%<.exe"

        else

            if g:isGUI

                exe ":!gnome-terminal -e ./%<"

            else

                exe ":!./%<"

            endif

        endif

        redraw!

        echohl WarningMsg | echo " running finish"

    endif

endfunc

t
map <F3> :read !date<CR>
imap <F3> <ESC>:read !date<CR>
map <F2> :e D:\workspace\biji\notes.txt<CR>:vsp D:\workspace\biji\diary.txt<CR>
imap <F2> <ESC>:e D:\workspace\biji\notes.txt<CR>:vsp D:\workspace\biji\diary.txt<CR>


