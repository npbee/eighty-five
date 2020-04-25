" Name:       eighty-five.vim
" Version:    0.1
" License:    The MIT License (MIT)
"
" Based on
"
"   https://github.com/andreypopp/vim-colors-plain (MIT License)
"
" which in turn is based on
"
"   https://github.com/pbrisbin/vim-colors-off (MIT License)
"
" which in turn based on
"
"   https://github.com/reedes/vim-colors-pencil (MIT License)
"
"""
if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark
hi clear

  syntax reset
if exists('syntax_on')
endif

let g:colors_name = 'eighty-five'

let s:bg                = { "gui": "#353331" }
let s:fg                = { "gui": "#e4d2a6" }
let s:fg_dimmed         = { "gui": "#e4d2a6" }

let s:grey050           = { "gui": "#F7F7F7" }
let s:grey100           = { "gui": '#E1E1E1' }
let s:grey200           = { "gui": '#CFCFCF' }
let s:grey300           = { "gui": '#B1B1B1' }
let s:grey400           = { "gui": '#9E9E9E' }
let s:grey500           = { "gui": '#7E7E7E' }
let s:grey600           = { "gui": '#626262' }
let s:grey700           = { "gui": '#515151' }
let s:grey750           = { "gui": '#404040' }
let s:grey800           = s:bg
let s:grey850           = { "gui": "#3E3937" }
let s:grey900           = { "gui": '#222222' }

let s:green             = { "gui": "#93c19a" }
let s:orange            = { "gui": "#d89a76" }
let s:purple            = { "gui": "#b98895" }
let s:blue              = { "gui": "#7e9b8f" }
let s:blue_dimmmed      = { "gui": "#879891" }
let s:red               = { "gui": "#e27575" }
let s:yellow_dim        = { "gui": "#d3ab54" }
let s:yellow            = { "gui": "#d3b471" }
let s:error             = s:red

function! s:h(group, style)
  execute "hi!" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    " \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    " \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    " \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction


" A comment
call s:h("ColorColumn", { "bg": s:grey850 })
call s:h("Comment",     { "fg": s:grey500, "gui": "italic" })
call s:h("Constant",    { "fg": s:fg })
call s:h("CursorLine",  { "bg": s:grey850 })
call s:h("Directory",   { "fg": s:blue })
call s:h("EndOfBuffer", { "fg": s:bg, "bg": s:bg })
call s:h("Error",       { "bg": s:error, "fg": s:fg })
call s:h("ErrorMsg",    { "bg": s:error, "fg": s:fg })
call s:h("Folded",      { "bg": s:grey750, "fg": s:fg })
call s:h("FoldColumn",  { "bg": s:bg, "fg": s:fg })
call s:h("Identifier",  { "fg": s:fg })
call s:h("IncSearch",   { "fg": s:grey900, "bg": s:yellow })
call s:h("LineNr",      { "bg": s:grey850 })
call s:h("MatchParen",  { "fg": s:grey200, "gui": "bold" })
call s:h("MoreMsg",     { "fg": s:green })
call s:h("Normal",      { "fg": s:fg, "bg": s:bg})
call s:h("Number",      { "fg": s:purple })
call s:h("Noise",       { "fg": s:fg_dimmed })
call s:h("Pmenu",       { "bg": s:grey850 })
call s:h("NonText",     { "fg": s:grey850 })
call s:h("PmenuSel",    { "bg": s:grey700 })
call s:h("PmenuThumb",  { "bg": s:grey700 })
call s:h("PmenuSbar",   { "bg": s:grey700 })
call s:h("PreProc",     { "fg": s:fg })
call s:h("Search",      { "fg": s:grey900, "bg": s:yellow_dim })
call s:h("SignColumn",  { "bg": s:bg })
call s:h("Special",     { "fg": s:fg })
call s:h("Statement",   { "fg": s:fg })
call s:h("StatusLine",  { "bg": s:bg, "fg": s:grey500 })
call s:h("StatusLineNC",{ "bg": s:bg, "fg": s:grey500 })
call s:h("StorageClass",{ "fg": s:blue })
call s:h("String",      { "fg": s:yellow })
call s:h("Title",       { "fg": s:fg })
call s:h("Todo",        { "bg": s:yellow, "fg": s:bg })
call s:h("Type",        { "fg": s:blue })
call s:h("Underlined",  { "fg": s:blue })
call s:h("VertSplit",   { "bg": s:bg, "fg": s:grey700 })
call s:h("Visual",      { "bg": s:grey750 })
call s:h("WarningMsg",  { "fg": s:grey900, "bg": s:yellow })

call s:h('User1',     { "fg": s:red })
call s:h('User2',     { "fg": s:blue })
call s:h('User3',     { "fg": s:green })
call s:h('User4',     { "fg": s:purple })
call s:h('User5',     { "fg": s:yellow })
call s:h('User6',     { "fg": s:orange })
call s:h("BlueDimmed",{ "fg": s:blue_dimmmed })

call s:h("jsxTag",            { "fg": s:fg })
call s:h("jsxEndTag",         { "fg": s:fg })
call s:h("jsReturn",          { "fg": s:orange })
hi! link jsImport StorageClass
hi! link jsExport StorageClass
hi! link jsBuiltinValues StorageClass
hi! link jsFunction StorageClass
hi! link jsTemplateBrace BlueDimmed

hi! link elixirModuleDefine StorageClass

call s:h("CocInfoSign",    { "fg": s:grey500 })
call s:h("CocWarningSign", { "fg": s:yellow })
call s:h("CocErrorSign",   { "fg": s:error })

hi! link htmlTagName StorageClass
hi! link htmlArg Noise

hi! link cssTagName StorageClass
hi! link cssClassName BlueDimmed
