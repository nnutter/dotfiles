syntax enable
colorscheme Tomorrow-Night

set splitbelow
set splitright

filetype plugin indent on
augroup indentation
    autocmd!

    autocmd FileType *          set ts=4 sw=4 sts=4 expandtab
    autocmd FileType javascript set ts=2 sw=2 sts=2 expandtab
    autocmd FileType yaml       set ts=2 sw=2 sts=2 expandtab
augroup END

set hlsearch ignorecase smartcase incsearch

set backspace=indent,eol,start
