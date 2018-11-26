hi clear
syntax reset
let g:colors_name = "eighty-five"

let s:black_0 = { "gui": "#282828", "cterm": "0" }
let s:black_1 = { "gui": "#35312F", "cterm": "8" }
let s:black_2 = { "gui": "#46403D", "cterm": "240" }
let s:black_3 = { "gui": '#877869', "cterm": "9" }
let s:white_0 = { "gui": "#CFBC97", "cterm": "15" }
let s:white_1 = { "gui": "#FBEFC0", "cterm": "243" }
let s:white_2 = { "gui": '#E8D6A9', "cterm": "246"}
let s:red     = { "gui": '#E25C5C', "cterm": "1" }
let s:blue    = { "gui": '#789B8D', "cterm": "153" }
let s:green   = { "gui": '#7DA76B', "cterm": "157"}
let s:purple  = { "gui": '#BD8190', "cterm": "5" }
let s:yellow  = { "gui": '#D3AF64', "cterm": "11" }
let s:orange  = { "gui": '#D88C61', "cterm": "3" }

let s:fg = s:white_2
let s:bg = s:black_1

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

if &background == "dark"
  let s:bg = s:black_1
  let s:fg = s:white_2
  let s:subtle = s:black_2
else
  " TODO
endif

call s:h('SyntaxTodo', { "fg": s:red, "bg": s:yellow, "gui": "bold" })
call s:h('None', { 'fg': s:fg, 'bg': s:bg, 'gui': 'NONE' })

" Highlights - UI ------------------------------------------{{{
call s:h('ColorColumn',  { "bg": s:black_2 })
call s:h('CursorLine',   { "bg": s:subtle })
call s:h('CursorLineNr', { 'bg': s:black_2 })
call s:h("Cursor",       { "fg": s:fg, "gui": "reverse" })
call s:h('DiffAdd',      { "fg": s:black_2, "bg": s:green })
call s:h('DiffChange',   { "bg": s:fg })
call s:h('DiffDelete',   { "fg": s:black_2, "bg": s:red })
call s:h('DiffText',     { "fg": s:black_2, "bg": s:yellow })
call s:h('Directory',    { "fg": s:blue })
call s:h('Error',        { "fg": s:red })
call s:h('Errormsg',     { "fg": s:black_2, "bg": s:red })
call s:h('FoldColumn',   { "bg": s:black_2 })
call s:h('Folded',       { "fg": s:black_3 })
call s:h('IncSearch',    { "bg": s:black_3, "gui": "inverse" })
call s:h('MatchParen',   { "bg": s:black_3, "gui": "bold" })
call s:h('MoreMsg',      { "fg": s:blue })
call s:h("Normal",       { "fg": s:fg, "bg": s:bg })  " Background / Text color
call s:h("NonText",      { "fg": s:subtle })
call s:h('Pmenu',        { "fg": s:white_2, "bg": s:black_2 })
call s:h('PmenuSbar',    { "bg": s:black_2 })
call s:h('PmenuSel',     { "fg": s:blue, "bg": s:black_2 })
call s:h('PmenuThumb',   { "bg": s:black_3 })
call s:h('Search',       { "fg": s:yellow, "bg": s:black_2 })
call s:h('SignColumn',   { "fg": s:orange })
call s:h('SpellBad',     { "sp": s:red, "gui": "undercurl" })
call s:h('StatusLine',   { "fg": s:black_1, "bg": s:black_2, "gui": "inverse" })
call s:h('StatusLineNC', { "fg": s:black_1, "bg": s:black_3, "gui": "inverse" })
call s:h('VertSplit',    { "fg": s:black_3, "bg": s:black_2 })
call s:h("Visual",       { "bg": s:bg, "gui": "inverse" })
call s:h('WarningMsg',   { "fg": s:red, "bg": s:black_1 })
call s:h('WildMenu',    { "fg": s:green, "bg": s:black_2 })
hi! link CursorColumn  CursorLine
hi! link Ignore None
hi! link LineNr NonText
hi! link ModeMsg MoreMsg
hi! link Question MoreMsg
hi! link SpecialKey NonText
hi! link Title None

" }}}

" Highlights - Generic Syntax ------------------------------------------{{{

call s:h('Boolean',      { "fg": s:orange })
call s:h('Comment',      { "fg": s:black_3, "gui": "italic" })
call s:h('Constant',     { "fg": s:blue })
call s:h("Function",     { "gui": "bold", "cterm": "bold" })
call s:h("Statement",    { "fg": s:white_2 })
call s:h('StorageClass', { "fg": s:green })
call s:h('String',       { "fg": s:yellow })
call s:h('Todo',         { "fg": s:yellow, "bg": s:bg })
call s:h('Type',         { "fg": s:blue, "gui": "italic" })
hi! link Conditional None
hi! link Define None
hi! link Delimiter None
hi! link Identifier None
hi! link Include None
hi! link Macro None
hi! link Number Constant
hi! link PreCondit None
hi! link PreProc None
hi! link Special Constant
hi! link SpecialChar Constant
hi! link Structure None
hi! link Tag None
hi! link Typedef Type
hi! link Underlined None
" }}}

" Highlights - JS ------------------------------------------{{{
hi! link jsClassKeyword Constant
hi! link jsImport Constant
hi! link jsExport Constant
hi! link jsGlobalObjects Constant
hi! link jsGlobalNodeObjects Constant
hi! link jsExections Constant
call s:h('jsReturn', { "fg": s:orange })
call s:h('jsVariableDef', { "fg": s:white_1 })
call s:h('jsClassDefinition', { "fg": s:white_1 })
call s:h('jsFuncArg', { "fg": s:white_0 })
" }}}

" Highlights - Elixir ------------------------------------------{{{
hi! link elixirDefine Constant
hi! link elixirInclude Constant
hi! link elixirModuleDefine Constant
hi! link elixirPrivateDefine Constant
call s:h('elixirArguments', { "fg": s:white_0 })
call s:h('elixirModuleDeclaration', { "fg": s:white_1 })
" }}}

" Highlights - vim-sneak ------------------------------------------{{{
call s:h('Sneak', { "fg": s:yellow, "bg": s:black_1, "gui": "inverse" })
" }}}

" Highlights - user ------------------------------------------{{{
call s:h('User1', { "fg": s:red })
call s:h('User2', { "fg": s:blue })
call s:h('User3', { "fg": s:green })
call s:h('User4', { "fg": s:purple })
call s:h('User5', {  "bg": s:bg })
" }}}
