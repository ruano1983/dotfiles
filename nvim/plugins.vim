" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')
" Aquí irán los plugins a instalar
Plug 'scrooloose/nerdtree' "Arbol de directorios
Plug 'ayu-theme/ayu-vim'  
Plug 'vim-airline/vim-airline' "Barra de estado
Plug 'vim-airline/vim-airline-themes'  "Temas vim-airline
Plug 'junegunn/fzf'
Plug 'yggdroot/indentline'
"Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
