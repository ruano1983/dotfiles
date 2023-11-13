" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

" Aquí irán los plugins a instalar
Plug 'scrooloose/nerdtree' "Arbol de directorios
Plug 'navarasu/onedark.nvim' " Tema
Plug 'EdenEast/nightfox.nvim' "Tema  
" Plug 'vim-airline/vim-airline' "Barra de estado
" Plug 'vim-airline/vim-airline-themes'  "Temas vim-airline
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'junegunn/fzf'
Plug 'yggdroot/indentline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'gen740/SmoothCursor.nvim'
"Plug 'romgrk/barbar.nvim'
Plug 'ap/vim-buftabline'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
"Configuración de NerdTree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
let g:NERDTreeWinSize=40
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Abrir/cerrar NERDTree con F2
map <F2> :NERDTreeToggle<CR>
"Configuracion de airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
let g:airline_theme='google_dark' "Tema de airline
colorscheme carbonfox "Color tema
"set guifont=DroidSansrono_powerline\ 16
"let g:airline_left_sep = "\uE0B4"
"let g:airline_right_sep = "\uE0B6"
" Luego de esta línea puedes agregar tus configuraciones y mappings
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)
"set nowrap  " No dividir la línea si es muy larga
set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres
set showmatch
set autoindent	"autoidentación
set shiftwidth=4
set softtabstop=4
set smartindent "identación intelegente
set hlsearch	
set smartcase

"Ignorar tipos de ficheros
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.odt
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']




lua << END
require('lualine-config')
require('smoth-config')
END


