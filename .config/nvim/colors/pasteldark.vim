" PastelDark - Ported from NvChad base46
" Maintainer: Ported for standalone use
" License: MIT

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "pasteldark"

" Color palette
let s:black = "#131a21"
let s:black2 = "#1a2128"
let s:one_bg = "#1e252c"
let s:one_bg2 = "#2a3138"
let s:one_bg3 = "#363d44"
let s:grey = "#363d44"
let s:grey_fg = "#4e555c"
let s:light_grey = "#545b62"
let s:white = "#b5bcc9"
let s:red = "#ef8891"
let s:pink = "#fca2af"
let s:green = "#9fe8c3"
let s:vibrant_green = "#9ce5c0"
let s:blue = "#99aee5"
let s:nord_blue = "#9aa8cf"
let s:yellow = "#fbdf90"
let s:purple = "#c2a2e3"
let s:dark_purple = "#b696d7"
let s:teal = "#92dbb6"
let s:orange = "#EDA685"
let s:cyan = "#b5c3ea"
let s:line = "#272e35"
let s:statusline_bg = "#181f26"
let s:lightbg = "#222930"
let s:pmenu_bg = "#ef8891"
let s:folder_bg = "#99aee5"
let s:foreground = "#ced4df"

" UI
exe 'hi Normal guifg=' . s:foreground . ' guibg=' . s:black
exe 'hi NormalFloat guibg=' . s:one_bg
exe 'hi Visual guibg=' . s:one_bg3
exe 'hi Comment guifg=' . s:grey_fg . ' gui=italic'
exe 'hi Constant guifg=' . s:orange
exe 'hi String guifg=' . s:vibrant_green
exe 'hi Character guifg=' . s:vibrant_green
exe 'hi Number guifg=' . s:orange
exe 'hi Boolean guifg=' . s:orange
exe 'hi Float guifg=' . s:orange
exe 'hi Identifier guifg=' . s:red
exe 'hi Function guifg=' . s:blue
exe 'hi Statement guifg=' . s:purple
exe 'hi Conditional guifg=' . s:purple
exe 'hi Repeat guifg=' . s:purple
exe 'hi Label guifg=' . s:purple
exe 'hi Operator guifg=' . s:cyan
exe 'hi Keyword guifg=' . s:purple
exe 'hi Exception guifg=' . s:purple
exe 'hi PreProc guifg=' . s:purple
exe 'hi Include guifg=' . s:purple
exe 'hi Define guifg=' . s:purple
exe 'hi Macro guifg=' . s:purple
exe 'hi PreCondit guifg=' . s:purple
exe 'hi Type guifg=' . s:yellow
exe 'hi StorageClass guifg=' . s:yellow
exe 'hi Structure guifg=' . s:yellow
exe 'hi Typedef guifg=' . s:yellow
exe 'hi Special guifg=' . s:cyan
exe 'hi SpecialChar guifg=' . s:cyan
exe 'hi Tag guifg=' . s:red
exe 'hi Delimiter guifg=' . s:foreground
exe 'hi SpecialComment guifg=' . s:grey_fg . ' gui=italic'
exe 'hi Debug guifg=' . s:red
exe 'hi Underlined gui=underline'
exe 'hi Error guifg=' . s:red . ' guibg=' . s:black
exe 'hi Todo guifg=' . s:purple . ' guibg=' . s:black . ' gui=bold'

" Editor
exe 'hi LineNr guifg=' . s:grey
exe 'hi CursorLine guibg=' . s:one_bg
exe 'hi CursorLineNr guifg=' . s:white
exe 'hi SignColumn guibg=' . s:black
exe 'hi VertSplit guifg=' . s:line . ' guibg=' . s:black
exe 'hi StatusLine guifg=' . s:foreground . ' guibg=' . s:statusline_bg
exe 'hi StatusLineNC guifg=' . s:grey_fg . ' guibg=' . s:statusline_bg
exe 'hi Pmenu guifg=' . s:white . ' guibg=' . s:one_bg
exe 'hi PmenuSel guifg=' . s:black . ' guibg=' . s:pmenu_bg
exe 'hi PmenuSbar guibg=' . s:one_bg2
exe 'hi PmenuThumb guibg=' . s:grey
exe 'hi TabLine guifg=' . s:grey_fg . ' guibg=' . s:one_bg
exe 'hi TabLineFill guibg=' . s:black
exe 'hi TabLineSel guifg=' . s:black . ' guibg=' . s:blue
exe 'hi Search guifg=' . s:black . ' guibg=' . s:yellow
exe 'hi IncSearch guifg=' . s:black . ' guibg=' . s:orange
exe 'hi Directory guifg=' . s:folder_bg
exe 'hi Folded guifg=' . s:grey_fg . ' guibg=' . s:one_bg
exe 'hi MatchParen guifg=' . s:orange . ' gui=bold'

" Diagnostics
exe 'hi DiagnosticError guifg=' . s:red
exe 'hi DiagnosticWarn guifg=' . s:yellow
exe 'hi DiagnosticInfo guifg=' . s:blue
exe 'hi DiagnosticHint guifg=' . s:cyan
exe 'hi DiagnosticUnderlineError gui=underline guisp=' . s:red
exe 'hi DiagnosticUnderlineWarn gui=underline guisp=' . s:yellow
exe 'hi DiagnosticUnderlineInfo gui=underline guisp=' . s:blue
exe 'hi DiagnosticUnderlineHint gui=underline guisp=' . s:cyan

" Git
exe 'hi DiffAdd guifg=' . s:vibrant_green . ' guibg=' . s:black
exe 'hi DiffChange guifg=' . s:blue . ' guibg=' . s:black
exe 'hi DiffDelete guifg=' . s:red . ' guibg=' . s:black
exe 'hi DiffText guifg=' . s:yellow . ' guibg=' . s:one_bg

" TreeSitter
exe 'hi @variable guifg=' . s:foreground
exe 'hi @variable.builtin guifg=' . s:red
exe 'hi @keyword guifg=' . s:purple
exe 'hi @keyword.function guifg=' . s:purple
exe 'hi @function guifg=' . s:blue
exe 'hi @function.builtin guifg=' . s:cyan
exe 'hi @string guifg=' . s:vibrant_green
exe 'hi @number guifg=' . s:orange
exe 'hi @boolean guifg=' . s:orange
exe 'hi @constant guifg=' . s:orange
exe 'hi @constant.builtin guifg=' . s:orange
exe 'hi @type guifg=' . s:yellow
exe 'hi @type.builtin guifg=' . s:yellow
exe 'hi @parameter guifg=' . s:foreground
exe 'hi @property guifg=' . s:cyan
exe 'hi @operator guifg=' . s:cyan
exe 'hi @punctuation.bracket guifg=' . s:foreground
exe 'hi @punctuation.delimiter guifg=' . s:foreground
exe 'hi @comment guifg=' . s:grey_fg . ' gui=italic'
exe 'hi @tag guifg=' . s:red
exe 'hi @tag.attribute guifg=' . s:yellow
exe 'hi @tag.delimiter guifg=' . s:foreground
