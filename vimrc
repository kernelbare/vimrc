set encoding=utf-8  " Sets the character encoding used inside Vim
let using_neovim = has('nvim')
let using_vim = !using_neovim

"---- ---- ---- ---- ---- ---- Vim-Plug Initialization ---- ---- ---- ---- ---"
" Avoid modify this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif
" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" Obscure hacks done, you can now modify the rest of the config down below 

"---- ---- ---- ---- Plugins From Github and Vim-scripts ---- ---- ----"
if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif
" Essential Starter Pack Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'              " Fuzzy finder
Plug 'mileszs/ack.vim'               " Ack code search (requires ack installed in the system)
Plug 'itchyny/lightline.vim'         " A light and configurable statusline/tabline
Plug 'airblade/vim-gitgutter'        " Git diff gutter and stages/undoesks
Plug 'machakann/vim-highlightedyank' " Make the yanked region apparent!
Plug 'jiangmiao/auto-pairs'          " Vim plugin, insert or delete brackets, parens, quotes in pair 
Plug 'ap/vim-css-color'              " Preview colours in source code while editing
Plug 'pbrisbin/vim-mkdir'            " Automatically create any non-existent directories before writing the buffer
" Plug 'vim-scripts/AutoComplPop'      " Automatically opens popup menu for completions

" Tim Pope Section
Plug 'tpope/vim-commentary'          " Use 'gcc' to comment out a line
Plug 'tpope/vim-vinegar'             " Simple file browser
Plug 'tpope/vim-surround'            " Quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'            " A Git wrapper so awesome, it should be illegal

" Color Schemes
Plug 'dracula/vim', { 'as': 'dracula' } " Dark theme
Plug 'morhetz/gruvbox'                  " Gruvbox colorscheme

" Langs and Code Helpers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'              " Vim plugin that displays tags in a window, ordered by scope
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go development plugin for Vim
call plug#end()

"---- ---- ---- --- Install Plugins At The First Time Vim Runs --- ---- ---- ----"
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

"---- ---- ---- ---- Basic Setup For Vim ---- ---- ---- ----"
if using_vim
    " A bunch of things that are set by default in neovim, but not in vim
    set nocompatible           " No vi-compatible
    filetype plugin indent on  " Detect the type of file that is edited
    set laststatus=2           " Always Show Status Bar
    set incsearch              " Incremental search
    set hlsearch               " Highlighted search results
    syntax on                  " Enables Vim to show parts of the text in another font or color

    "---- ---- ---- ---- Better Backup, Swap and Undos Storage ---- ---- ---- ----"
    set directory=~/.vim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.vim/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.vim/dirs/undos
    set viminfo+=n~/.vim/dirs/viminfo
    " create needed directories if they don't exist
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
end

"---- ---- ---- ---- Basic Setup ---- ---- ---- ----"
set backspace=indent,eol,start    " Make backspace behave like every other editor
let mapleader = ','               " The default leader is \
set nowrap                        " Disable long line wrap
set autoindent                    " Copy indent from current line when starting a new line
set expandtab                     " Tabs and Spaces Handling
set tabstop=2                     " Number of space that <TAB>
set softtabstop=2                 " Number of space that <TAB>
set shiftwidth=2                  " Number of space on (auto)ident
set noerrorbells visualbell t_vb= " No damn bells
set clipboard=unnamed,unnamedplus " Copy into system (*, +) register
set tags=tags;                    " Look for a tags file in directories
set confirm                       " Use a dialog when an operation has to be confirmed
set title                         " The title of the window
set noshowmode                    " Insert is unnecessary
" set shell=/bin/bash 

"---- ---- ---- ---- Searching ---- ---- ---- ----"
set ignorecase " Ignore case when searching...
set smartcase  " ...Unless we type a capital

"---- ---- ---- ---- Scrolling ---- ---- ---- ----"
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"---- ---- ---- ---- Visual Settings ---- ---- ---- ----"
colorscheme dracula        " I love it that colorscheme
set bg=dark                " Background used for highlight color
set t_Co=256               " Enable 256 colors in Vim
set fillchars+=vert:\      " Remove ugly vertical lines on window division
if has ("termguicolors")   " When on, uses highlight-guifg
    set termguicolors      " > and highlight-guibg
endif                      " > attributes in	the terminal

"---- ---- ---- ---- Tabs & Trailing Spaces ---- ---- ---- ----"
" Use ",<space>" to toggle number, colorcolumn, listchars and search highlight
nnoremap <silent> <leader><space> :call ToggleCC()<cr>:noh<cr>

"---- ---- ---- ---- Mappings ---- ---- ---- ----"
"" Escape to the NORMAL mode
inoremap jj <esc>

"" Make it easy to edit the Vimrc file."
if using_neovim
  nmap <silent><Leader>ev :tabedit ~/.config/nvim/init.vim<cr>
else
  nmap <silent><Leader>ev :tabedit ~/.vim/vimrc<cr>
endif

"" Open notes file"
if using_neovim
  nmap <silent><Leader>en :vsplit ~/.config/nvim/NOTES.md<cr>:vertical resize 50<cr>:let &statusline='%#Normal# '<cr>
else
  nmap <silent><Leader>en :vsplit ~/.vim/NOTES.md<cr>:vertical resize 50<cr>:let &statusline='%#Normal# '<cr>
endif

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Go to the first non-blank character of the line
nnoremap 0 ^

"" Terminal
if using_neovim
  nnoremap <silent> <leader>sh :split term://zsh<cr>:startinsert<cr>
  tnoremap <silent><Esc> <C-\><C-n>:q!<cr>
  tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
else
  nnoremap <silent><leader>sh :below terminal<CR>
  " tnoremap <silent><Esc> <C-w>:q!<CR>
  set termwinsize=10x0 " Size of the terminal window
endif

"" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Search will center on the line
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
map <silent><F9> :tab sball <bar> :tabdo :close <bar> :vert sball<cr>

"" Open all Buffer in Tab
map <silent><F10> :tab sball<cr>

"" save as sudo
ca w!! w !sudo tee "%"

"---- ---- ---- ---- Plugins Settings ---- ---- ---- ----"
"" Lightline
let g:lightline = {'colorscheme': 'dracula'}

"" Vim-go
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gr <Plug>(go-run)
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" au filetype go inoremap <buffer> . .<C-x><C-o>

"" Tagbar
nmap <F7> :TagbarToggle<CR>

"" vim-gitgutter
nmap <silent><F8> :GitGutterToggle<cr>
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1

"" AutoComplPop
" References
" https://www.youtube.com/watch?v=2f8h45YR494
" https://github.com/nickjj/dotfiles
" set complete+=kspell
" set completeopt=menuone,longest
" set shortmess+=c

"" Vinegar
" Initialize with dot files hidden. Press 'gh' to toggle dot file hiding
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" Close Vinegar buffer after opening the file
let g:netrw_fastbrowse = 0
" Specify user's preference for a viewer
let g:netrw_browsex_viewer="setsid xdg-open"

"" Fzf.vim
" Search Files
nnoremap <silent> <C-p> :FZF -m<CR>
" Open buffers
nnoremap <silent> <leader>b :Buffers<CR>
" Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"" Ack.vim
nmap ,r :Ack!<space>
nmap ,wr :execute ":Ack! " . expand('<cword>')<CR>
" let g:ackpreview = 1
let g:ackhighlight = 1

"---- ---- ---- ---- Auto-Commands ---- ---- ---- ----"
" Delete trailing white space on save, useful for some filetypes ;)
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :%s/\s\+$//e

" Automatically source the Vimrc file on save
if using_neovim
  augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
  augroup END
else
  augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.vim/vimrc source %
  augroup END
endif

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Press 'q' to exit of a help or markdown file.
augroup notes 
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  autocmd FileType markdown nnoremap <buffer> q :q<cr>
  autocmd FileType help nnoremap <buffer> q :q<cr>
augroup END

"---- ---- ---- ---- Functions ---- ---- ---- ----"
" Super useful VisualSelection From an idea by Michael Naumann
fun! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfun

"" Toggle listchars and colorcolumn
fun! Options()
  set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
        \ nu!
        \ nolist!
        \ cursorline!
        \ cursorcolumn!
endfun
fun! ToggleCC()
    if &cc == ''
      call Options()
      set cc=80
    else
      call Options()
      set cc=
    endif
endfun

"---- ---- ---- ---- Custom configurations ---- ---- ---- ----"
" Include user's custom nvim configurations
if using_neovim
    let custom_configs_path = "~/.config/nvim/custom.vim"
else
    let custom_configs_path = "~/.vim/custom.vim"
endif
if filereadable(expand(custom_configs_path))
  execute "source " . custom_configs_path
endif
