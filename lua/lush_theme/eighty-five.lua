--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local grey050 = hsl("#ebe8e6")
local grey100 = hsl("#d5d2d0")
local grey200 = hsl("#bfbcba")
local grey300 = hsl("#aaa7a5")
local grey400 = hsl("#959290")
local grey500 = hsl("#807e7c")
local grey600 = hsl("#6c6a68")
local grey700 = hsl("#595755")
local grey750 = hsl("#474543")
local grey775 = hsl("#42403d")
local grey800 = hsl("#353331")
local grey850 = hsl("#242220")
local grey900 = hsl("#141210")
local fg = hsl("#e4d2a6")
local teal = hsl("#89C0C1")
local green = hsl("#93c19a")
local orange = hsl("#d89a76")
local purple = hsl("#b98895")
local blue = hsl("#7e9b8f")
local blue_dimmmed = hsl("#879891")
local red = hsl("#e25c5c")
local red_dimmed = hsl("#c24a4a")
local yellow = hsl("#d3b471")
local yellow_dimmed = hsl("#d3ab54")
local yellow_washed = hsl("#ffd686")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    -- Normal {}
    Normal({ bg = grey800, fg = fg }), -- normal text

    -- Comment {}
    Comment({ fg = grey500, gui = "italic" }), -- any comment

    -- ColorColumn {}, -- used for the columns set with 'colorcolumn'
    ColorColumn({ bg = Normal.bg.lighten(5) }),

    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

    -- CursorLine {}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLine({ bg = Normal.bg.lighten(5) }),

    -- Directory {}, -- directory names (and other special names in listings)
    Directory({ fg = blue }),

    -- DiffAdd      { }, -- diff mode: Added line |diff.txt|
    -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
    -- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|

    -- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    EndOfBuffer({ fg = Normal.bg }),

    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    --
    -- ErrorMsg {}, -- error messages on the command line
    ErrorMsg({ bg = red, fg = Normal.fg }),

    -- FloatBorder {}
    FloatBorder({ bg = Normal.bg, fg = Normal.fg.darken(10) }),

    -- VertSplit    { }, -- the column separating vertically split windows
    VertSplit({ bg = Normal.bg, fg = CursorLine.bg.lighten(15) }),

    -- Folded       { }, -- line used for closed folds
    Folded({ bg = Normal.bg.lighten(10), fg = Normal.fg }),

    -- FoldColumn   { }, -- 'foldcolumn'
    FoldColumn({ Normal }),

    -- SignColumn   { }, -- column where |signs| are displayed
    SignColumn({ Normal }),

    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    IncSearch({ bg = yellow_dimmed, fg = Normal.bg.darken(10) }),

    -- Substitute   { }, -- |:substitute| replacement text highlighting

    -- LineNr       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr({ Comment }),

    -- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen({ fg = purple, gui = "bold" }),

    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    ModeMsg({ fg = green }),

    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|

    -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NonText({ Comment }),

    -- NormalFloat  { }, -- Normal text in floating windows.
    NormalFloat({ bg = Normal.bg, fg = Normal.fg.darken(3) }),

    -- NormalNC     { }, -- normal text in non-current windows

    -- Pmenu        { }, -- Popup menu: normal item.
    Pmenu({ bg = Normal.bg.lighten(10) }),

    -- PmenuSel     { }, -- Popup menu: selected item.
    PmenuSel({ bg = Normal.bg.lighten(25), fg = Normal.fg }),

    -- PmenuSbar    { }, -- Popup menu: scrollbar.
    PmenuSbar({ Pmenu }),

    -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    PmenuThumb({ PmenuSel }),

    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    Question({ fg = green }),

    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    Search({ bg = Normal.bg.lighten(10), fg = Normal.fg.desaturate(100) }),

    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpecialKey({ fg = teal }),

    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellBad({ fg = red, guisp = red, gui = "undercurl" }),

    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- StatusLine   { }, -- status line of current window
    StatusLine({ bg = Normal.bg, fg = grey500 }), -- status line of current window

    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineNC({ bg = Normal.bg, fg = grey500 }), -- Need separate def to avoid carets

    -- TabLine      { }, -- tab pages line, not active tab page label
    TabLine({ Normal }),

    -- TabLineFill  { }, -- tab pages line, where there are no labels
    TabLineFill({ bg = Normal.bg.lighten(10) }),

    -- TabLineSel   { }, -- tab pages line, active tab page label
    TabLineSel({ fg = green }),

    -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
    Title({ fg = blue, gui = "bold" }),

    -- Visual       { }, -- Visual mode selection
    Visual({ bg = CursorLine.bg, fg = Normal.fg.rotate(180) }),

    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".

    -- WarningMsg   { }, -- warning messages
    WarningMsg({ bg = yellow, fg = Normal.bg.darken(50) }),

    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- WildMenu     { }, -- current match in 'wildmenu' completion
    WildMenu({ bg = yellow, fg = Normal.bg }),

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Constant {}
    Constant({ fg = Normal.fg }), -- (preferred) any constant

    -- String         { }, --   a string constant: "this is a string"
    String({ fg = yellow }),

    -- Character      { }, --  a character constant: 'c', '\n'
    --
    -- Number         { }, --   a number constant: 234, 0xff
    Number({ fg = purple }),

    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    -- Identifier     { }, -- (preferred) any variable name
    Identifier({ Normal }),

    -- Function {}, -- function name (also: methods for classes)
    Function({ fg = orange.desaturate(15) }),

    -- Statement      { }, -- (preferred) any statement
    Statement({ Normal }),

    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    -- PreProc        { }, -- (preferred) generic Preprocessor
    PreProc({ fg = blue }),

    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (preferred) int, long, char, etc.
    Type({ fg = blue }),

    -- StorageClass   { }, -- static, register, volatile, etc.
    StorageClass({ fg = blue }),

    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    -- Special        { }, -- (preferred) any special symbol
    Special({ Normal }),

    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct
    Error({ bg = red.desaturate(20), fg = Normal.fg.lighten(50) }),

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Todo({ fg = yellow, gui = "bold" }),

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultError({ bg = Normal.bg, fg = Error.bg }),
    DiagnosticError({ LspDiagnosticsDefaultError }),

    -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning({ fg = yellow }),
    DiagnosticWarn({ LspDiagnosticsDefaultWarning }),

    -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation({ fg = blue }),
    DiagnosticInfo({ fg = blue }),

    -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint({ fg = purple }),
    DiagnosticHint({ LspDiagnosticsDefaultHint }),

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

    -- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

    -- User -------------------------------------------------------------------

    -- User1 {}
    User1({ fg = red }),

    -- User2 {}
    User2({ fg = blue }),

    -- User3 {}
    User3({ fg = green }),

    -- User4 {}
    User4({ fg = purple }),

    -- User5 {}
    User5({ fg = yellow }),

    -- User6 {}
    User6({ fg = orange }),

    -- BlueDimmed",{ "fg": s:blue_dimmmed })

    -- Plugins ----------------------------------------------------------------

    -- jsImport {}, import
    jsImport({ StorageClass }),

    -- jsExport {}, export
    jsExport({ StorageClass }),

    -- jsBuiltinValues { }
    jsBuiltinValues({ StorageClass }),

    -- jsFunction { },
    jsFunction({ StorageClass }),

    -- jsReturn { },
    jsReturn({ fg = orange }),

    -- typescriptImport{ StorageClass },
    typescriptImport({ StorageClass }),

    -- typescriptExport{ StorageClass },
    typescriptExport({ StorageClass }),

    -- typescriptVariable{ StorageClass },
    typescriptVariable({ StorageClass }),

    -- typescriptFuncKeyword{ StorageClass },
    typescriptFuncKeyword({ StorageClass }),

    -- typescriptStatementKeyword{ StorageClass },
    typescriptStatementKeyword({ StorageClass }),

    --typescriptBoolean{ StorageClass },
    typescriptBoolean({ StorageClass }),

    -- typescriptGlobal{ StorageClass },
    typescriptGlobal({ StorageClass }),

    -- cssTagName{ StorageClass },
    cssTagName({ StorageClass }),

    -- cssClassName{ fg = StorageClass.fg.darken(10) },
    cssClassName({ fg = StorageClass.fg.darken(10) }),

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.

    -- TSKeyword            { }; -- For keywords that don't fall in previous categories. Ex: const
    TSKeyword({ StorageClass }),

    -- TSKeywordFunction    {},     -- For keywords used to define a fuction.
    TSKeywordFunction({ StorageClass }),
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          {},    -- For parameters of a function.

    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    -- TSPunctDelimiter     { };    -- For delimiters ie: `.`
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
--
