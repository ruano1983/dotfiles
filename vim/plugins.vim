call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim' 
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/lightline.vim'
call plug#end()

