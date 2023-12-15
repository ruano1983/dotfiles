set history=1000
set nocompatible
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
syntax on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set showmatch
set autoindent	"autoidentación
set shiftwidth=4
set softtabstop=4
set smartindent "identación intelegente
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
set wildmenu
set shiftwidth=4
set softtabstop=4
set wildoptions=pum
set hlsearch
set smartcase
nnoremap <c-s> :w<CR>
imap ññ <Esc>
set cursorline
so ~/.vim/plugins.vim
so ~/.vim/airline.vim
so ~/.vim/nerd.vim

set background=dark
set termguicolors     " enable true colors support

source ~/.config/nvim/colors/frikios.vim
