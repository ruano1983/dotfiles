call plug#begin('~/.vim/plugged')
Plug 'navarasu/onedark.nvim' " Tema
Plug 'EdenEast/nightfox.nvim' "Tema  
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

