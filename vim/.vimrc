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
set noruler
set hlsearch
set smartcase
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
so ~/.vim/plugins.vim
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

set laststatus=2
set background=dark
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ }



