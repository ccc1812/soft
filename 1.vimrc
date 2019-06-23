"---------------------------------------------vim配置--------------------------------------------
set nocompatible  " 去除vi一致性，必须添加 
filetype on "打开文件类型检测功能
syntax on "语法高亮

" set tabstop=4 "tab键的宽度
" set softtabstop=4
" set shiftwidth=4 "统一缩进为4
" set expandtab "不要用空格替代制表符
" set number "显示行号

set smartcase

set history=50  "历史纪录数

set gdefault "行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置

set guifont=Menlo:h16:cANSI "设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置
set ruler "在编辑过程中，在右下角显示光标位置的状态行
set laststatus=1  "总是显示状态行 use  lines for the status bar
set showcmd "在状态行显示目前所执行的命令，未完成的指令片段也会显示出来
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行的距离
set showmatch "高亮显示对应的括号
set matchtime=5 "对应括号高亮时间(单位是十分之一秒)
set matchpairs+=<:>                                               " specially for html
" set relativenumber

set autowrite "在切换buffer时自动保存当前文件
set wildmenu  "增强模式中的命令行自动完成操作
set linespace=2 "字符间插入的像素行数目

"开启normal 或visual模式下的backspace键空格键，左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能
set whichwrap=b,s,<,>,[,] 

"分为三部分命令:file on,file plugin on,file indent on 分别是自动识别文件类型, 用用文件类型脚本,使用缩进定义文件
filetype plugin indent on 

set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set title                                                         " show file in titlebar

set confirm "在处理未保存或只读文件的时候，弹出确认框
set foldenable  "允许折叠
set magic  "设置魔术
set ignorecase "搜索忽略大小写
set background=dark

" set mouse=a  "允许鼠标


" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Map Ctrl-s to save
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

"---------------------------------------------配色--------------------------------------------
set t_Co=256   "256色
"colorscheme desert
"colorscheme darkblue
"colorscheme delek
"colorscheme elflord
"colorscheme koehler
"colorscheme koehler
"colorscheme peachpuff 
"colorscheme torte 
"colorscheme pablo
"colorscheme zellner 
colorscheme murphy
"colorscheme slate
"colorscheme industry

"---------------------------------------------高亮--------------------------------------------
"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
set cursorline "突出显示当前行

" highlight current line 高亮当前行 "                                                                                                            
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn	"突出显示当前列

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

"---------------------------------------------search--------------------------------------------
" search
set incsearch "搜素高亮,搜索逐渐高亮
"set highlight    " conflict with highlight current line

"---------------------------------------------对齐--------------------------------------------
set smartindent "智能对齐
set autoindent "自动对齐


"---------------------------------------------NERDTree-----------------------------------------
" NERDTree配置
"map <C-n> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>

 " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1

"---------------------------------------------tagbar--------------------------------------------
" Tagbar
" Tagbar                    
nmap <F3> :TagbarToggle<CR>
 
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

"---------------------------------------------cscope--------------------------------------------
if has("cscope")  
    set csprg=/usr/bin/cscope  
    set csto=0 
    set cst  
    set csverb  
    set cspc=3 
    "add any database in current dir  
    if filereadable("cscope.out")  
        cs add cscope.out  
    "else search cscope.out elsewhere  
    else 
        let cscope_file=findfile("cscope.out",".;")  
        let cscope_pre=matchstr(cscope_file,".*/")  
        if !empty(cscope_file) && filereadable(cscope_file)  
            exe "cs add" cscope_file cscope_pre  
        endif        
    endif  
endif

"Use both cscope and ctag
set cscopetag

"Show msg when cscope db added 
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=1

" Use quickfix window to show cscope results
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Cscope mappings
nmap <C-\>w :scs find c<C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"---------------------------------------------Vundle--------------------------------------------

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()
call vundle#begin()
" 另一种选择，指定一个vundle安装插件的路径
" call vundle#begin('~/some/path/here')


" 让Vundle管理插件版本，必须添加
Plugin 'gmarik/Vundle.vim'
" Plugin 'VundleVim/Vundle.vim'
" 以下范例用来支持不同的格式插件的安装
" 请将安装的插件的命令放在vundle#begin和vundle#end之间
" github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"
" "Plugin 'scrooloose/nerdtree'	"会报错
"Plugin 'majutsushi/tagbar'
"Plugin 'taglist.vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'mbbill/echofunc'
"Plugin 'vim-airline/vim-airline'
"Plugin 'spf13/PIV' " PHP Integration environment
"Plugin 'ap/vim-css-color'
"Plugin 'airblade/vim-gitgutter' " Git status for each line
"Plugin 'joonty/vdebug' " DBGP debugger
"Plugin 'ervandew/supertab'
"Plugin 'evidens/vim-twig'
" Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Valloric/YouCompleteMe'

Bundle 'davidhalter/jedi-vim'  
" Bundle 'ervandew/supertab'

" Bundle 'Valloric/YouCompleteMe'


call vundle#end()


" All of your Plugins must be added before the following line
" call vundle#end() " required
" filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - list configured plugins
" :PluginInstall(!) - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"---------------------------------------------YouCompleteMe--------------------------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe  代码自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Valloric/YouCompleteMe'
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt=longest,menu
let g:ycm_confirm_extra_conf=0    " 关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1    "在注释输入中也能补全
let g:ycm_complete_in_strings = 1    "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1    "注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项

" let g:ycm_path_to_python_interpreter='/usr/bin/python'
" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容

" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif

" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" mapping
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>           " 跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>            " 跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 直接触发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
\ 'tagbar' : 1,
\ 'gitcommit' : 1,
\}

" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabRetainCompletionType=2

let g:SuperTabDefaultCompletionType = "context"  
let g:jedi#popup_on_dot = 0


"-----------------------------------------------------------------------------------------

" PYTHON
" let g:ycm_python_binary_path = '/usr/bin/python3'

set modelines=0

"设置更好的删除
set backspace=2
" set backspace=indent,eol,start			" More powerful backspacing


if has("gui_gtk2")
set guifont=DejaVu\ Sans\ Mono\ 12
end


if has("autocmd")
" Drupal *.module and *.install files.
augroup module
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.view set filetype=php
autocmd BufRead,BufNewFile *.theme set filetype=php
augroup END
endif
" syntax on
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" let php_parent_error_close = 1
" let php_parent_error_open = 1
" let php_folding = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


"-----------------
"" Plugin settings
"-----------------
"" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'


" tag for coffee
if executable('coffeetags')
      let g:tagbar_type_coffee = {
              \ 'ctagsbin' : 'coffeetags',
              \ 'ctagsargs' : '',
              \ 'kinds' : [
              \ 'f:functions',
              \ 'o:object',
              \ ],
              \ 'sro' : ".",
              \ 'kind2scope' : {
              \ 'f' : 'object',
              \ 'o' : 'object',
              \ }
              \ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif


"---------------------------------------------vim快捷键--------------------------------------------
"""""""""移动光标"""""""""
" h,j,k,l							上，下，左，右                   
" ctrl-e 							移动页面                        
" ctrl-f 							上翻一页                        
" ctrl-b 							下翻一页                        
" ctrl-u 							上翻半页                        
" ctrl-d 							下翻半页                        
" w 								跳到下一个字首，按标点或单词分割              
" W 								跳到下一个字首，长跳，如end-of-line被认为是一个字
" e 								跳到下一个字尾                       
" E 								跳到下一个字尾，长跳                    
" b 								跳到上一个字                        
" B 								跳到上一个字，长跳                     
" 0 								跳至行首，不管有无缩进，就是跳到第0个字符         
" ^ 								跳至行首的第一个字符                    
" $ 								跳至行尾                          
" gg				 				跳至文首                          
" G 								调至文尾                          
" 5gg/5G 							调至第5行                       
" gd 								跳至当前光标所在的变量的声明处               
" fx 								在当前行中找x字符，找到了就跳转至             
" ; 								重复上一个f命令，而不用重复的输入fx           
" * 								查找光标所在处的单词，向下查找               
" # 								查找光标所在处的单词，向上查找               
"
"""""""""插入模式"""""""""
" i 								从当前光标处进入插入模式      
" I 								进入插入模式，并置光标于行首    
" a 								追加模式，置光标于当前光标之后   
" A 								追加模式，置光标于行末       
" o 								在当前行之下新加一行，并进入插入模式
" O 								在当前行之上新加一行，并进入插入模式
" Esc								退出插入模式          
"
"""""""""编辑"""""""""
" J 								将下一行和当前行连接为一行        
" cc 								删除当前行并进入编辑模式         
" cw 								删除当前字，并进入编辑模式        
" c$ 								擦除从当前位置至行末的内容，并进入编辑模式
" s 								删除当前字符并进入编辑模式        
" S 								删除光标所在行并进入编辑模式       
" xp 								交换当前字符和下一个字符         
" u 								撤销                   
" ctrl+r 							重做                 
" ~ 								切换大小写，当前字符           
" >> 								将当前行右移一个单位           
" << 								将当前行左移一个单位(一个tab符)   
" ==								自动缩进当前行              
"            
"""""""""删除复制粘贴"""""""""
" dd 								删除光标所在行        
" dw 								删除一个字(word)    
" d/D								删除到行末            
" x								删除当前字符             
" X								删除前一个字符            
" yy								复制一行             
" yw								复制一个字            
" y/Y								复制到行末        
" p 								粘贴粘贴板的内容到当前行的下面
" P 								粘贴粘贴板的内容到当前行的上面
"  
"""""""""查找替换"""""""""
" /string 							向后搜索字符串string
" ?string 							向前搜索字符串string
" "\c"								忽略大小写                             
" "\C"								大小写敏感                             
" n 								下一个匹配(/搜索，则向下一个，?搜索则是向上一个)          
" N 								上一个匹配(同上)                           
" :%s/old/new/g 						搜索整个文件，将所有的old替换为new        
" :%s/old/new/gc 						搜索整个文件，将所有的old替换为new，需确认是否替换
"
"    
"""""""""多文件编辑"""""""""
" vim file1..							同时打开多个文件           
" :args 							显示当前编辑文件                 
" :next 							切换到下个文件                     
" :prev 							切换到前个文件                     
" :next！ 							不保存当前编辑文件并切换到下个文件           
" :prev！ 							不保存当前编辑文件并切换到上个文件           
" :wnext 							保存当前编辑文件并切换到下个文件            
" :wprev 							保存当前编辑文件并切换到上个文件            
" :first 							定位首文件                       
" :last 							定位尾文件                     
" ctrl+^ 							快速在最近打开的两个文件间切换             
" :split[sp]							把当前文件水平分割               
" :split file							把当前窗口水平分割, file       
" :vsplit[vsp] file						把当前窗口垂直分割, file   
" :new file							同split file             
" :close 							关闭当前窗口                      
" :only 							只显示当前窗口, 关闭所有其他的窗口          
" :all								打开所有的窗口                     
" :vertical all 						打开所有的窗口, 垂直打开         
" :qall 							对所有窗口执行：q操作               
" :qall! 							对所有窗口执行：q!操作                
" :wall 							对所有窗口执行：w操作                 
" :wqall 							对所有窗口执行：wq操作                
" ctrl-w h 							跳转到左边的窗口                  
" ctrl-w j 							跳转到下面的窗口                  
" ctrl-w k 							跳转到上面的窗口                  
" ctrl-w l 							跳转到右边的窗口                  
" ctrl-w t 							跳转到最顶上的窗口                 
" ctrl-w b 							跳转到最底下的窗口                 
"    
" """""""""多标签编辑"""""""""
" :tabedit file 						在新标签中打开文件file  
" :tab split file						在新标签中打开文件file   
" :tabp 							切换到前一个标签             
" :tabn 							切换到后一个标签             
" :tabc 							关闭当前标签               
" :tabo 							关闭其他标签               
" gt 								到下一个tab                
" gT 								到上一个tab                
" 0gt								跳到第一个tab             
" 5gt								跳到第五个tab             
" 
"
"""""""""分屏"""""""""
" 水平分屏
" vim -on file1 file2 ...   
" o								是小写字母o,不是数字零
" n								表示你要分屏的文件个数)        
" filen								文件名多个文件用空格分开
 
" ctrl + w + k							跳到上面文件
" ctrl + w + j							跳到下面文件
" :sp filename							分屏后再打开文件
"  
" 垂直分屏
" vim -On file1 file2 .....  
" ctrl + w + h							跳到左边文件   
" ctrl + w + l							跳到右边文件
" set scrollbind 						同步滚动
" set noscrollbind						关闭同步滚动
"    
"--------------------------------------------NERDTree快捷键---------------------------------------------
"""""""""切换工作台和目录"""""""""
" ctrl + w + h							光标 focus 左侧树形目录
" ctrl + w + l							光标 focus 右侧文件显示窗口
" ctrl + w + w							光标自动在左右侧窗口切换
" ctrl + w + r							移动当前窗口的布局位置 
" 
" o       							在已有窗口中打开文件、目录或书签，并跳到该窗口
" go      							在已有窗口 中打开文件、目录或书签，但不跳到该窗口
" t       							在新 Tab 中打开选中文件/书签，并跳到新 Tab
" T       							在新 Tab 中打开选中文件/书签，但不跳到新 Tab
" i       							split 一个新窗口打开选中文件，并跳到该窗口
" gi      							split 一个新窗口打开选中文件，但不跳到该窗口
" s       							vsplit 一个新窗口打开选中文件，并跳到该窗口
" gs      							vsplit 一个新 窗口打开选中文件，但不跳到该窗口
" !       							执行当前文件
" O       							递归打开选中 结点下的所有目录
" x       							合拢选中结点的父目录
" X       							递归 合拢选中结点下的所有目录
" e       							Edit the current dif
" 双击    							相当于 NERDTree -o
" 中键    							对文件相当于 NERDTree -i，对目录相当于 NERDTree -e
" D       							删除当前书签
" P       							跳到根结点
" p       							跳到父结点
" K       							跳到当前目录下同级的第一个结点
" J       							跳到当前目录下同级的最后一个结点
" k       							跳到当前目录下同级的前一个结点
" j       							跳到当前目录下同级的后一个结点
" C       							将选中目录或选中文件的父目录设为根结点
" u       							将当前根结点的父目录设为根目录，并变成合拢原根结点
" U       							将当前根结点的父目录设为根目录，但保持展开原根结点
" r       							递归刷新选中目录
" R       							递归刷新根结点
" m       							显示文件系统菜单
" cd      							将 CWD 设为选中目录
" I       							切换是否显示隐藏文件
" f       							切换是否使用文件过滤器
" F       							切换是否显示文件
" B       							切换是否显示书签
" q       							关闭 NerdTree 窗口
" ?       							切换是否显示 Quick Help
"""""""""切换标签页"""""""""
" :tabnew 							[++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab    
" :tabc   							关闭当前的 tab                                
" :tabo   							关闭所有其他的 tab                              
" :tabs   							查看所有打开的 tab                              
" :tabp   							前一个 tab
" :tabn   							后一个 tab                              

"""""""""标准模式下"""""""""                                      
" gT      							前一个 tab                              
" gt      							后一个 tab                              
"         							
"-----------------------------------------cscope快捷键------------------------------------------------
" 生成文件列表
" >>> find . -name "*.[c|h]" -o -name "Makefile*" -o -name "*.lds" > cscope.files	
		
" cscope -Rbqk							创建数据库
" :cs add cscope.out						连接数据库
"
"""""""""查找"""""""""
" :cs find {querytype} {name}   
" 0或者s							查找C符号
" 1或者g							查找定义
" 2或者d							查找被这个函数调用的函数
" 3或者c							查找调用这个函数的函数
" 4或者t							查找字符串
" 6或者e							查找egrep匹配模式
" 7或者f							查找文件
" 8或者i							查找#include该文件的文件
"
" :cs help							帮助
" :cs show							显示连接
" :cs kill {num|partial_name}					删除连接
"
"
"-----------------------------------------ctag快捷键------------------------------------------------
" {								转到上一个空行
" }								转到下一个空行
" gd 								转到当前光标所指的局部变量的定义
" *								转到当前光标所指的单词下一次出现的地方
" # 								转到当前光标所指的单词上一次出现的地方
" ctrl+] 							转到函数定义的地方
" ctrl+t							回退到函数调用的地方
"
"-----------------------------------------taglist快捷键------------------------------------------------
" <CR>          						跳到光标下tag所定义的位置，用鼠标双击此tag功能也一样                                                                      
" o             						在一个新打开的窗口中显示光标下tag                                                                               
" <Space>       						显示光标下tag的原型定义                                                                          
" u             						更新taglist窗口中的tag                                                              
" s             						更改排序方式，在按名字排序和按出现顺序排序间切换                                                      
" x             						taglist窗口放大和缩小，方便查看较长的tag                                                        
" +             						打开一个折叠，同zoctags常用快捷键ctags常用快捷键                                                   
" -             						将tag折叠起来，同zc                                                                     
" *             						打开所有的折叠，同zR                                                                      
" =             						将所有tag折叠起来，同zM                                                                  
" [[            						跳到前一个文件                                                                            
" ]]            						跳到后一个文件                                                                         
" q             						关闭taglist窗口 

         
         
         
         

