" Tema Vim: Forest
" Basado en la paleta proporcionada

if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "forest"

" Colores base
hi clear

" Normal text
hi Normal       guifg=#f7f2b8 guibg=#121212

" Line numbers
hi LineNr       guifg=#7c7595 guibg=#121212
hi CursorLineNr guifg=#f7f2b8 guibg=#121212

" Cursor
hi Cursor       guifg=#121212 guibg=#60d3c3
hi CursorLine   guibg=#191919
hi CursorColumn guibg=#191919

" Comments
hi Comment      guifg=#7c7595 gui=italic

" Constants / Numbers / Booleans
hi Constant     guifg=#b6b476

" Strings
hi String       guifg=#52c1ae

" Identifiers (variables, functions)
hi Identifier   guifg=#54a8bb

" Statements (keywords, conditionals)
hi Statement    guifg=#a46863 gui=bold

" Preprocessor / Special
hi PreProc      guifg=#9189aa

" Type names
hi Type         guifg=#3e9f91 gui=bold

" Special characters
hi Special      guifg=#60d3c3

" Underlined / links
hi Underlined   guifg=#b6b476 gui=underline

" Error / warnings
hi Error        guifg=#f7f2b8 guibg=#a46863 gui=bold
hi WarningMsg   guifg=#b6b476 gui=bold

" Visual selection
hi Visual       guibg=#3e89a0

" Search highlighting
hi Search       guifg=#121212 guibg=#b6b476
hi IncSearch    guifg=#121212 guibg=#60d3c3

" Status line
hi StatusLine   guibg=#f7f2b8 guifg=#191919 gui=bold
hi StatusLineNC guibg=#7c7595 guifg=#191919

" VertSplit
hi VertSplit    guifg=#3e89a0 guibg=#121212

" Pmenu (popup menu)
hi Pmenu        guifg=#f7f2b8 guibg=#191919
hi PmenuSel     guifg=#121212 guibg=#60d3c3

" Folded lines
hi Folded       guifg=#7c7595 guibg=#121212

" Diff
hi DiffAdd      guibg=#3e9f91 guifg=#121212
hi DiffChange   guibg=#54a8bb guifg=#121212
hi DiffDelete   guibg=#a46863 guifg=#121212
hi DiffText     guibg=#b6b476 guifg=#121212

" Title
hi Title guifg=#f7f2b8

" No text
hi NonText guifg=#3e9f91 guibg=#121212

