filetype on
set hlsearch                  "高亮度反白
set backspace=2               "可随时用倒退键删除
set autoindent                 "自动缩排
"set ruler                      "可显示最后一行的状态
"set showmode                 "左下角那一行的状态
set nu                        "可以在每一行的最前面显示行号
"set bg=dark                   "显示不同的底色色调
syntax on                     "进行语法检验，颜色显示
set wrap                      "自动折行
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab                  "将tab替换为相应数量空格
set smartindent
set nocompatible
set ignorecase " 搜索模式里忽略大小写

""""""""""""Vundle-install
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" install plugin
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'tboqi/php.vim'
" ------------------Vundle-end

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"if MySys() == "windows"                "设定windows系统中ctags程序的位置
"    let Tlist_Ctags_Cmd = 'ctags'
"elseif MySys() == "linux"              "设定linux系统中ctags程序的位置
"    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"endif
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
map tl :TlistToggle<cr>

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
map nt :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1     " 当打开 NERDTree 窗口时，自动显示 Bookmarks
autocmd VimEnter * NERDTree     " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
