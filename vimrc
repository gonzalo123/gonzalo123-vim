" Vim syntax file

" Set mapleader to ","
let mapleader = ","
" "Hidden" buffers -- i.e., don't require saving before editing another file.
" Calling quit will prompt you to save unsaved buffers anyways.
:set hidden

:set nocompatible
:set expandtab
:set textwidth=80
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set background=dark
:syntax on
:set tags=$HOME/.vim/doc/tags
:set ttyfast
:set showcmd
:set showmode
:set wildmenu
:set wildmode=list:longest
" This setting can be useful for determining how many lines of text you want to
" yank. It will display the line number column, but lines will be the distance
" from the current line.
":set relativenumber

:set smarttab
:set shiftround
:set autoindent
:set smartindent

" "sudo" save:
:cmap w!! w !sudo tee % >/dev/null

" This is for mouse scrolling (primarily in GVIM)
:map <M-Esc>[62~ <MouseDown>
:map! <M-Esc>[62~ <MouseDown>
:map <M-Esc>[63~ <MouseUp>
:map! <M-Esc>[63~ <MouseUp>
:map <M-Esc>[64~ <S-MouseDown>
:map! <M-Esc>[64~ <S-MouseDown>
:map <M-Esc>[65~ <S-MouseUp>
:map! <M-Esc>[65~ <S-MouseUp>

" Folding -- allows me to toggle display of comment lines
" Then, do a :g/^\s*#/,/^\s*[^#]/-fold
:set foldenable foldmethod=manual

" Pasting toggle...
:set pastetoggle=<Ins>

" Local scripts/helpfiles
:helptags $HOME/.vim/doc

" Highlight Searches
:set highlight=lub
:map <Leader>s :set hlsearch<CR>
:map <Leader>S :set nohlsearch<CR>
:set incsearch

" PHP options
:function! PhpDocLoad()
:   so $HOME/.vim/php-doc.vim
:   inoremap <C-P><ESC> :call PhpDocSingle()<CR>i
:   nnoremap <C-P> :call PhpDocSingle()<CR>
:   vnoremap <C-P> :call PhpDocRange()<CR>
:   inoremap ( ()<Left>
:endfunction

" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" These are tag files I've created; you may want to remove/change these for your
" own usage.
:call LoadTags("nov")
":call LoadTags("zf2")

" PHP syntax settings
:let php_sql_query=1
:let php_htmlInStrings=1
:let php_folding=1
:let php_parent_error_close=1
:let php_parent_error_open=1
:autocmd BufNewFile,BufRead *.php call PhpDocLoad()

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!$HOME/bin/php -l %<CR>

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!$HOME/bin/php %<CR>

" JSLint (CTRL-L when in a JS file)
:autocmd FileType javascript noremap <C-L> :!$HOME/bin/jslint -process %<CR>

" Make a print macro (linux only)
" :map <Leader>p :write !lpr<CR>
:map <Leader>p :hardcopy<CR>

" Syntax highlighting macro
:map <Leader>h :syn on<CR>
:map <Leader>H :syn off<CR>

" Allow Man viewing
source $VIMRUNTIME/ftplugin/man.vim

" Keybindings for movement in insert mode
imap <Leader>0 <Esc>I
imap <Leader>$ <Esc>A
imap <Leader>h <Esc>i
imap <Leader>l <Esc>lli
imap <Leader>j <Esc>lji
imap <Leader>k <Esc>lki

" Replace across buffers script
:so $HOME/.vim/bufreplace.vim

" The escape key is a long ways away. This maps it to the sequence ';;'
:map! çç <esc>

" Similarly, : takes two keystrokes, ; takes one; map the latter to the former
" in normal mode to get to the commandline faster
nnoremap ; :

" Turn on filetype plugins
:filetype plugin on
:filetype plugin indent on
:runtime! $HOME/.vim/ftdetect/*.vim

" Make case-insensitive search the norm
:set ignorecase
:set smartcase

" Allow better terminal/mouse integration
:set mousemodel=extend

" Turn on modelines
:set modeline
:set modelines=4

" .inc, obj, files as PHP
:autocmd BufNewFile,BufRead *.inc set ft=php
:autocmd BufNewFile,BufRead *.obj set ft=php

" Use viminfo
:set viminfo='100,f1,\"1000,:100,/100,h,%

" Remember settings between sessions
:set viminfo='400,f1,"500,h,/100,:100,<500

" Folding commands (normal mode only
" ,,l = loadview; ,,m = mkview
:set viewdir=$HOME/.vim.view/
:nmap  ,,m :mkview!<Cr>
:nmap  ,,l :loadview<Cr>
:autocmd BufWrite * mkview!
:autocmd BufWinEnter *.* silent loadview

" Comment options
:set formatoptions=qroctn2

" Repair weird terminal/vim settings
:set backspace=start,eol,indent

" Bash is my shell
" Well, not really. But this makes CLI integration better.
:let bash_is_sh=1

" Tab options (as in Vim GUI Tabs)
" <C-t> Opens a new tab, <C-w> closes current tab
" Remember, gt goes to next tab, gT goes to previous; easier than using firefox
" control sequences
":nmap <C-t> :tabnew<CR>
":imap <C-t> <ESC>:tabnew<CR>
":nmap <C-w> :tabclose<CR>
":imap <C-w> <ESC>:tabclose<CR>

" Use UTF-8 encoding
:set encoding=utf-8

" Show info in ruler
set laststatus=2

" Scrolling options
set scrolljump=5
set scrolloff=3

" NERDTree options
:let NERDChristmasTree=1
:let NERDTreeCaseSensitiveSort=1
:let NERDTreeChDirMode=2
:let NERDTreeBookmarksFile = $HOME . "/.vim/NERDTreeBookmarks"
:let NERDTreeShowBookmarks=1
:let NERDTreeShowHidden=1
:let NERDTreeQuitOnOpen=1

" Color scheme
" First line ensures we can have full spectrum of colors
:set t_Co=256
:colorscheme wombat
let g:bg_tango = 0 

" snipMate options
let g:snips_author = "Gonzalo Ayuso"
let g:snippets_dir = $HOME . "/.vim/snippets/"

" Highlight current line
source $HOME/.vim/plugin/highlight_cursor.vim

" ZenCoding
" See http://code.google.com/p/zen-coding/
" This implementation: http://www.vim.com/scripts/script.php?script_id=2981
let g:user_zen_settings = {
\  'php':{
\    'aliases':{
\    },
\    'snippets':{
\      'req':"require_once '';",
\      'inc':"include_once '';",
\      'thr':"throw new Exception();\n",
\    }
\  }
\}
let g:user_zen_expandabbr_key = '<c-y>'
let g:user_zen_complete_tag = 1

" Map <leader>f to split horizontally, and move to bottom window
nnoremap <leader>f <C-w>s<C-w>j
" and use <ctrl> plus direction key to move around within windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" TagList options
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1


" My settings 
nnoremap <silent> <F8> :TlistToggle<CR>
nmap <silent> <F5> :NERDTreeToggle<CR>  
nmap <F6> :set number!<CR>
nmap <silent> zz zR

inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
:map Q <Nop>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType sql set omnifunc=sqlcomplete#Complete

" mostrar posibilidades en un menu
" e información extra en una ventana
set completeopt=menu,preview

:let loaded_matchit = 1
:map ç :BufExplorer<CR> 

nmap <c-tab> :bn<CR>
imap <c-tab> <ESC>:bn<CR>i
