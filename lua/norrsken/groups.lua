---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs NorrskenConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.visual or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalFloat = { fg = colors.fg, bg = colors.bg },
      Comment = { fg = colors.comment, italic = configs.italics.comments },
      Constant = { fg = colors.twilight },
      String = { fg = colors.aurora },
      Character = { fg = colors.aurora },
      Number = { fg = colors.glow },
      Boolean = { fg = "#FF7371" },
      Float = { fg = colors.glow },
      FloatBorder = { fg = colors.white },
      Operator = { fg = colors.twilight },
      Keyword = { fg = colors.twilight, italic = configs.italics.keywords },
      Keywords = { fg = colors.twilight, italic = configs.italics.keywords },
      Identifier = { fg = colors.glow },
      Function = { fg = colors.glow },
      Statement = { fg = colors.twilight },
      Conditional = { fg = colors.twilight },
      Repeat = { fg = colors.twilight },
      Label = { fg = colors.glow },
      Exception = { fg = colors.twilight },
      PreProc = { fg = colors.glow },
      Include = { fg = colors.twilight },
      Define = { fg = colors.twilight },
      Title = { fg = colors.glow },
      Macro = { fg = colors.twilight },
      PreCondit = { fg = colors.glow },
      Type = { fg = colors.fg },
      StorageClass = { fg = colors.twilight },
      Structure = { fg = colors.glow },
      TypeDef = { fg = colors.glow },
      Special = { fg = colors.aurora, italic = true },
      SpecialComment = { fg = colors.comment, italic = true },
      Error = { fg = colors.bright_red },
      Todo = { fg = colors.twilight, bold = true, italic = true },
      Underlined = { fg = colors.glow, underline = true },

      Cursor = { reverse = true },
      CursorLineNr = { fg = colors.fg, bold = true },

      SignColumn = { bg = colors.bg },

      Conceal = { fg = colors.comment },
      CursorColumn = { bg = colors.black },
      CursorLine = { bg = colors.selection },
      ColorColumn = { bg = colors.selection },

      StatusLine = { fg = colors.white, bg = colors.black },
      StatusLineNC = { fg = colors.comment },
      StatusLineTerm = { fg = colors.white, bg = colors.black },
      StatusLineTermNC = { fg = colors.comment },

      Directory = { fg = colors.glow },
      DiffAdd = { fg = colors.bg, bg = colors.glow },
      DiffChange = { fg = colors.shimmer },
      DiffDelete = { fg = colors.flare },
      DiffText = { fg = colors.comment },

      ErrorMsg = { fg = colors.bright_red },
      VertSplit = { fg = colors.black },
      WinSeparator = { fg = colors.black },
      Folded = { fg = colors.comment },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.shimmer },
      IncSearch = { fg = colors.shimmer, bg = colors.comment },
      LineNr = { fg = colors.comment },
      MatchParen = { fg = colors.fg, underline = true },
      NonText = { fg = colors.nontext },
      Pmenu = { fg = colors.white, bg = colors.menu },
      PmenuSel = { fg = colors.white, bg = colors.selection },
      PmenuSbar = { bg = colors.bg },
      PmenuThumb = { bg = colors.selection },

      Question = { fg = colors.twilight },
      QuickFixLine = { fg = colors.black, bg = colors.glow },
      SpecialKey = { fg = colors.nontext },

      SpellBad = { fg = colors.bright_red, underline = true },
      SpellCap = { fg = colors.glow },
      SpellLocal = { fg = colors.glow },
      SpellRare = { fg = colors.glow },

      TabLine = { fg = colors.comment },
      TabLineSel = { fg = colors.white },
      TabLineFill = { bg = colors.bg },
      Terminal = { fg = colors.white, bg = colors.black },
      Visual = { bg = colors.visual },
      VisualNOS = { fg = colors.visual },
      WarningMsg = { fg = colors.glow },
      WildMenu = { fg = colors.black, bg = colors.white },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ["@error"] = { fg = colors.bright_red },
      ["@punctuation.delimiter"] = { fg = colors.twilight },
      ["@punctuation.bracket"] = { fg = colors.twilight },
      ["@markup.list"] = { fg = colors.glow },

      ["@constant"] = { fg = colors.twilight },
      ["@constant.builtin"] = { fg = colors.twilight },
      ["@markup.link.label.symbol"] = { fg = colors.twilight },

      ["@constant.macro"] = { fg = colors.glow },
      ["@string.regexp"] = { fg = colors.flare },
      ["@string"] = { fg = colors.aurora },
      ["@string.escape"] = { fg = colors.twilight },
      ["@string.special.symbol"] = { fg = colors.glow },
      ["@character"] = { fg = colors.aurora },
      ["@number"] = { fg = colors.glow },
      ["@boolean"] = { fg = "#FF7371" },
      ["@number.float"] = { fg = colors.glow },
      ["@annotation"] = { fg = colors.glow },
      ["@attribute"] = { fg = colors.glow },
      ["@module"] = { fg = colors.shimmer },

      ["@function.builtin"] = { fg = colors.glow },
      ["@function"] = { fg = colors.glow },
      ["@function.macro"] = { fg = colors.aurora },
      ["@variable.parameter"] = { fg = colors.glow, italic = true },
      ["@variable.parameter.reference"] = { fg = colors.glow, italic = true },
      ["@function.method"] = { fg = colors.glow },
      ["@variable.member"] = { fg = colors.glow },
      ["@property"] = { fg = colors.shimmer },
      ["@constructor"] = { fg = colors.twilight },

      ["@keyword.conditional"] = { fg = colors.twilight },
      ["@keyword.repeat"] = { fg = colors.twilight },
      ["@label"] = { fg = colors.glow },

      ["@keyword"] = { fg = colors.twilight, italic = configs.italics.keywords },
      ["@keyword.function"] = { fg = colors.twilight, italic = configs.italics.keywords },
      ["@keyword.function.ruby"] = { fg = colors.twilight, italic = configs.italics.keywords },
      ["@keyword.operator"] = { fg = colors.twilight },
      ["@operator"] = { fg = colors.twilight },
      ["@keyword.exception"] = { fg = colors.glow },
      ["@type"] = { fg = colors.fg },
      ["@type.builtin"] = { fg = colors.fg, italic = true },
      ["@type.qualifier"] = { fg = colors.twilight },
      ["@structure"] = { fg = colors.twilight },
      ["@keyword.include"] = { fg = colors.twilight, italic = configs.italics.keywords },

      ["@variable"] = { fg = colors.glow },
      ["@variable.builtin"] = { fg = colors.glow, italic = true },

      ["@markup"] = { fg = colors.shimmer },
      ["@markup.strong"] = { fg = colors.glow, bold = true }, -- bold
      ["@markup.emphasis"] = { fg = colors.aurora, italic = true }, -- italic
      ["@markup.underline"] = { fg = colors.shimmer },
      ["@markup.heading"] = { fg = colors.comment, bold = true }, -- title
      ["@markup.raw"] = { fg = colors.glow }, -- inline code
      ["@markup.link.url"] = { fg = colors.fg, italic = true }, -- urls
      ["@markup.link"] = { fg = colors.twilight, bold = true },

      ["@tag"] = { fg = colors.twilight },
      ["@tag.attribute"] = { fg = colors.aurora },
      ["@tag.delimiter"] = { fg = colors.comment },

      -- Semantic
      ["@class"] = { fg = colors.glow },
      ["@struct"] = { fg = colors.glow },
      ["@enum"] = { fg = colors.glow },
      ["@enumMember"] = { fg = colors.twilight },
      ["@event"] = { fg = colors.glow },
      ["@interface"] = { fg = colors.glow },
      ["@modifier"] = { fg = colors.glow },
      ["@regexp"] = { fg = colors.flare },
      ["@typeParameter"] = { fg = colors.glow },
      ["@decorator"] = { fg = colors.glow },

      -- LSP Semantic (0.9+)
      ["@lsp.type.class"] = { fg = colors.glow },
      ["@lsp.type.enum"] = { fg = colors.glow },
      ["@lsp.type.decorator"] = { fg = colors.aurora },
      ["@lsp.type.enumMember"] = { fg = colors.twilight },
      ["@lsp.type.function"] = { fg = colors.glow },
      ["@lsp.type.interface"] = { fg = colors.glow },
      ["@lsp.type.macro"] = { fg = colors.glow },
      ["@lsp.type.method"] = { fg = colors.glow },
      ["@lsp.type.namespace"] = { fg = colors.shimmer },
      ["@lsp.type.parameter"] = { fg = colors.glow, italic = true },
      ["@lsp.type.property"] = { fg = colors.shimmer },
      ["@lsp.type.struct"] = { fg = colors.glow },
      ["@lsp.type.type"] = { fg = colors.fg },
      ["@lsp.type.variable"] = { fg = colors.glow },

      -- HTML
      htmlArg = { fg = colors.aurora },
      htmlBold = { fg = colors.glow, bold = true },
      htmlEndTag = { fg = colors.glow },
      htmlH1 = { fg = colors.twilight },
      htmlH2 = { fg = colors.twilight },
      htmlH3 = { fg = colors.twilight },
      htmlH4 = { fg = colors.twilight },
      htmlH5 = { fg = colors.twilight },
      htmlH6 = { fg = colors.twilight },
      htmlItalic = { fg = colors.aurora, italic = true },
      htmlLink = { fg = colors.twilight, underline = true },
      htmlSpecialChar = { fg = colors.glow },
      htmlSpecialTagName = { fg = colors.glow },
      htmlTag = { fg = colors.twilight },
      htmlTagN = { fg = colors.twilight },
      htmlTagName = { fg = colors.twilight },
      htmlTitle = { fg = colors.white },

      -- Markdown
      markdownBlockquote = { fg = colors.glow, italic = true },
      markdownBold = { fg = colors.glow, bold = true },
      markdownCode = { fg = colors.glow },
      markdownCodeBlock = { fg = colors.glow },
      markdownCodeDelimiter = { fg = colors.flare },
      markdownH1 = { fg = colors.comment, bold = true },
      markdownH2 = { fg = colors.comment, bold = true },
      markdownH3 = { fg = colors.comment, bold = true },
      markdownH4 = { fg = colors.comment, bold = true },
      markdownH5 = { fg = colors.comment, bold = true },
      markdownH6 = { fg = colors.comment, bold = true },
      markdownHeadingDelimiter = { fg = colors.flare },
      markdownHeadingRule = { fg = colors.comment },
      markdownId = { fg = colors.twilight },
      markdownIdDeclaration = { fg = colors.glow },
      markdownIdDelimiter = { fg = colors.twilight },
      markdownItalic = { fg = colors.aurora, italic = true },
      markdownLinkDelimiter = { fg = colors.twilight },
      markdownLinkText = { fg = colors.twilight },
      markdownListMarker = { fg = colors.fg },
      markdownOrderedListMarker = { fg = colors.flare },
      markdownRule = { fg = colors.comment },

      --  Diff
      diffAdded = { fg = colors.glow },
      diffRemoved = { fg = colors.flare },
      diffFileId = { fg = colors.glow, bold = true, reverse = true },
      diffFile = { fg = colors.nontext },
      diffNewFile = { fg = colors.glow },
      diffOldFile = { fg = colors.flare },

      debugPc = { bg = colors.menu },
      debugBreakpoint = { fg = colors.flare, reverse = true },

      -- Git Signs
      GitSignsAdd = { fg = colors.bright_green },
      GitSignsChange = { fg = colors.bright_magenta },
      GitSignsDelete = { fg = colors.bright_red },
      GitSignsAddLn = { fg = colors.black, bg = colors.bright_green },
      GitSignsChangeLn = { fg = colors.black, bg = colors.bright_magenta },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red },
      GitSignsCurrentLineBlame = { fg = colors.white },

      -- Telescope
      TelescopePromptBorder = { fg = colors.comment },
      TelescopeResultsBorder = { fg = colors.comment },
      TelescopePreviewBorder = { fg = colors.comment },
      TelescopeSelection = { fg = colors.white, bg = colors.selection },
      TelescopeMultiSelection = { fg = colors.twilight, bg = colors.selection },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg },
      TelescopeMatching = { fg = colors.aurora },
      TelescopePromptPrefix = { fg = colors.twilight },
      TelescopeResultsDiffDelete = { fg = colors.flare },
      TelescopeResultsDiffChange = { fg = colors.bright_magenta },
      TelescopeResultsDiffAdd = { fg = colors.glow },

      -- Flash
      FlashLabel = { bg = colors.flare, fg = colors.bright_white },

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.menu },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
      NvimTreeRootFolder = { fg = colors.fg, bold = true },
      NvimTreeGitDirty = { fg = colors.twilight },
      NvimTreeGitNew = { fg = colors.bright_green },
      NvimTreeImageFile = { fg = colors.twilight },
      NvimTreeFolderIcon = { fg = colors.twilight },
      NvimTreeIndentMarker = { fg = colors.nontext },
      NvimTreeEmptyFolderName = { fg = colors.comment },
      NvimTreeFolderName = { fg = colors.fg },
      NvimTreeSpecialFile = { fg = colors.twilight, underline = true },
      NvimTreeOpenedFolderName = { fg = colors.fg },
      NvimTreeCursorLine = { bg = colors.selection },
      NvimTreeIn = { bg = colors.selection },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.menu },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.bright_magenta },
      NeoTreeGitModified = { fg = colors.bright_magenta },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeDirectoryIcon = { fg = colors.twilight },
      NeoTreeIndentMarker = { fg = colors.nontext },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.twilight },
      BufferLineFill = { bg = colors.black },
      BufferLineBufferSelected = { bg = colors.bg },
      BufferLineSeparator = { fg = colors.black },

      -- LSP
      DiagnosticError = { fg = colors.flare },
      DiagnosticWarn = { fg = colors.aurora },
      DiagnosticInfo = { fg = colors.bright_magenta },
      DiagnosticHint = { fg = colors.glow },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.flare },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.aurora },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.bright_magenta },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.glow },
      DiagnosticSignError = { fg = colors.flare },
      DiagnosticSignWarn = { fg = colors.aurora },
      DiagnosticSignInfo = { fg = colors.bright_magenta },
      DiagnosticSignHint = { fg = colors.glow },
      DiagnosticFloatingError = { fg = colors.flare },
      DiagnosticFloatingWarn = { fg = colors.aurora },
      DiagnosticFloatingInfo = { fg = colors.bright_magenta },
      DiagnosticFloatingHint = { fg = colors.glow },
      DiagnosticVirtualTextError = { fg = colors.flare },
      DiagnosticVirtualTextWarn = { fg = colors.aurora },
      DiagnosticVirtualTextInfo = { fg = colors.bright_magenta },
      DiagnosticVirtualTextHint = { fg = colors.glow },

      LspDiagnosticsDefaultError = { fg = colors.flare },
      LspDiagnosticsDefaultWarning = { fg = colors.aurora },
      LspDiagnosticsDefaultInformation = { fg = colors.bright_magenta },
      LspDiagnosticsDefaultHint = { fg = colors.glow },
      LspDiagnosticsUnderlineError = { fg = colors.flare, undercurl = true },
      LspDiagnosticsUnderlineWarning = { fg = colors.aurora, undercurl = true },
      LspDiagnosticsUnderlineInformation = { fg = colors.bright_magenta, undercurl = true },
      LspDiagnosticsUnderlineHint = { fg = colors.glow, undercurl = true },
      -- LspReferenceText = { fg = colors.shimmer },
      -- LspReferenceRead = { fg = colors.shimmer },
      -- LspReferenceWrite = { fg = colors.shimmer },
      LspCodeLens = { fg = colors.bright_magenta },
      LspInlayHint = { fg = "#969696", bg = "#303038" },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg },
      LspFloatWinBorder = { fg = colors.comment },
      LspSagaHoverBorder = { fg = colors.comment },
      LspSagaSignatureHelpBorder = { fg = colors.comment },
      LspSagaCodeActionBorder = { fg = colors.comment },
      LspSagaDefPreviewBorder = { fg = colors.comment },
      LspLinesDiagBorder = { fg = colors.comment },
      LspSagaRenameBorder = { fg = colors.comment },
      LspSagaBorderTitle = { fg = colors.menu },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
      LspSagaDiagnosticBorder = { fg = colors.comment },
      LspSagaShTruncateLine = { fg = colors.comment },
      LspSagaDocTruncateLine = { fg = colors.comment },
      LspSagaLspFinderBorder = { fg = colors.comment },
      CodeActionNumber = { bg = "NONE", fg = colors.glow },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg },
      CmpItemAbbrMatch = { fg = colors.glow, bg = colors.bg },

      -- barbar
      BufferVisibleTarget = { fg = colors.flare },
      BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
      BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
      BufferCurrentSign = { fg = colors.twilight },
      BufferCurrentTarget = { fg = colors.flare },
      BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
      BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveMod = { fg = colors.aurora, bg = colors.black, italic = true },
      BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
      BufferInactiveTarget = { fg = colors.flare, bg = colors.black, bold = true },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemAbbr = { fg = colors.white, bg = colors.bg },
      CmpItemKind = { fg = colors.white, bg = colors.bg },
      CmpItemKindMethod = { link = "@function.method" },
      CmpItemKindText = { link = "@markup" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      CmpItemKindModule = { link = "@module" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      CmpItemKindReference = { link = "@variable.parameter.reference" },
      CmpItemKindUnit = { link = "@variable.member" },
      CmpItemKindValue = { link = "@variable.member" },
      CmpItemKindField = { link = "@variable.member" },
      CmpItemKindEnum = { link = "@variable.member" },
      CmpItemKindKeyword = { link = "@keyword" },
      CmpItemKindSnippet = { link = "@markup" },
      CmpItemKindColor = { link = "DevIconCss" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "@constant" },
      CmpItemKindEnumMember = { link = "@variable.member" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      CmpItemKindTypeParameter = { link = "@variable.parameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = "gray" },
      NavicSeparator = { fg = "gray" },

      -- TS rainbow colors
      rainbowcol1 = { fg = colors.fg },
      rainbowcol2 = { fg = colors.twilight },
      rainbowcol3 = { fg = colors.glow },
      rainbowcol4 = { fg = colors.aurora },
      rainbowcol5 = { fg = colors.bright_magenta },
      rainbowcol6 = { fg = colors.shimmer },
      rainbowcol7 = { fg = colors.fg },

      -- Rainbow delimiter
      RainbowDelimiterRed = { fg = colors.fg },
      RainbowDelimiterYellow = { fg = colors.twilight },
      RainbowDelimiterBlue = { fg = colors.glow },
      RainbowDelimiterOrange = { fg = colors.aurora },
      RainbowDelimiterGreen = { fg = colors.bright_magenta },
      RainbowDelimiterViolet = { fg = colors.shimmer },
      RainbowDelimiterCyan = { fg = colors.fg },

      -- mini.indentscope
      MiniIndentscopeSymbol = { fg = colors.bright_magenta },
      MiniIndentscopeSymbolOff = { fg = colors.bright_magenta },

      -- goolord/alpha-nvim
      AlphaHeader = { fg = colors.twilight },
      AlphaButtons = { fg = colors.glow },
      AlphaShortcut = { fg = colors.shimmer },
      AlphaFooter = { fg = colors.twilight, italic = true },

      -- nvimdev/dashboard-nvim
      DashboardShortCut = { fg = colors.glow },
      DashboardHeader = { fg = colors.twilight },
      DashboardCenter = { fg = colors.fg },
      DashboardFooter = { fg = colors.twilight, italic = true },
      DashboardKey = { fg = colors.shimmer },
      DashboardDesc = { fg = colors.glow },
      DashboardIcon = { fg = colors.glow, bold = true },

      -- dap UI
      DapUIPlayPause = { fg = colors.bright_green },
      DapUIRestart = { fg = colors.aurora },
      DapUIStop = { fg = colors.flare },
      DapUIStepOver = { fg = colors.glow },
      DapUIStepInto = { fg = colors.glow },
      DapUIStepOut = { fg = colors.glow },
      DapUIStepBack = { fg = colors.glow },
      DapUIType = { fg = colors.bright_blue },
      DapUIScope = { fg = colors.bright_cyan },
      DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
      DapUIDecoration = { fg = colors.bright_cyan },
      DapUIThread = { fg = colors.bright_green },
      DapUIStoppedThread = { fg = colors.bright_cyan },
      DapUISource = { fg = colors.bright_blue },
      DapUILineNumber = { fg = colors.bright_cyan },
      DapUIFloatBorder = { fg = colors.bright_cyan },
      DapUIWatchesEmpty = { fg = colors.twilight },
      DapUIWatchesValue = { fg = colors.bright_green },
      DapUIWatchesError = { fg = colors.twilight },
      DapUIBreakpointsPath = { fg = colors.bright_cyan },
      DapUIBreakpointsInfo = { fg = colors.bright_green },
      DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
      DapStoppedLine = { default = true, link = "Visual" },
      DapUIWinSelect = { fg = colors.bright_cyan, bold = true },

      -- Notify
      NotifyInfoIcon = { fg = colors.glow },
      NotifyInfoTitle = { fg = colors.glow },
      NotifyInfoBorder = { fg = "#2C453F" },
      NotifyErrorIcon = { fg = colors.flare },
      NotifyErrorTitle = { fg = colors.flare },
      NotifyErrorBorder = { fg = "#DD6E6B" },
      NotifyWarnIcon = { fg = colors.aurora },
      NotifyWarnTitle = { fg = colors.aurora },
      NotifyWarnBorder = { fg = "#785637" },

      -- Snacks Picker
      SnacksPickerTitle = { fg = colors.glow, bg = colors.menu },
      SnacksPickerBorder = { fg = colors.comment },
      SnacksPickerNormal = { fg = colors.fg, bg = colors.comment },
      SnacksPickerMatch = { fg = colors.aurora },
      SnacksPickerCursor = { fg = colors.bg, bg = colors.glow },
      SnacksPickerSelected = { fg = colors.white, bg = colors.selection },
      SnacksPickerPrompt = { fg = colors.twilight },
      SnacksPickerDim = { fg = colors.comment },
   }
end

return {
   setup = setup,
}
