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

local grey400 = hsl(30, 4, 50)
local grey500 = hsl(30, 4, 40)
local grey600 = hsl(30, 4, 30)
local grey700 = hsl(30, 4, 25)
local grey800 = hsl(30, 4, 20)

local teal = hsl("#89C0C1")
local green = hsl(120, 30, 57)
local orange = hsl("#d89a76")
local purple = hsl("#b98895")
local blue = hsl("#7e9b8f")
local blue_dimmmed = hsl("#879891")
local red = hsl("#e25c5c")
local red_dimmed = hsl("#c24a4a")
local yellow = hsl("#d3b471")
local yellow_dimmed = hsl("#d3ab54")
local yellow_washed = hsl("#ffd686")

local text_dim = hsl(43, 30, 70)
local text = hsl(43, 53, 77)
local text_light = hsl(43, 53, 88)
local bg = grey800
local bg_light = bg.lighten(5)
local error = red
local accent = blue

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
-- stylua: ignore start
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

    Normal          { bg = bg, fg = text }, -- normal text
    Comment         { fg = grey400, gui = "italic" }, -- any comment
    ColorColumn     { bg = bg_light }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine      { Normal }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory       { fg = accent }, -- directory names (and other special names in listings)
    DiffAdd         { fg = green }, -- diff mode: Added line |diff.txt|
    DiffChange      { fg = purple }, -- diff mode: Changed line |diff.txt|
    DiffDelete      { fg = red }, -- diff mode: Deleted line |diff.txt|
    DiffText        { fg = red, gui = "inverse" },-- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer     { fg = bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg        { fg = red, gui = "bold" }, -- error messages on the command line
    FloatBorder     { bg = bg, fg = text_dim },
    VertSplit       { bg = bg, fg = grey500 },-- the column separating vertically split windows
    Folded          { bg = grey600, fg = text }, -- line used for closed folds
    FoldColumn      { Normal }, -- 'foldcolumn'
    SignColumn      { Normal }, -- column where |signs| are displayed
    IncSearch       { bg = yellow_dimmed, fg = Normal.bg.darken(10) },-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    -- LineNr       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen      { gui = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    Noise({ fg = grey400 }),
    -- ModeMsg({ fg = green }),-- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg({ fg = green, gui = "bold" }), -- |more-prompt|
    NonText({ Comment }),-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat({ bg = Normal.bg, fg = Normal.fg.darken(3) }), -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu({ bg = grey700 }),-- Popup menu: normal item.
    PmenuSel({ bg = Pmenu.bg.lighten(20), fg = text }),-- Popup menu: selected item.
    PmenuSbar({ Normal }), -- Popup menu: scrollbar.
    PmenuThumb({ bg = grey500 }),-- Popup menu: Thumb of the scrollbar.
    Question({ Normal }),-- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search({ bg = grey500, fg = text }),-- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey({ Normal }),-- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad({ fg = text, gui = "undercurl" }),-- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine({ Normal }), -- status line of current window
    StatusLineNC({ bg = bg, fg = text }), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window. Need separate def to avoid carets
    TabLine({ Normal }),-- tab pages line, not active tab page label
    TabLineFill({ Normal }),-- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    -- TabLineSel({ fg = green }),
    Title({ Normal }),-- titles for output from ":set all", ":autocmd" etc.
    Visual({ bg = grey600, fg = text_light }),-- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg({ Normal }),-- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu({ Normal }),-- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant({ Normal }), -- (preferred) any constant
    String({ fg = yellow }),--   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number({ fg = purple }),--   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier({ Normal }),-- (preferred) any variable name
    Function({ fg = text }),-- function name (also: methods for classes)

    Statement({ Normal }), -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    Keyword { fg = accent }, --  any other keyword,  Keyword {}
    -- Exception      { }, --  try, catch, throw

    PreProc({ Normal }),-- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type({ Normal }), -- (preferred) int, long, char, etc.
    StorageClass({ fg = accent }),-- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special({ Normal }),-- (preferred) any special symbol
    SpecialChar({ Normal }), --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter({ Normal }), --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined({ fg = blue, gui = "underline" }), -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error({ fg = error }),-- (preferred) any erroneous construct
    Todo({ Normal }),-- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    DiagnosticError({ Error }),-- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn({ fg = yellow }),-- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo({ fg = blue }),-- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint({ LspDiagnosticsDefaultHint }),-- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- DiagnosticVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- DiagnosticVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- DiagnosticVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- DiagnosticVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- DiagnosticUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- DiagnosticUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- DiagnosticUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- DiagnosticUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- DiagnosticFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- DiagnosticFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- DiagnosticFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- DiagnosticFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- DiagnosticSignError              { }, -- Used for "Error" signs in sign column
    -- DiagnosticSignWarning            { }, -- Used for "Warning" signs in sign column
    -- DiagnosticSignInformation        { }, -- Used for "Information" signs in sign column
    -- DiagnosticSignHint               { }, -- Used for "Hint" signs in sign column

    -- LspSignatureActiveParameter = { fg = c.orange },
    -- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

    -- User -------------------------------------------------------------------

    User1({ fg = red }),
    User2({ fg = blue }),
    User3({ fg = green }),
    User4({ fg = purple }),
    User5({ fg = yellow }),
    User6({ fg = orange }),

    -- Plugins ----------------------------------------------------------------

    -- JS / TS ----------------------------------------------------------------

    -- jsImport({ StorageClass }),
    -- jsExport({ StorageClass }),
    -- jsBuiltinValues({ StorageClass }),
    -- jsFunction({ StorageClass }),
    jsReturn({ fg = orange }),
    typescriptImport({ StorageClass }),
    typescriptExport({ StorageClass }),
    typescriptVariable({ StorageClass }),
    -- typescriptFuncKeyword({ StorageClass }),
    -- typescriptStatementKeyword({ StorageClass }),
    -- typescriptBoolean({ StorageClass }),
    -- typescriptGlobal({ StorageClass }),
    typescriptBOMWindowMethod({ fg = purple }),
    jsxComponentName({ fg = text }),
    jsxAttrib({ fg = text.mix(blue, 80) }),
    -- cssTagName({ StorageClass }),
    -- cssClassName({ fg = StorageClass.fg.darken(10) }),
    cssFunctionName({ fg = purple }),
    cssUnitDecorators({ fg = text.darken(10).desaturate(10) }),

    -- Elixir ----------------------------------------------------------------

    elixirModuleDefine({ fg = blue }),
    elixirMacroDefine({ elixirModuleDefine }),
    elixirDefine({ elixirModuleDefine }),

    -- Lua -------------------------------------------------------------------

    luaLocal({ StorageClass }),

    -- nvim-cmp ---------------------------------------------------------------

    --     CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    -- CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },

    -- CmpItemAbbr = { fg = c.fg, bg = c.none },
    -- CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, style = "strikethrough" },
    -- CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
    -- CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },

    CmpItemKindDefault({ fg = Normal.fg.desaturate(50) }),
    -- CmpItemMenu = { fg = c.comment, bg = c.none },

    -- CmpItemKindKeyword = { fg = c.cyan, bg = c.none },

    -- CmpItemKindVariable = { fg = c.magenta, bg = c.none },
    -- CmpItemKindConstant = { fg = c.magenta, bg = c.none },
    -- CmpItemKindReference = { fg = c.magenta, bg = c.none },
    -- CmpItemKindValue = { fg = c.magenta, bg = c.none },

    -- CmpItemKindFunction = { fg = c.blue, bg = c.none },
    -- CmpItemKindMethod = { fg = c.blue, bg = c.none },
    -- CmpItemKindConstructor = { fg = c.blue, bg = c.none },

    -- CmpItemKindClass = { fg = c.orange, bg = c.none },
    -- CmpItemKindInterface = { fg = c.orange, bg = c.none },
    -- CmpItemKindStruct = { fg = c.orange, bg = c.none },
    -- CmpItemKindEvent = { fg = c.orange, bg = c.none },
    -- CmpItemKindEnum = { fg = c.orange, bg = c.none },
    -- CmpItemKindUnit = { fg = c.orange, bg = c.none },

    -- CmpItemKindModule = { fg = c.yellow, bg = c.none },

    -- CmpItemKindProperty = { fg = c.green1, bg = c.none },
    -- CmpItemKindField = { fg = c.green1, bg = c.none },
    -- CmpItemKindTypeParameter = { fg = c.green1, bg = c.none },
    -- CmpItemKindEnumMember = { fg = c.green1, bg = c.none },
    -- CmpItemKindOperator = { fg = c.green1, bg = c.none },
    -- CmpItemKindSnippet = { fg = c.dark5, bg = c.none },

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
    -- TSFunction({ fg = Normal.fg.mix(purple, 70) }), -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword({ StorageClass }),-- For keywords that don't fall in previous categories. Ex: const
    -- TSKeywordFunction({ StorageClass }),
    TSKeywordReturn { fg = orange },
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod({ TSFunction }),-- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          {},    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    TSPunctDelimiter({ Noise }), -- For delimiters ie: `.`
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat({ fg = blue }), -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    TSType({ fg = text_dim }), -- For types.
    TSTypeBuiltin({ TSType }), -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    TSVariableBuiltin({ fg = text_dim }), -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagAttribute({ fg = blue }),-- Tags like html tag names.
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
-- stylua: ignore end

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
--
