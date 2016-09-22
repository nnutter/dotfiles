syntax enable
colorscheme Tomorrow-Night

set splitbelow
set splitright

set list
filetype plugin indent on
augroup indentation
    autocmd!

    autocmd FileType *          set ts=4 sw=4 sts=4 expandtab   listchars=tab:▸·,trail:·,extends:▸ nowrap
    autocmd FileType html       set ts=2 sw=2 sts=2
    autocmd FileType javascript set ts=2 sw=2 sts=2
    autocmd FileType yaml       set ts=2 sw=2 sts=2
    autocmd FileType go         set                 noexpandtab listchars=tab:\ \ ,trail:·
augroup END

set hlsearch ignorecase smartcase incsearch

set backspace=indent,eol,start

if has("wildmenu")
    set wildmode=longest,list
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

if has("mouse")
    set mouse=a
    set mousehide
endif

vnoremap < <gv
vnoremap > >gv

nnoremap <leader>b :buffer <C-d>
nnoremap <leader>q :buffer#<CR>
