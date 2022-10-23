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
local green = hsl("#7DA76B")
local orange = hsl("#d89a76")
local purple = hsl("#b98895")
local blue = hsl("#7e9b8f")
local red = hsl("#e25c5c")
local yellow = hsl("#d3b471")

local text = hsl(43, 53, 77)
local text_dim = hsl("#CFBC97")
local bg = grey800
local bg_light = bg.lighten(5)
local error = red
local accent = blue
local accent_light = text.mix(accent, 80)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
-- stylua: ignore start
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
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

    -- normal text
    Normal { bg = bg, fg = text },

    -- any comment
    Comment { fg = grey400, gui = "italic" },

    -- used for the columns set with 'colorcolumn'
    ColorColumn { bg = bg_light },

    -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Conceal      { },

    -- character under the cursor
    -- Cursor       { },

    -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- lCursor      { },

    -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorIM     { },

    -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorColumn { },

    -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLine { bg = bg_light },

    -- directory names (and other special names in listings)
    Directory { fg = accent },

    -- diff mode: Added line |diff.txt|
    DiffAdd { fg = green },

    -- diff mode: Changed line |diff.txt|
    DiffChange { fg = purple },

    -- diff mode: Deleted line |diff.txt|
    DiffDelete { fg = red },

    -- diff mode: Changed text within a changed line |diff.txt|
    DiffText { fg = red, gui = "inverse" },

    -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    EndOfBuffer { fg = bg },

    -- cursor in a focused terminal
    -- TermCursor   { },

    -- cursor in an unfocused terminal
    -- TermCursorNC { },

    -- error messages on the command line
    ErrorMsg { fg = red, gui = "bold" },

    -- Borders around float
    FloatBorder { bg = bg, fg = blue },

    -- the column separating vertically split windows
    VertSplit { bg = bg, fg = grey500 },

    -- line used for closed folds
    Folded { bg = grey600, fg = text },

    -- 'foldcolumn'
    FoldColumn { Normal },

    -- column where |signs| are displayed
    SignColumn { fg = bg.lighten(50), bg = bg },

    -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    IncSearch { bg = yellow.darken(15), fg = Normal.bg.darken(10) },

    -- |:substitute| replacement text highlighting
    -- Substitute   { },

    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr { fg = grey400 },

    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineNr { fg = yellow },

    -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen { fg = orange, gui = "bold" },

    Noise { fg = grey400 },

    -- 'showmode' message (e.g., "-- INSERT -- ")
    -- ModeMsg      { fg = green },

    -- Area for messages and cmdline
    -- MsgArea      { },

    -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MsgSeparator { },

    -- |more-prompt|
    MoreMsg { fg = green, gui = "bold" },

    -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NonText { Comment },

    -- Normal text in floating windows.
    NormalFloat { bg = bg, fg = text_dim },

    -- normal text in non-current windows
    -- NormalNC     { },

    -- Popup menu: normal item.
    Pmenu { bg = grey700 },

    -- Popup menu: selected item.
    PmenuSel { bg = Pmenu.bg.lighten(20), fg = text },

    -- Popup menu: scrollbar.
    PmenuSbar { Normal },

    -- Popup menu: Thumb of the scrollbar.
    PmenuThumb { bg = grey500 },

    -- |hit-enter| prompt and yes/no questions
    Question { Normal },

    -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- QuickFixLine { },

    -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    Search { bg = grey500, fg = text },

    -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpecialKey { Normal },

    -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellBad { fg = grey400.mix(red, 20), gui = "undercurl" },

    -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { },

    -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { },

    -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { },

    -- status line of current window
    StatusLine { Normal },

    -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window. Need separate def to avoid carets
    StatusLineNC { bg = bg, fg = text },

    -- tab pages line, not active tab page label
    TabLine { Normal },

    -- tab pages line, where there are no labels
    TabLineFill { Normal },

    -- tab pages line, active tab page label
    -- TabLineSel   { },

    -- TabLineSel   { fg = green },

    -- titles for output from ":set all", ":autocmd" etc.
    Title { Normal },

    -- Visual mode selection
    Visual { bg = grey600, fg = text },

    -- Visual mode selection when vim is "Not Owning the Selection".
    -- VisualNOS    { },

    -- warning messages
    WarningMsg { Normal },

    -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Whitespace   { },

    -- current match in 'wildmenu' completion
    WildMenu { Normal },


    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant { Normal }, -- (preferred) any constant
    String { fg = yellow }, --  a string constant: "this is a string"
    -- Character    { },              --  a character constant: 'c', '\n'
    -- Number       { fg = purple },  --  a number constant: 234, 0xff
    -- Boolean      { },              --  a boolean constant: TRUE, false
    -- Float        { },              --  a floating point constant: 2.3e10

    Identifier { Normal }, -- (preferred) any variable name
    Function { fg = text }, -- function name (also: methods for classes)

    Statement { Normal }, -- (preferred) any statement
    Conditional { fg = orange }, --  if, then, else, endif, switch, etc.
    Repeat { fg = accent }, --   for, do, while, etc.
    -- Label          { },            --    case, default, etc.
    -- Operator       { },            -- "sizeof", "+", "*", etc.
    -- Keyword         { fg = accent },  --  any other keyword,  Keyword {}
    -- Exception      { },            --  try, catch, throw

    PreProc { Normal }, -- (preferred) generic Preprocessor
    -- Include        { },            --  preprocessor #include
    -- Define         { },            --   preprocessor #define
    -- Macro          { },            --    same as Define
    -- PreCondit      { },            --  preprocessor #if, #else, #endif, etc.

    Type { Normal }, -- (preferred) int, long, char, etc.
    StorageClass { fg = accent }, -- static, register, volatile, etc.
    -- Structure      { },            --  struct, union, enum, etc.
    -- Typedef        { },            --  A typedef

    Special { Normal }, -- (preferred) any special symbol
    SpecialChar { Normal }, --  special character in a constant
    -- Tag            { },            --    you can use CTRL-] on this
    Delimiter { Normal }, --  character that needs attention
    -- SpecialComment { },            -- special things inside a comment
    -- Debug          { },            --    debugging statements

    Underlined { fg = accent, gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold         { gui = "bold" },
    -- Italic       { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { },            -- (preferred) left blank, hidden  |hl-Ignore|

    Error { fg = error }, -- (preferred) any erroneous construct
    Todo { fg = yellow, gui = 'bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText { fg = SignColumn.fg, gui = "bold" }, -- used for highlighting "text" references
    LspReferenceRead { fg = SignColumn.fg, gui = "bold" }, -- used for highlighting "read" references
    LspReferenceWrite { fg = SignColumn.fg, gui = "bold" }, -- used for highlighting "write" references

    -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticError { Error },

    -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = yellow },

    -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = accent },

    -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = text_dim },

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

    User1 { fg = red },
    User2 { fg = accent },
    User3 { fg = green },
    User4 { fg = purple },
    User5 { fg = yellow },
    User6 { fg = orange },

    -- Lang -------------------------------------------------------------------

    -- diff -------------------------------------------------------------------

    diffAdded { DiffAdd },
    diffChanged { DiffChange },
    diffRemoved { DiffDelete },

    -- JS / TS ----------------------------------------------------------------

    -- jsImport                   { StorageClass },
    -- jsExport                   { StorageClass },
    -- jsBuiltinValues            { StorageClass },
    -- jsFunction                 { StorageClass },
    jsStorageClass { StorageClass },
    jsReturn { fg = orange },
    typescriptImport { StorageClass },
    typescriptExport { StorageClass },
    typescriptVariable { StorageClass },
    typescriptFuncKeyword { StorageClass },
    -- typescriptStatementKeyword { StorageClass },
    -- typescriptBoolean          { StorageClass },
    -- typescriptGlobal           { StorageClass },
    typescriptBOMWindowMethod { fg = purple },
    jsxComponentName { fg = text_dim },
    jsxAttrib { fg = accent_light },

    -- CSS --------------------------------------------------------------------

    -- cssTagName       { StorageClass },
    -- cssClassName     { fg = StorageClass.fg.darken(10) },
    cssFunctionName { fg = purple },
    cssUnitDecorators { fg = text.darken(10).desaturate(10) },

    -- Elixir ----------------------------------------------------------------

    elixirModuleDefine { fg = accent },
    elixirMacroDefine { elixirModuleDefine },
    elixirDefine { elixirModuleDefine },

    -- Lua -------------------------------------------------------------------

    luaLocal { StorageClass },
    luaRepeat { StorageClass },

    -- Markdown ---------------------------------------------------------------

    markdownH1 { fg = accent },
    markdownH2 { fg = accent },
    markdownH3 { fg = accent },
    markdownH4 { fg = accent },
    markdownH5 { fg = accent },
    markdownH6 { fg = accent },
    htmlH1 { fg = accent },
    htmlH2 { fg = accent },
    htmlH3 { fg = accent },
    htmlH4 { fg = accent },
    htmlH5 { fg = accent },
    htmlH6 { fg = accent },
    markdownHeading { fg = accent },

    -- HTML -------------------------------------------------------------------

    htmlArg { fg = accent_light },
    htmlTagName { fg = text_dim },

    -- SQL --------------------------------------------------------------------
    sqlStatement { fg = accent },
    sqlKeyword { fg = accent },
    sqlType { fg = orange },

    -- Plugins ----------------------------------------------------------------

    -- Packer -----------------------------------------------------------------
    packerStatusSuccess { fg = green, gui = 'bold' },
    packerOutput { gui = 'bold' },
    packerHash { fg = accent },

    -- nvim-cmp ---------------------------------------------------------------

    -- CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    -- CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },

    -- CmpItemAbbr = { fg = c.fg, bg = c.none },
    -- CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch { fg = text, bg = "NONE", gui = "bold" },
    -- CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },

    CmpItemKindDefault { fg = teal },
    -- CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindKeyword { fg = teal, bg = "NONE" },

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
    TSConditional { fg = orange }; -- For keywords related to conditionnals.
    sym("@conditional") { fg = orange }; -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { fg = Normal.fg.mix(purple, 70) }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude { fg = accent }; -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    sym("@include") { fg = accent };
    TSKeyword { StorageClass }, -- For keywords that don't fall in previous categories. Ex: const
    sym("@keyword") { StorageClass }, -- For keywords that don't fall in previous categories. Ex: const
    TSKeywordFunction { StorageClass },
    sym("@keyword.function") { StorageClass }, -- For keywords that don't fall in previous categories. Ex: const
    TSKeywordReturn { fg = orange },
    sym("@keyword.return") { fg = orange }, -- For keywords that don't fall in previous categories. Ex: const
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { TSFunction },-- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { },    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    TSPunctDelimiter { Noise }, -- For delimiters ie: `.`
    sym("@punctutation.delimiter") { Noise },
    -- TSPunctBracket       { };    -- For brackets and parens.
    -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat                { fg = accent }, -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    TSType { fg = text_dim }, -- For types.
    sym("@type") { fg = text_dim }, -- For types.
    TSTypeBuiltin { TSType }, -- For builtin types.
    sym("@type.builtin") { TSType }, -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    TSVariableBuiltin { fg = text_dim }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@variable.builtin") { fg = text_dim }, -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag { fg = text_dim }; -- Tags like html tag names.
    sym("@tag") { fg = text_dim }; -- Tags like html tag names.
    TSTagAttribute { fg = accent_light }, -- Tags like html tag names.
    sym("@tag.attribute") { fg = accent_light }, -- Tags like html tag names.
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
