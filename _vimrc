"win��gvim�������ֱ��벻ʶ�������кŵ�����...����Ҳû�о�������.

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


"�����ı�����ʾ����

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1

if MySys() == "windows"

  set termencoding=chinese

  set fileencoding=chinese

elseif MySys() == "linux"

  let &termencoding=&encoding

  set fileencodings=utf-8,gbk,ucs-bom,cp936

endif


"��ֹ��������޷�������ʾ��

if exists("&ambiwidth")

    set ambiwidth=double

endif


"ʹ�����Ĳ˵�����ʹ�� UTF-8 ���롣{{{

"���û�����Ļ����ڷ� UTF-8 ��ϵͳ���� Windows �£����� UTF-8 �� encoding ��

"�˵������롣}}}

set langmenu=zh_CN.UTF-8


"ʹ��������ʾ��Ϣ����ʹ�� UTF-8 ���롣{{{

"���û�����Ļ����ڷ� UTF-8 ��ϵͳ������ UTF-8 �� encoding ��

"ϵͳ��ʾ�����롣}}}

language messages zh_CN.UTF-8


" ����˵����룬��ָ�����ԡ�{{{>>>�Լ�������ذ汾���<<<

"����ɾ���˵��ű���ɾ������Ĳ˵�}}}

source $VIMRUNTIME/delmenu.vim

"���������Ĳ˵��ű�

source $VIMRUNTIME/menu.vim

8


set nu

" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���

"����˵�����

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

"���consle�������

language messages zh_CN.utf-8


" history�ļ�����Ҫ��¼������

set history=100


" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��

set confirm


" ��windows���������

set clipboard+=unnamed


" ����ļ�����

filetype on


" �����ļ����Ͳ��

filetype plugin on


" Ϊ�ض��ļ�����������������ļ�

filetype indent on


" ����ȫ�ֱ���

set viminfo+=!


" �������·��ŵĵ��ʲ�Ҫ�����зָ�

set iskeyword+=_,$,@,%,#,-


" �﷨����

syntax on


" �����ַ������䲻��100������

:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white

:match OverLength '\%101v.*'


" ״̬����ɫ

highlight StatusLine guifg=SlateBlue guibg=Yellow

highlight StatusLineNC guifg=Gray guibg=White


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" �ļ�����

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ��Ҫ�����ļ��������Լ���Ҫȡ�ᣩ

set nobackup


" ��Ҫ����swap�ļ�����buffer��������ʱ��������

setlocal noswapfile

set bufhidden=hide


" �ַ���������������Ŀ

set linespace=0


" ��ǿģʽ�е��������Զ���ɲ���

set wildmenu


" ��״̬������ʾ�������λ�õ��кź��к�

set ruler

set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)


" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2

set cmdheight=1


" ʹ�ظ����backspace����������indent, eol, start��

set backspace=2


" ����backspace�͹�����Խ�б߽�

set whichwrap+=<,>,h,l


" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��

set mouse=a

set selection=exclusive

set selectmode=mouse,key


" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ

set shortmess=atI


" ͨ��ʹ��: commands������������ļ�����һ�б��ı��

set report=0


" ����vim��������ĵε���

set noerrorbells


" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�

set fillchars=vert:\ ,stl:\ ,stlnc:\


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ������ƥ��

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ������ʾƥ�������

set showmatch


" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩

set matchtime=5


" ��������ʱ����Դ�Сд

set ignorecase


" Ҫ�����������ľ��ӣ�phrases��

set hlsearch


" ������ʱ������Ĵʾ�����ַ�����������firefox��������

set incsearch


" ����:set list������Ӧ����ʾЩɶ��

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$


" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���

set scrolloff=3


" ��Ҫ��˸

set novisualbell


" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩

set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}


" ������ʾ״̬��

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" �ı���ʽ���Ű�

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" �Զ���ʽ��

set formatoptions=tcrqn


" �̳�ǰһ�е�������ʽ���ر������ڶ���ע��

set autoindent


" ΪC�����ṩ�Զ�����

set smartindent


" ʹ��C��ʽ������

set cindent


" �Ʊ��Ϊ4

set tabstop=4


" ͳһ����Ϊ4

set softtabstop=4

set shiftwidth=4


" �ÿո�����Ʊ��

set expandtab


" ��Ҫ����

set nowrap


" ���кͶο�ʼ��ʹ���Ʊ��

set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags���趨

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ������������

let Tlist_Sort_Type = "name"


" ���Ҳ���ʾ����

let Tlist_Use_Right_Window = 1


" ѹ����ʽ

let Tlist_Compart_Format = 1


" ���ֻ��һ��buffer��kill����Ҳkill��buffer

let Tlist_Exist_OnlyWindow = 1


" ��Ҫ�ر������ļ���tags

let Tlist_File_Fold_Auto_Close = 0


" ��Ҫ��ʾ�۵���

let Tlist_Enable_Fold_Column = 0



" F5���������C����F6���������C++����

" ��ע�⣬����������windows��ʹ�ûᱨ��

" ��Ҫȥ��./�������ַ�


" C�ı��������

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

exec "w"

exec "!gcc % -o %<"

exec "! ./%<"

endfunc


" C++�ı��������

map <F6> :call CompileRunGpp()<CR>

func! CompileRunGpp()

exec "w"

exec "!g++ % -o %<"

exec "! ./%<"

endfunc


" �ܹ�Ư������ʾ.NFO�ļ�

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


" ������ʾ��ͨtxt�ļ�����Ҫtxt.vim�ű���

au BufRead,BufNewFile * setfiletype txt


" �ÿո���������۵�

set foldenable

set foldmethod=manual

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>


" minibufexpl�����һ������

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

"  < �жϲ���ϵͳ�Ƿ��� Windows ���� Linux >

"------------------------------------------------------------------------------

if(has("win32") || has("win64") || has("win95") || has("win16"))

    let g:iswindows = 1

else

    let g:iswindows = 0

endif

 

"------------------------------------------------------------------------------

"  < �ж����ն˻��� Gvim >

"------------------------------------------------------------------------------

if has("gui_running")

    let g:isGUI = 1

else

    let g:isGUI = 0

endif

 

"------------------------------------------------------------------------------

"  < ���롢���ӡ��������� >

"------------------------------------------------------------------------------

" F9 һ�����桢���롢���Ӵ沢����

map <F9> :call Run()<CR>

imap <F9> <ESC>:call Run()<CR>

 

" Ctrl + F9 һ�����沢����

map <c-F9> :call Compile()<CR>

imap <c-F9> <ESC>:call Compile()<CR>

 

" Ctrl + F10 һ�����沢����

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


