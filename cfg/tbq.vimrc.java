filetype on
filetype plugin on
set hlsearch                  "高亮度反白
set backspace=2               "可随时用倒退键删除
set autoindent                 "自动缩排
"set ruler                      "可显示最后一行的状态
set nu                        "可以在每一行的最前面显示行号
syntax on                     "进行语法检验，颜色显示
"set background=light
"color desert
""color morning
""color shine
""set background=dark
""color blue
""color desert
""color morning
""color shine
set wrap                      "自动折行
set linebreak " 整词换行
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab                  "将tab替换为相应数量空格
set smartindent
set nocompatible
set ignorecase " 搜索模式里忽略大小写
set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set showmatch " 设置匹配模式，显示匹配的括号
" set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

set incsearch " 输入字符串就显示匹配点

set encoding=utf8 "设置编码为utf8
set fileencoding=utf8
set fileencodings=uft8-bom,utf8,gbk
set fileformat=unix "设置文件格式
set fileformats=unix,dos,mac
" 记住上次编辑位置"
autocmd BufReadPost * if line("'\"")>0&&line("'\"")<=line("$") | exe "normal g'\"" | endif

""""""""""""Vundle-install
" git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" install plugin
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
map nt :NERDTreeTabsToggle<cr>
let NERDTreeShowBookmarks=1     " 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeDirArrows=0
autocmd VimEnter * NERDTree    " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
let g:nerdtree_tabs_open_on_console_startup=1
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
Bundle 'taglist.vim'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
map tl :TlistToggle<cr>
""Bundle 'FuzzyFinder'
""map fff :FufFile<cr>
""map ffb :FufBuffer<cr>
Bundle 'bufexplorer.zip'
Bundle 'L9'
Bundle 'AutoComplPop'
Bundle 'ctrlp.vim'
Bundle 'gregsexton/gitv'
Bundle 'yianwillis/vimcdoc'
Bundle 'bling/vim-airline'
""Bundle 'amiorin/vim-project'
""Bundle 'grep.vim'
""Bundle 'easymotion/vim-easymotion'
""Bundle 'vim-scripts/winmanager'
""Bundle 'cscope.vim'
" ------------------Vundle-end

