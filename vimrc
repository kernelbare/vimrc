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
Plug 'junegunn/fzf.vim'              " Fuzzy finder
Plug 'mileszs/ack.vim'               " Ack code search (requires ack installed in the system)
Plug 'vim-scripts/grep.vim'          " Integrates the [a, e and f]grep
Plug 'itchyny/lightline.vim'         " A light statusline/tabline plugin
Plug 'airblade/vim-gitgutter'        " Git diff gutter and stages/undoesks
Plug 'machakann/vim-highlightedyank' " Make the yanked region apparent!
Plug 'SirVer/ultisnips'              " The ultimate snippet solution for Vim
Plug 'honza/vim-snippets'            " Vim-snipmate default snippets
Plug 'vim-scripts/AutoComplPop'      " Automatically opens popup menu for completions
Plug 'jiangmiao/auto-pairs'          " Vim plugin, insert or delete brackets, parens, quotes in pair 

" Color Schemes
Plug 'NLKNguyen/papercolor-theme'       " Light & Dark Vim color schemes inspired by Google's Material Design
Plug 'morhetz/gruvbox'                  " Gruvbox colorscheme
Plug 'rakr/vim-one'                     " Light and dark vim colorscheme, shamelessly stolen from atom 
" Plug 'lazarocastro/spacecamp'         " Vim color for the final frontier
" Plug 'dikiaap/minimalist'             " A Material Color Scheme Darker
" Plug 'dracula/vim', {'as': 'dracula'} " 🧛 Dark theme for Vim

" Tim Pope Section
Plug 'tpope/vim-commentary' " Use 'gcc' to comment out a line
Plug 'tpope/vim-vinegar'    " Simple file browser
Plug 'tpope/vim-surround'   " Quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'   " A Git wrapper so awesome, it should be illegal

" Languages
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end() "Vim-plug finished declaring
"---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- -----"

"---- ---- ---- --- Install Plugins The First Time Vim Runs --- ---- ---- ----"
if vim_plug_just_installed
  echo "Installing Bundles, please ignore key map error messages"
  :PlugInstall
endif

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
syntax enable
filetype plugin indent on
set encoding=utf-8
set backspace=indent,eol,start    " Make backspace behave like every other editor
set nocompatible                  " no vi-compatible
let mapleader = ','               " The default leader is \
set nowrap                        " Disable long line wrap
set expandtab                     " Tabs and Spaces Handling
set tabstop=2                     " Number of space that <TAB>
set softtabstop=2                 " Number of space that <TAB>
set shiftwidth=2                  " Number of space on (auto)ident
set laststatus=2                  " Always Show Status Bar
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set noshowmode                    " INSERT is unnecessary (see lightline.vim docs)
" set nu rnu                        " Activate line number and relative number

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set incsearch  " incremental search
set hlsearch   " highlighted search results
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

"---- ---- ---- ---- Scrolling ---- ---- ---- ----"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
" set mouse=a        " Uncomment if you like to use mouse to select

"---- ---- ---- ---- Tabs & Trailing Spaces ---- ---- ---- ----"
" Toggle listchars
fun! ToggleLC()
    if &listchars == ''
        set listchars=''
    else
        set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    endif
endfun

" Toggle colorcolumn
fun! ToggleCC()
    if &cc == ''
        set cc=80
    else
        set cc=
    endif
endfun

" Use  ",-<space>" to toggle relative number, colorcolumn, listchars and search highlight
nnoremap <silent> <leader><space> :noh<cr>:call ToggleLC()<cr>:call ToggleCC()<cr>:set nu! rnu!<cr>:set nolist!<cr>

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
colorscheme PaperColor     " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set cursorline             " Cursor Line
set cursorcolumn           " Cursor Column
set foldcolumn=1           " Width between text and border
set fillchars+=vert:\      " remove ugly vertical lines on window division
"set colorcolumn=80         " Screen columns that are highlight
" hi Comment cterm=italic
if !has("gui_running")
  hi vertsplit ctermfg=bg ctermbg=bg
endif

"" GVim
set guioptions-=m " Disable menu bar
set guioptions-=T " Disable toolbar
set guioptions-=l " Disable left-hand scrollbar
set guioptions-=L " Disable left-hand scrollbar vertically
set guioptions-=r " Disable right-hand scrollbar
set guioptions-=R " Disable right-hand scrollbar vertically
set guioptions-=e " Disable gui tabs
hi vertsplit guifg=bg guibg=bg
if has("autocmd") && has("gui")
    au GUIEnter * set vb t_vb=
    set guifont=Monospace\ Regular\ 12
endif

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
"" Make it easy to edit the Vimrc file."
nmap <Leader>ev :tabedit ~/.vim/vimrc<cr>

""Open notes file"
nmap <silent><Leader>en :vsplit ~/.vim/NOTES.md<cr>:vertical resize 50<cr>:let &statusline='%#Normal# '<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Escape to the NORMAL mode
inoremap jj <esc>

"" terminal emulation
nnoremap <silent> <leader>sh :below terminal<CR>

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

"" Zoom Window
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

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
"" vim-go
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"" lightline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


"" vim-gitgutter
nmap <silent><F8> :GitGutterToggle<cr>
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1

"" AutoComplPop
" References
" https://www.youtube.com/watch?v=2f8h45YR494
" https://github.com/nickjj/dotfiles
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

"" Vinegar
" Initialize with dot files hidden. Press 'gh' to toggle dot file hiding.
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Closes it vinegar buffer after opening the file
let g:netrw_fastbrowse = 0
" Specify user's preference for a viewer
let g:netrw_browsex_viewer="setsid xdg-open"

"" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

"" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>
nnoremap <silent> <C-p> :FZF -m<CR>

" Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"" Ack.vim
nmap ,r :Ack!<space>
nmap ,wr :execute ":Ack! " . expand('<cword>')<CR>
" let g:ackpreview = 1
let g:ackhighlight = 1

"---- ---- ---- ---- Auto-Commands ---- ---- ---- ----"
" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" Automatically source the Vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost ~/.vim/vimrc source %
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
