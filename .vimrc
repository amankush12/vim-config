"zo to open a single fold under the cursor.
"zc to close the fold under the cursor.
"zR to open all folds.
"zM to close all folds.

source ~/.vim/abbr.vim
" VIM SETTINGS-----------------------------------------------------------------{{{

set nocompatible
filetype on
filetype indent on
filetype plugin on
syntax on
set relativenumber
set encoding=UTF-8
set smarttab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set re=0
set nowrap
set noswapfile
set incsearch
set scrolloff=10
set hlsearch
set history=1000
set ignorecase
set smartcase
set nobackup

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Using iTerm2? Go-to preferences / profile / colors and disable the smart bar
" cursor color. Then pick a cursor and highlight color that matches your theme.
" That will ensure your cursor is always visible within insert mode.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\<esc>[5 q" " I beam cursor for insert mode
let &t_EI = "\<esc>[2 q" " block cursor for normal mode
let &t_SR = "\<esc>[3 q" " underline cursor for replace mode

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'vim-airline/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-eunuch'





call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{
let mapleader = "\<Space>" 


inoremap jj <esc>

" Turn off the highlights
nnoremap <leader>/ :nohlsearch<CR> 

" Fast saving
nmap <leader>w :w!<cr>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <leader>af :e! ~/.vim/abbr.vim<cr>
autocmd! bufwritepost ~/.vim/abbr.vim source ~/.vim/abbr.vim

"Open previous file 
map <leader>pf :e#<cr> 


" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" PLUGIN MAPPING  ------------------------------------------------------------

"Map the key to toggle NERDTree open and close.
nnoremap <leader>e :NERDTreeToggle<cr>

"Easy mostion config -------------------------------------------------------- 

map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"----------------------------------------------------------------------------
"
"Vim surround -------------------------------------------------------- 

" To stop using the predefined mapping
let g:surround_no_mappings = 1"
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap ys <Plug>Ysurround
nmap yS <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap SS <Plug>YSsurround
xmap S  <Plug>VSurround
xmap gS <Plug>VgSurround

" VIM multiple cursor-------------------------------------------------------
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"}}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" }}}
