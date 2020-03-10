"---- ---- ---- ---- ---- ---- Vim-Plug Initialization ---- ---- ---- ---- ---"
" Avoid modify this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif
" Manually Load Vim-Plug The First Time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

"---- ---- ---- ---- Plugins From Github and Vim-scripts ---- ---- ----"
call plug#begin('~/.vim/plugged')     " Active Plugins

" Essential Starter Pack Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'               " Fuzzy finder
Plug 'itchyny/lightline.vim'          " A light statusline/tabline plugin
" Plug 'airblade/vim-gitgutter'         " Git diff gutter and stages/undoesks
Plug 'machakann/vim-highlightedyank'  " Make the yanked region apparent!

" Color Schemes
Plug 'lazarocastro/spacecamp'         " Vim color for the final frontier
Plug 'dikiaap/minimalist'             " A Material Color Scheme Darker
Plug 'morhetz/gruvbox'                " Gruvbox colorscheme

" Tim Pope Section
Plug 'tpope/vim-commentary'           " Use 'gcc' to comment out a line
Plug 'tpope/vim-vinegar'              " Simple file browser
Plug 'tpope/vim-surround'             " Quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'             " A Git wrapper so awesome, it should be illegal

call plug#end()                       "Vim-plug finished declaring
"---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- -----"

"---- ---- ---- --- Install Plugins The First Time Vim Runs --- ---- ---- ----"
if vim_plug_just_installed
  echo "Installing Bundles, please ignore key map error messages"
  :PlugInstall
endif

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
syntax on
filetype plugin indent on
set encoding=utf-8
set nocompatible                  " no vi-compatible
let mapleader = ','               " The default leader is \
" set nu rnu                        " Activate line number and relative number
set nowrap                        " Disable long line wrap
set expandtab                     " Tabs and Spaces Handling
set tabstop=4                     " Number of space that <TAB>
set softtabstop=4                 " Number of space that <TAB>
set shiftwidth=4                  " Number of space on (auto)ident
set laststatus=2                  " Always Show Status Bar
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set noshowmode                    " INSERT is unnecessary (see lightline.vim docs)

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set incsearch        " incremental search
set hlsearch         " highlighted search results
set ignorecase       " Ignore case when searching...
set smartcase        " ...unless we type a capital

"---- ---- ---- ---- Scrolling ---- ---- ---- ----"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
" set mouse=a
"------------------------------------------------------------------

"---- ---- ---- ---- Tabs & Trailing Spaces ---- ---- ---- ----"
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

"---- ---- ---- ---- Better Backup, Swap and Undos Storage ---- ---- ---- ----"
set directory=~/.vim/dirs/tmp               " directory to place swap files in
set backup                                  " make backup files
set backupdir=~/.vim/dirs/backups           " where to put backup files
set undofile                                " persistent undos
set undodir=~/.vim/dirs/undos               " undo after you re-open the file
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/' " store yankring history file

" Create Needed Directories if They Don't Exist
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

"---- ---- ---- ---- Visual Settings ---- ---- ---- ----"
"" On Terminal 
colorscheme gruvbox        " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set cursorline             " Cursor Line
set cursorcolumn           " Cursor Column
set colorcolumn=80         " Screen columns that are highlight
set fillchars+=vert:\      " remove ugly vertical lines on window division
" hi Comment cterm=italic
hi vertsplit ctermfg=bg ctermbg=bg

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
"" Clean search (highlight), tabs and traling spaces
nnoremap <silent> <leader><space> :noh<cr>:set nolist!<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Escape to the NORMAL mode
inoremap jj <esc>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Split
set splitbelow
set splitright
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Open all Buffer in Vertical Split
map <silent> <F9> :tab sball <bar> :tabdo :close <bar> :vert sball<cr>

"" Open all Buffer in Tab
map <silent> <F10> :tab sball<cr>

"" save as sudo
ca w!! w !sudo tee "%"

"---- ---- ---- ---- Plugins Settings ---- ---- ---- ----"
"" Vinegar
" Initialize with dot files hidden. Press 'gh' to toggle dot file hiding.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Closes it vinegar buffer after opening the file
let g:netrw_fastbrowse = 0
" Specify user's preference for a viewer
let g:netrw_browsex_viewer="setsid xdg-open"

"" Fzf
" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>

nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
