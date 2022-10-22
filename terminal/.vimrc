set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\

set backspace=indent,eol,start
set nowrap
set wrapmargin=2
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set softtabstop=2
set shiftwidth=4
set cmdheight=1
set showcmd
set hidden
set relativenumber
set number
set mouse=a
set autoread
set autoindent
set showmatch
set wildmenu
set ignorecase
set smartcase
set foldenable
set foldmethod=indent
set foldlevel=100
set linebreak
set scrolloff=5
set laststatus=2
set ruler
syntax on
filetype indent on
