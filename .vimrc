"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
"set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
"set directory=$XDG_CACHE_HOME/vim,~/,/tmp
"let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
let g:notesdir="$HOME/Dropbox/Notes"

filetype off
call pathogen#infect()
filetype on
filetype plugin indent on

set nocompatible
set encoding=utf-8
set showcmd
set showmode

" backspace past start of insert
set backspace=indent,eol,start

" :split and :vsplit options
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Mouse
if has("mouse")
    set mouse=a
    set mousehide
endif

set errorformat=%f

set virtualedit=block

" Style
syntax enable
colorscheme Tomorrow-Night
set nowrap                      " disable line wrapping
set number                      " enable line numbers
if v:version >= 703
    set relativenumber
endif
set ts=4 sts=4 sw=4             " default to a 4-space tab
set expandtab                   " use spaces instead of tabs

" Highlight Cursor
set cursorline

" Extract
vnoremap <leader>sub :! perl-extract<CR>

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" center screen after match
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" remap so j always moves down a visual line rather than a line number
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" don't break words, see breakat
set linebreak

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:·   " show tabs and trailing whitespace
set list!                       " show listchars

" Always set paste mode
set pastetoggle=<leader>p

" File Completion
" http://blog.sanctum.geek.nz/vim-filename-completion/
if has("wildmenu")
    set wildmode=longest,list
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

if has('statusline')
   " http://winterdom.com/2007/06/vimstatusline
    set ls=2 " Always show status line
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=Buffer: %n Line: %l/%L Column: %c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=Buffer: %n Line: %l/%L Column: %c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
"   nnoremap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
"   " Window title
"   if has('title')
"      set titlestring=%t%(\ [%R%M]%)
"   endif
endif

" TaskPaper Options
let task_paper_date_format = ""

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n$XDG_CACHE_HOME/vim/viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=magenta ctermfg=white
    autocmd BufEnter * match OverLength /\%81v./
augroup END

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

""" Keybindings
" Re-wrap paragraph
noremap <C-q> {gq}

" Enter command mode with SPACE instead of :
noremap <Space> :

" Make Ctrl-C trigger InsertLeave autocommands
inoremap <c-c> <esc>

" allow r to replace visually selected word
vnoremap r "_dP


" toggle showing "bad" invisible characters
nnoremap <leader>i :set list!<CR>

" toggle soft-wrap
nnoremap <leader>w :set wrap!<CR>

" turn off current search highlight
nnoremap <silent><Leader>\ :nohl<CR>

" fix package name based on file path
nnoremap <Leader>gp :call PerlReplacePackageName()<CR>

" remove trailing whitespace
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" auto-indent whole file
nnoremap _= :call Preserve("normal gg=G")<CR>

" easy split navigation
" http://vimbits.com/bits/10
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" use sane regexes
" http://vimbits.com/bits/17
nnoremap / /\v
vnoremap / /\v

" make Y behave like other capitals
" http://vimbits.com/bits/11
noremap Y y$

" reselect visual block after indent/outdent
" http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" Toggle postfix notation of conditional...
" http://babyl.dyndns.org/techblog/entry/statement-toggler
vnoremap <leader>f :! ~/.noarch/bin/postfix_toggle.pl<CR>

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! PerlPackageNameFromFile()
    let filename = expand('%:p')
    let package = substitute(filename, '^.*/lib/', '', '')
    let package = substitute(package, '\.pm$', '', '')
    let package = substitute(package, '/', '::', 'g')
    return package
endfunction

function! PerlReplacePackageName()
    let package = PerlPackageNameFromFile()
    1,/^package\s/s/^package\s\+\zs[A-Za-z_0-9:]\+\ze\(\s\+{\|;\)/\=package/
endfunction

" GNU Octave
autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set ttimeout
set ttimeoutlen=20
set notimeout

" vala
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala

" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
"let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120
