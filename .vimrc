" - Vim Plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" (if gruvbox error: git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox)
"
" - YCM:
" https://github.com/ycm-core/YouCompleteMe#linux-64-bit
" ./install.py --clang-completer --clangd-completer
" sudo apt install clangd gcc g++ clang-format 
"
" - CMake support
" wget https://raw.githubusercontent.com/JDevlieghere/dotfiles/main/.vim/.ycm_extra_conf.py -o ~/.vim/.ycm_extra_conf.py
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hidden
set wildmenu
set spell
set spelllang=en,it

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'

cal plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0
let g:ycm_extra_conf='~/.vim/.ycm_extra_conf.py' 
let g:autopep8_disable_show_diff=1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
autocmd FileType c* nnoremap <Leader>f :YcmCompleter Format<CR>
autocmd FileType python nnoremap <Leader>f :Autopep8<CR>
nnoremap <Leader>cmp :!g++ %<CR>
nnoremap <Leader>run :!./a.out<CR>
nnoremap <Leader>crun :!g++ % && ./a.out<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
