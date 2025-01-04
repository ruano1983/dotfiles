so ~/.config/nvim/plugins.vim
so ~/.config/nvim/nerdtree.vim
so ~/.config/nvim/airline.vim"
so ~/.config/nvim/jedi.vim

set history=1000
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
set cursorline  " Resalta la línea actual
"set colorcolumn=120  " Muestra la columna límite a 120 caracteres
set showmatch
set autoindent	"autoidentación
set shiftwidth=4
set softtabstop=4
set smartindent "identación intelegente
set hlsearch	
set smartcase
nnoremap <c-s> :w<CR>
imap ññ <Esc>
"Ignorar tipos de ficheros
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.odt
set background=dark
set termguicolors     " enable true colors support
source ~/.config/nvim/colors/frikios.vim

let g:lightline = {
      \ 'colorscheme': 'simpleblack',
      \ }

