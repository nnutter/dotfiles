set nocompatible
filetype off

filetype plugin indent on

let g:xdg_cache_home = $XDG_CACHE_HOME == "" ? $HOME . '/.cache' : $XDG_CACHE_HOME
let g:cache_home = xdg_cache_home . '/vim//'

"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
"let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

let &backupdir = g:cache_home
let &directory = g:cache_home
let g:notesdir="$HOME/Dropbox/Notes"

let &undodir = g:cache_home
set undofile

set spell
set spelllang=en_us
let perl_include_pod=1

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

set errorformat=%f

set virtualedit=block

" Style
syntax enable
colorscheme Tomorrow-Night
set expandtab
set nowrap                      " disable line wrapping
set number                      " enable line numbers
set ts=4 sw=4 sts=4

" DistractFree
let g:distractfree_width = '60%'
let g:distractfree_colorscheme = "iawriter"

" Highlight Cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
let g:conoline_use_colorscheme_default_normal=1

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
set nowrapscan

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
set listchars=tab:▸·,trail:·,extends:▸
set list!

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
"set viminfo='10,\"100,:20,%,n$XDG_CACHE_HOME/vim/viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

"augroup vimrc_autocmds
"    autocmd BufEnter * highlight OverLength ctermbg=magenta ctermfg=white
"    autocmd BufEnter * match OverLength /\%81v./
"augroup END

augroup filetypes
    autocmd!

    autocmd BufNewFile,BufRead *.pp :set filetype=puppet
augroup END

augroup indentation
    autocmd!

    autocmd FileType css        set ts=2 sw=2 sts=2
    autocmd FileType elixir     set ts=2 sw=2 sts=2
    autocmd FileType erb        set ts=2 sw=2 sts=2
    autocmd FileType go         set ts=4 sw=4 sts=4 noexpandtab listchars=tab:\ \ ,trail:·
    autocmd FileType html       set ts=2 sw=2 sts=2
    autocmd FileType javascript set ts=2 sw=2 sts=2
    autocmd FileType json       set ts=2 sw=2 sts=2
    autocmd FileType proto      set ts=2 sw=2 sts=2
    autocmd FileType puppet     set ts=2 sw=2 sts=2
    autocmd FileType ruby       set ts=2 sw=2 sts=2
    autocmd FileType yaml       set ts=2 sw=2 sts=2
augroup END

augroup go
    autocmd!

    autocmd Filetype go command! -bang GoAlternateV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang GoAlternateS call go#alternate#Switch(<bang>0, 'split')
augroup END

augroup autoformat
    autocmd!

    " Setup a dummy Autoformat so we can clear it out if no FileType is
    " matched below for a real Autoformat command.
    autocmd FileType * command! Autoformat echo 'dummy command'
    autocmd FileType * delcommand Autoformat

    autocmd FileType elixir command Autoformat execute "%!mix format -"
augroup END
nnoremap <C-a> :Autoformat<CR>

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
nnoremap <c-c> :update<CR>

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

" OCaml
"au BufRead,BufNewFile *.ml,*.mli compiler ocaml

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

set modelines=5

let g:ctrlp_cmd = 'CtrlPBuffer'

let g:test#strategy = 'vimux'
let g:test#runners = ['TestTracker']
nmap <silent> <leader>t :TestFile --lsf<CR>
nmap <silent> <leader>T :TestNearest --lsf<CR>
nmap <silent> <leader>r :TestSuite --lsf<CR>

set statusline+=%#warningmsg#
set statusline+=%*

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:vimwiki_list = [
    \{
        \'path': '~/Dropbox/',
        \'path_html': '/dev/null',
        \'ext': '.md',
        \'diary_rel_path': 'Journal',
        \'diary_index': 'index',
        \'auto_toc': 0,
        \'syntax': 'markdown'
    \},
    \{
        \'path': '~/Dropbox/Archive/',
        \'path_html': '/dev/null',
        \'ext': '.md',
        \'auto_toc': 1,
        \'syntax': 'markdown'
    \},
    \{
        \'path': '~/Dropbox/Notes/',
        \'path_html': '/dev/null',
        \'ext': '.md',
        \'auto_toc': 1,
        \'syntax': 'markdown'
    \},
\]

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['isort', 'yapf'],
\}
let g:ale_lint_delay = 750
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_go_staticcheck_lint_package = 1
let g:ale_go_golangci_lint_options = ""
let g:ale_linters = {
\   'go': ['errcheck', 'govet', 'golangci_lint'],
\   'python': ['mypy', 'pyflakes'],
\}
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

nnoremap <leader>b :buffer <C-d>
nnoremap <leader>q :buffer#<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

if has('gui_running')
    " set guioptions-=T  " no toolbar
    " colorscheme elflord
    " set lines=60 columns=108 linespace=0
    set macligatures
    set guifont=Fira\ Mono:h14
endif

set autowrite

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

set updatetime=250
let g:go_auto_sameids = 1
let g:go_auto_type_info = 0
let g:go_def_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ 'goimports': '-local github.platforms.engineering/graphroots -local github.com/nnutter',
    \ }
let g:go_gorename_command = "gopls"
let g:go_info_mode='gopls'
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_rename_command = 'gopls'
"let g:go_metalinter_autosave_enabled = [
"    \ 'errcheck',
"    \ ]
"let g:go_metalinter_enabled = [
"    \ 'deadcode',
"    \ 'errcheck',
"    \ 'goconst',
"    \ 'golint',
"    \ 'ineffassign',
"    \ 'interfacer',
"    \ 'maligned',
"    \ 'staticcheck',
"    \ 'structcheck',
"    \ 'unconvert',
"    \ 'varcheck',
"    \ 'vet',
"    \ 'vetshadow',
"    \ ]
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
autocmd FileType go nmap <leader>t <Plug>(go-test)

let mapleader = ","

let g:deoplete#enable_at_startup = 1

set completeopt-=preview
