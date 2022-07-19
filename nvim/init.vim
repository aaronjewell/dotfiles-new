call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'junegunn/fzf.vim'
    Plug 'simeji/winresizer'
    Plug 'simnalamburt/vim-mundo'
call plug#end()

" use the system clipboard
set clipboard+=unnamedplus

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" set line number
set number

" use 4 spaces instead of tab
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" allow unsaved hidden buffers
set hidden

" set leader to space
nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

" configure csv
augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" configure winresizer
let g:winresizer_start_key = "<leader>w"
