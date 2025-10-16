" Forest (más contraste)
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "forest++"

hi clear
hi Normal       guifg=#fffbd1 guibg=#121212
hi Cursor       guifg=#121212 guibg=#79f5df
hi CursorLine   guibg=#0f0f0f
hi CursorColumn guibg=#0f0f0f
hi LineNr       guifg=#8c7db4 guibg=#121212
hi CursorLineNr guifg=#fffbd1 guibg=#121212

" Comentarios
hi Comment      guifg=#8c7db4 gui=italic

" Constantes / números
hi Constant     guifg=#e0cf70

" Strings
hi String       guifg=#64e1c6

" Identificadores / funciones
hi Identifier   guifg=#6ad3e4

" Palabras clave
hi Statement    guifg=#d4776b gui=bold

" Tipos
hi Type         guifg=#3fc3aa gui=bold

" Preprocesador / macros
hi PreProc      guifg=#b99ad6

" Especiales
hi Special      guifg=#79f5df

" Errores / advertencias
hi Error        guifg=#fffbd1 guibg=#d4776b gui=bold
hi WarningMsg   guifg=#e0cf70 gui=bold

" Visual
hi Visual       guibg=#3ca6b9

" Búsqueda
hi Search       guifg=#121212 guibg=#e0cf70
hi IncSearch    guifg=#121212 guibg=#79f5df

" StatusLine
hi StatusLine   guibg=#fffbd1 guifg=#191919 gui=bold
hi StatusLineNC guibg=#8c7db4 guifg=#191919

" Split
hi VertSplit    guifg=#3ca6b9 guibg=#121212

" Pmenu
hi Pmenu        guifg=#fffbd1 guibg=#0f0f0f
hi PmenuSel     guifg=#121212 guibg=#79f5df

" Fold
hi Folded       guifg=#8c7db4 guibg=#121212

" Diff
hi DiffAdd      guibg=#3fc3aa guifg=#121212
hi DiffChange   guibg=#6ad3e4 guifg=#121212
hi DiffDelete   guibg=#d4776b guifg=#121212
hi DiffText     guibg=#e0cf70 guifg=#121212

" Title
hi Title guifg=#3fc3aa

" No text
hi NonText guifg=#48b6a4 guibg=#121212

