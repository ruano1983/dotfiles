set history=1000
set nocompatible
syntax on
set number
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
set noruler
set hlsearch
set smartcase
nnoremap <c-s> :w<CR>
imap ññ <Esc>

so ~/.vim/plugins.vim

"Configuracion de airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos
let g:airline_powerline_fonts = 1
let g:airline_theme='google_dark' "Tema de airline

"Configuración de NerdTree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
let g:NERDTreeWinSize=40
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Abrir/cerrar NERDTree con F2
map <F2> :NERDTreeToggle<CR>
"Ignorar tipos de ficheros
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.odt
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
set laststatus=2
set background=dark
set termguicolors     " enable true colors support
source ~/.config/nvim/colors/frikios.vim
