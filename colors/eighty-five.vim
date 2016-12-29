hi clear
syntax reset
let g:colors_name = "eighty-five"

let s:none = 'NONE'
let s:inverse = 'inverse'
let s:bold = 'bold'
let s:reverse = 'reverse'

let s:black_0 = '#282828'
let s:black_1 = '#35312F'
let s:black_2 = '#46403D'
let s:black_3 = '#5B524A'
let s:grey    = '#877869'
let s:white_0 = '#CFBC97'
let s:white_1 = '#FBEFC0'
let s:white_2 = '#E8D6A9'
let s:red     = '#E25C5C'
let s:blue    = '#789B8D'
let s:green   = '#7DA76B'
let s:purple  = '#BD8190'
let s:yellow  = '#D3AF64'
let s:orange  = '#D88C61'

let s:fg = s:white_2
let s:bg = s:black_1

function! s:HL(group, fg, bg, ...)
    let fg = a:fg
    let bg = a:bg

    if a:0 >= 1
        let em = a:1
    else
        let em = s:none
    endif

    let histring = ['hi', a:group,
        \ 'guifg=' . fg,
        \ 'guibg=' . bg,
        \ 'gui=' . em
        \ ]

    execute join(histring, ' ')
endfunction

call s:HL('SyntaxTodo', s:red, s:yellow, s:bold)
call s:HL('None', s:none, s:none)

if &background == "light"
    hi Boolean gui=NONE guifg=#707070 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi Comment gui=NONE guifg=#969696 guibg=NONE
    hi Conceal gui=NONE guifg=#707070 guibg=NONE
    hi Conditional gui=NONE guifg=#4a4a4a guibg=NONE
    hi Constant gui=NONE guifg=#707070 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLine gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLineNr gui=NONE guifg=#969696 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f5f5f5
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e3e3e3
    hi Directory gui=NONE guifg=#4a4a4a guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Folded gui=NONE guifg=#969696 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e3e3e3
    hi LineNr gui=NONE guifg=#c2c2c2 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e3e3e3
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff
    hi Number gui=NONE guifg=#707070 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f5f5f5
    hi PmenuSbar gui=NONE guifg=NONE guibg=#ededed
    hi PmenuSel gui=NONE guifg=NONE guibg=#e3e3e3
    hi PmenuThumb gui=NONE guifg=NONE guibg=#dbdbdb
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#ededed
    hi SignColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Special gui=NONE guifg=#707070 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c2c2c2 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#ededed
    " hi Statement gui=NONE guifg=#4a4a4a guibg=NONE
    call s:HL('Statement', s:white_2, s:none)
    hi StatusLine gui=NONE guifg=#262626 guibg=#ededed
    hi StatusLineNC gui=NONE guifg=#969696 guibg=#ededed
    " hi StorageClass gui=NONE guifg=#4a4a4a guibg=NONE
    call s:HL('StorageClass', s:green, s:none)
    hi String gui=NONE guifg=#707070 guibg=NONE
    hi TabLine gui=NONE guifg=#969696 guibg=#ededed
    hi TabLineFill gui=NONE guifg=NONE guibg=#ededed
    hi TabLineSel gui=NONE guifg=#262626 guibg=#ededed
    hi Title gui=NONE guifg=#707070 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#4a4a4a guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#e3e3e3 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e3e3e3
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d1d1d1
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    call s:HL('Boolean', s:orange, s:none)
    call s:HL('ColorColumn', 'NONE', s:black_2)
    call s:HL('Comment', s:grey, 'NONE')
    hi! link Conceal SyntaxTodo
    call s:HL('Conditional', s:none, s:none)
    call s:HL('Constant', s:green, s:none)
    call s:HL('Cursor', s:fg, s:none, s:reverse)
    call s:HL('CursorColumn', 'NONE', s:black_2)
    call s:HL('CursorLine', 'NONE', s:black_2)
    call s:HL('CursorLineNr', 'NONE', s:black_2)
    call s:HL('DiffAdd', s:black_2, s:green)
    call s:HL('DiffChange', s:none, s:fg)
    call s:HL('DiffDelete', s:black_2, s:red)
    call s:HL('DiffText', s:black_2, s:yellow)
    call s:HL('Directory', s:blue, s:none)
    call s:HL('Error', s:none, s:red)
    call s:HL('Errormsg', s:black_2, s:red)
    call s:HL('FoldColumn', s:none, s:black_2)
    call s:HL('Folded', s:black_3, s:none)
    hi! link Ignore None
    call s:HL('IncSearch', s:none, s:black_1, s:inverse)
    call s:HL('LineNr', s:black_3, s:none)
    call s:HL('MatchParen', s:none, s:black_3)
    call s:HL('ModeMsg', s:green, s:none)
    call s:HL('MoreMsg', s:green, s:none)
    call s:HL('NonText', s:black_3, s:none)
    call s:HL('Normal', s:white_2, s:black_1)
    call s:HL('Number', s:purple, s:none)
    call s:HL('Pmenu', s:white_2, s:black_2)
    call s:HL('PmenuSbar', s:none, s:black_2)
    call s:HL('PmenuSel', s:yellow, s:black_2)
    call s:HL('PmenuThumb', s:none, s:black_3)
    hi! link Question NONE
    call s:HL('Search', s:yellow, s:black_1, s:inverse)
    call s:HL('SignColumn', s:orange, s:none)
    call s:HL('Special', s:purple, s:none)
    hi SpecialKey gui=NONE guifg=#616161 guibg=NONE
    hi! link SpecialKey None
    call s:HL('SpellBad', s:red, s:bg)
    hi! link SpellCap SyntaxTodo
    hi! link SpellLocal SyntaxTodo
    hi! link SpellRare SyntaxTodo
    call s:HL('Statement', s:none, s:none)
    call s:HL('StatusLine', s:black_1, s:black_2, s:inverse)
    call s:HL('StatusLineNC', s:black_1, s:white_1, s:inverse)
    call s:HL('StorageClass', s:green, s:none)
    call s:HL('String', s:yellow, s:none)
    hi! link TabLine SyntaxTodo
    hi! link TabLineFill SyntaxTodo
    hi! link TabLineSel SyntaxTodo
    hi! link Title None
    call s:HL('Todo', s:yellow, s:bg)
    call s:HL('Type', s:blue, s:none)
    hi! link Underlined None
    call s:HL('VertSplit', s:black_3, s:black_2)
    call s:HL('Visual', s:none, s:black_1, s:inverse)
    hi! link VisualNOS None
    call s:HL('WarningMsg', s:red, s:black_1)
    call s:HL('WildMenu', s:green, s:black_2)
    hi! link lCursor None
    hi! link Identifier None
    hi! link PreProc None

    " vim-javascript
    call s:HL('jsImport', s:blue, s:none)
    call s:HL('jsExport', s:blue, s:none)
    call s:HL('jsGlobalObjects', s:blue, s:none)
    call s:HL('jsGlobalNodeObjects', s:blue, s:none)
    call s:HL('jsBuiltIns', s:blue, s:none)
    call s:HL('jsExceptions', s:blue, s:none)
    call s:HL('jsReturn', s:orange, s:none)
    call s:HL('jsVariableDef', s:white_1, s:none)
    call s:HL('jsClassDefinition', s:white_1, s:none)
    call s:HL('jsClassKeyword', s:blue, s:none)

    " git
    call s:HL('gitCommitOverflow', s:red, s:none)

    " User
    call s:HL('User1', s:red, s:none)
    call s:HL('User2', s:blue, s:none)
    call s:HL('User3', s:green, s:none)
    call s:HL('User4', s:purple, s:none)
    call s:HL('User5', s:none, s:bg)
endif
