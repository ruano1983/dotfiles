" Forest + (más saturado)
" Basado en tu paleta con tonos forestales vivos

if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "forest+"

" Base
hi clear
hi Normal       guifg=#fff7bf guibg=#121212
hi Cursor       guifg=#121212 guibg=#6ee4d0
hi CursorLine   guibg=#1a1a1a
hi CursorColumn guibg=#1a1a1a
hi LineNr       guifg=#8a80a4 guibg=#121212
hi CursorLineNr guifg=#fff7bf guibg=#121212

" Comentarios
hi Comment      guifg=#8a80a4 gui=italic

" Constantes / números
hi Constant     guifg=#c8c076

" Strings
hi String       guifg=#48b6a4

" Identificadores (variables, funciones)
hi Identifier   guifg=#5eb9cc

" Palabras clave (if, else, for...)
hi Statement    guifg=#b76d67 gui=bold

" Tipos y clases
hi Type         guifg=#48b6a4 gui=bold

" Preprocesador / macros
hi PreProc      guifg=#a391bb

" Especiales
hi Special      guifg=#6ee4d0

" Errores / advertencias
hi Error        guifg=#fff7bf guibg=#b76d67 gui=bold
hi WarningMsg   guifg=#c8c076 gui=bold

" Visual selection
hi Visual       guibg=#4999ad

" Búsqueda
hi Search       guifg=#121212 guibg=#c8c076
hi IncSearch    guifg=#121212 guibg=#6ee4d0

" StatusLine
hi StatusLine   guibg=#fff7bf guifg=#1a1a1a gui=bold
hi StatusLineNC guibg=#8a80a4 guifg=#1a1a1a

" Split
hi VertSplit    guifg=#4999ad guibg=#121212

" Pmenu (autocompletado)
hi Pmenu        guifg=#fff7bf guibg=#1a1a1a
hi PmenuSel     guifg=#121212 guibg=#6ee4d0

" Fold
hi Folded       guifg=#8a80a4 guibg=#121212

" Diff
hi DiffAdd      guibg=#48b6a4 guifg=#121212
hi DiffChange   guibg=#5eb9cc guifg=#121212
hi DiffDelete   guibg=#b76d67 guifg=#121212
hi DiffText     guibg=#c8c076 guifg=#121212

" Title
hi Title guifg=#f7f2b8

" No text
hi NonText guifg=#48b6a4 guibg=#121212

