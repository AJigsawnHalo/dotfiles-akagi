syntax on 

" Colorschemes
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme hybrid
set t_Co=256
set termguicolors

" General options
set path+=**
set tabstop=4
set softtabstop=4
set number
set relativenumber
set showcmd
set cursorline
filetype plugin indent on
set lazyredraw
set showmatch
set hlsearch
set ic
set laststatus=2
set splitright
set splitbelow
set nocompatible
set viminfo='100,<50,s10,h,%
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

if has('gui_running')
	set guioptions -=T
	set guifont=Source\ Code\ Pro\ 10
endif

" Custom Keybinds
nnoremap <leader><space> :nohlsearch<CR> 
map <C-o> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nnoremap <leader>t :sp <Bar> terminal<CR>
nnoremap <leader>vt :vert terminal<CR>
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>ycm :YcmGenerateConfig<CR>
"" Rust keybinds
nnoremap <leader>cr :!cargo run<CR>
nnoremap <leader>cb :!cargo build<CR>
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gv :vsp<CR><Plug>(coc-definition)
nmap <silent> <leader>gs :sp<CR><Plug>(coc-definition)

" Autocommands
" autocmd terminal
augroup terminal_settings
    autocmd!
	autocmd TermOpen term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
          \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \   call nvim_input('<CR>')  |
          \ endif
  augroup END 
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" autocmd NERDTREE
""" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
""" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
""" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
""" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror




" vimwiki settings
let wiki_notes = {} 
let wiki_notes.path = '~/Wiki/'
let wiki_notes.syntax = 'markdown'
let wiki_notes.ext = '.md'
let wiki_writing = {}
let wiki_writing.path = '~/Writing/'
let wiki_writing.syntax = 'markdown'
let wiki_writing.ext = '.md'

let g:vimwiki_list = [wiki_notes,wiki_writing]
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'default', 'ext': '.wiki'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='expr'
set foldlevelstart=5

let g:org_todo_keywords=['TODO', 'PROGRESS', 'BLOCKED', 'REVIEW', '|', 'DONE', 'ARCHIVED', 'CANCELLED']
let g:org_agenda_files=['~/Wiki/*.org']

" instant-markdown settings
"set shell=bash\ -i
map <leader>md :InstantMarkdownPreview<CR>
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1 
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1

" lightline.vim settings
let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ }

" Scratchpad settings
let g:scratchpad_path = 'Wiki/notes/scratchpads'

let g:tex_flavor = 'latex'

" Vim-Plug 
call plug#begin('~/.vim/plugged')

" lightline.vim
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'cocopon/lightline-hybrid.vim'

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Vimwiki
Plug 'vimwiki/vimwiki'

" Vim-instant-markdown
Plug 'suan/vim-instant-markdown'
" Qt support for vim
Plug 'https://github.com/fedorenchik/qt-support.vim.git'

" Nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Vim-obsession. For saving vim sessions
Plug 'git://github.com/tpope/vim-obsession.git'

" Bufexplorer
Plug 'jlanzarotta/bufexplorer'

" Vim-orgmode and dependencies
Plug 'jceb/vim-orgmode'
Plug 'https://github.com/tpope/vim-speeddating'
Plug 'git://github.com/itchyny/calendar.vim'
"Plug 'git://github.com/mattn/calendar-vim'
Plug 'https://github.com/inkarkat/vim-SyntaxRange'
Plug 'vim-scripts/utl.vim'

" Vim-scratchpad
Plug 'Konfekt/vim-scratchpad'

" Rainglow - 320+ Colors
Plug 'rainglow/vim'

" Vimtex - LaTeX Plugin
Plug 'lervag/vimtex'

" coc.nvim
Plug 'neoclide/coc.nvim'

Plug 'cespare/vim-toml'
call plug#end()

set noshowmode 
