set history=1000
syntax on
set number
set cursorline
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
set ruler
set hlsearch
set smartcase

so ~/.vim/plugins.vim
"Configuracion de airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
let g:airline_theme='one' "Tema de airline

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

if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set background=dark
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
