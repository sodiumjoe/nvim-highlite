-- This file should be edited by the user. Read the instructions of each section and then edit them as desired.

--[[ Highlite, a Neovim colorscheme template.
	* Author:     Iron-E (https://github.com/Iron-E)
	* Repository: https://github.com/sodiumjoe/nvim-highlite

	Initially forked from vim-rnb, a Vim colorsheme template:
	* Author:        Romain Lafourcade (https://github.com/romainl)
	* Canonical URL: https://github.com/romainl/vim-rnb
]]

--[[ Introduction
	This template is designed to help Neovim users create their own colorschemes without much effort.

	You will not need any additional tooling to run this file. Just open it in Neovim and follow the instructions.

	The process is divided in five steps:
	1. Rename the template,
	2. Edit your colorscheme's information,
	3. Define your colors,
	4. Define your highlight groups and links, and
	5. Sourcing your colorscheme.
]]

--[[ Step 1: Renaming
	* If this file is distributed with a colorscheme it's probably already named correctly
	  and you can skip this step.
	* If you forked/cloned/copied this repository to create your own colorscheme, you will have to
	  rename this template to match the name of your colorscheme.

	NOTE: Neovim doesn't really care about whitespace in the name of the colorscheme but it does for
	filenames so make sure your filename doesn't have any whitespace character.

	| colorscheme name  | module name | template filename |
	|:-----------------:|:-----------:|:-----------------:|
	| foobar            | foobar      | foobar.lua        |
	| foo-bar           | foo_bar     | foo_bar.lua       |
	| foo bar           | foo_bar     | foo_bar.lua       |
	| foo_bar           | foo_bar     | foo_bar.lua       |

	Rename the following files:
	* `colors/sodium.vim`
	* `lua/sodium.lua`

	Where 'sodium' is the name of your colorscheme.

	TIP: If you are on a Unix-based system (or have WSL on Windows) you can use the setup script at the root of this repo.
	     See the README for more details.
]]

--[[ Step 2: Information
	In this step you will define information that helps Neovim process:

	1. How users access your colorscheme;
	2. How your colorscheme should be rendered.
]]

-- This is the name of your colorscheme which will be used as per |g:colors_name|.
vim.g.colors_name = "sodium"

--[[ Step 3: Colors
	Next you will define all of the colors that you will use for the color scheme.

	Each one should be made up of three parts:

```lua
	<color name> = { -- Give each color a distinctive name.
		'#<hex color code>', -- Hexadecimal color used in GVim/MacVim
		<16-bit color code>, -- Integer 0–255 used by terminals supporting 256 colors
		'<ANSI color name>'  -- color name used by less capable color terminals, can be 'darkred',
		                       'red', 'darkgreen', 'green', 'darkyellow', 'yellow', 'darkblue',
		                       'blue', 'darkmagenta', 'magenta', 'black', 'darkgrey', 'grey',
		                       'white'
	}
```

	NOTE: See https://gist.github.com/gagbo/7943c9a71cab22b641d2904a6d59ec3a
	      for a program that can generate 16-bit colors from a Hex code.

	If your colors are defined correctly, the resulting colorscheme is guaranteed
	to work in GVim (Windows/Linux), MacVim (MacOS), and any properly set up terminal
	emulator.

	NOTE: |Replace-mode| will probably be useful here.
]]
local black = { "#3C4C55", 0, "black" }
local gray = { "#899BA6", 244, "gray" }
local gray_dark = { "#6A7D89", 236, "darkgrey" }
local gray_darker = { "#556873", 244, "gray" }
local gray_light = { "#C5D4DD", 251, "gray" }
local white = { "#E6EEF3", 15, "white" }

local tan = { "#F5D2AB", 180, "darkyellow" }

local red = { "#DF8C8C", 196, "red" }
local red_dark = { "#A76969", 124, "darkred" }
-- local red_light = { "#E7A9A9", 203, "red" }

local orange = { "#F2C38F", 208, "darkyellow" }
local orange_light = { "#F5D2AB", 214, "yellow" }

local yellow = { "#DADA93", 220, "yellow" }

local green = { "#A8CE93", 72, "green" }
local green_dark = { "#93B481", 83, "darkgreen" }
local green_light = { "#BEDAAE", 72, "green" }
local turqoise = { "#93CE9C", 33, "green" }

local blue = { "#83AFE5", 63, "blue" }
local cyan = { "#7FC1CA", 87, "cyan" }
local ice = { "#93B9E8", 63, "cyan" }
local teal = { "#7399C8", 38, "darkblue" }

local magenta = { "#d5508f", 126, "magenta" }
local magenta_dark = { "#bb0099", 126, "darkmagenta" }
local pink = { "#D18EC2", 162, "magenta" }
local pink_light = { "#DDAAD1", 38, "white" }
local purple = { "#9A93E1", 129, "magenta" }
local purple_light = { "#B3AEE8", 63, "magenta" }

local constant = cyan
local identifier = blue
local statement = yellow
local fn = orange
local type = yellow
local global = purple
local emphasis = pink
local special = orange
local trivial = gray

--[[ Step 4: highlights
	You can define highlight groups like this:

```lua
	<highlight group name> = {
		-- The color for the background, or `nil`
		bg = <color>,

		-- The color for the foreground, or `nil`
		fg = <color>

		-- The |highlight-blend| value, if one is desired.
		[, blend = <integer>]

		-- Style can be 'bold', 'italic', and more. See |attr-list| for more information.
		-- It can also have a color, and/or multiple <cterm>s.
		[, style = <cterm>|{<cterm> (, <cterm>) [color = <color>]} ]
	}
```

	You can also link one highlight group to another:

```lua
	<highlight group name> = '<highlight group name>'
```
	____________________________________________________________________________

	Here is an example to define `SpellBad` and then link some new group
	`SpellWorse` to it:

```lua
	SpellBad = { -- ← name of the highlight group
		bg = nil, -- background color
		fg = red, -- foureground color
		style = { -- the style
			'undercurl', -- undercurl (squiggly line)
			color = red -- the color of the undercurl
		}
	},
	SpellWorse = 'SpellBad'
```

	If you weren't satisfied with undercurl, and also wanted another effect, you can
	add another one below 'undercurl' and it will be applied as well:

```lua
	SpellBad = { -- ← name of the highlight group
		bg = nil, -- background color
		fg = red, -- foureground color
		style = { -- the style
			'undercurl', -- undercurl (squiggly line)
			'standout'
			color = red -- the color of the undercurl
		}
	}
```
	____________________________________________________________________________

	If you want to create a colorscheme that is responsive to the user's
	'background' setting, you can specify special `light` and `dark` keys to
	define how each group should be highlighted in each case.

```lua
	SpellBad = {
		bg = nil,
		dark = {fg = white},
		light = {fg = black},
		style = {'undercurl', color = red}
	}
```

	Whenever the user changes their 'background' setting, the settings inside of
	whichever key is relevant will be loaded.
	____________________________________________________________________________

	You can add any custom highlight group to the standard list below but you
	shouldn't remove any if you want a working colorscheme. Most of them are
	described under |highlight-default|, some from |group-name|, and others from
	common syntax groups.  Both help sections are good reads.
	____________________________________________________________________________

	If you want to inherit a specific attribute of another highlight group, you
	can do the following:

```lua
	SpellBad = function(self)
		local inherited_style = self.SpellRare.style
		inherited_style.color = red

		return {
			bg = nil,
			fg = nil,
			style = inherited_style
		}
	end
```

	The function will be executed by |sodium| and transformed into the
	expected result.
	____________________________________________________________________________

	NOTE: |Replace-mode| will probably be useful here.

	NOTE: /As long as you do not remove any highlight groups or colors/, you can
	      safely ignore any highlight groups that are `link`ed to others.

	      For example, programming languages almost exclusively link to the 1st
	      and 2nd sections, so as long as you define everything there you will
	      automatically be defining the rest of the highlights, which is one of
	      the benefits of using this template.
]]

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = { fg = gray_light, bg = NONE }

-- This is where the rest of your highlights should go.
local highlight_groups = {
	--[[ 4.1. Text Analysis ]]
	Comment = { fg = trivial, style = "italic" },
	NonText = { fg = gray_darker },
	EndOfBuffer = "NonText",
	Whitespace = "NonText",

	--[[ 4.1.1. Literals]]
	Constant = { fg = constant },
	String = { fg = highlight_group_normal.fg },
	Character = { fg = trivial },
	Number = { fg = statement },
	Boolean = { fg = special },
	Float = "Number",

	--[[ 4.1.2. Identifiers]]
	Identifier = { fg = identifier },
	Function = { fg = fn },

	--[[ 4.1.3. Syntax]]
	Statement = { fg = statement },
	Conditional = { fg = special },
	Repeat = { fg = statement },
	Label = { fg = emphasis },
	Operator = { fg = trivial },
	Keyword = { fg = global },
	Exception = { fg = red },
	Noise = "Delimiter",

	--[[ 4.1.4. Metatextual Information]]
	PreProc = { fg = tan },
	Include = { fg = green_light, style = "nocombine" },
	Define = { fg = blue, style = "nocombine" },
	Macro = { fg = blue, style = "italic" },
	PreCondit = { fg = tan, style = "italic" },

	--[[ 4.1.5. Semantics]]
	Type = { fg = type },
	StorageClass = { fg = identifier },
	Structure = { fg = blue },
	Typedef = { fg = cyan, style = "italic" },

	--[[ 4.1.6. Edge Cases]]
	Special = { fg = special },
	SpecialChar = { fg = red, style = "italic" },
	SpecialKey = "Character",
	Tag = "Label",
	Delimiter = { fg = special },
	SpecialComment = { fg = gray, style = { "bold", "nocombine" } },
	Debug = "WarningMsg",

	--[[ 4.1.7. Help Syntax]]
	Underlined = { fg = green, style = "underline" },
	Ignore = { fg = gray },
	Error = { fg = black, bg = red },
	Todo = { fg = yellow, style = { "bold", "underline" } },
	Hint = { fg = black, bg = yellow },
	Info = function(self)
		return { fg = self.Hint.fg, bg = pink_light, style = self.Hint.style }
	end,
	Warning = function(self)
		return { fg = self.Hint.fg, bg = orange, style = self.Hint.style }
	end,

	--[[ 4.2... Editor UI  ]]
	--[[ 4.2.1. Status Line]]
	StatusLine = { fg = white, bg = gray_darker },
	StatusLineNC = function(self)
		return { fg = gray_light, bg = self.StatusLine.bg }
	end,
	StatusLineTerm = "StatusLine",
	StatusLineTermNC = "StatusLineNC",
	StatusLineActiveItem = { fg = black, bg = gray_light },
	StatusLineError = function(self)
		return { fg = red, bg = self.StatusLine.bg }
	end,
	StatusLineWarning = function(self)
		return { fg = yellow, bg = self.StatusLine.bg }
	end,
	StatusLineSeparator = function(self)
		return { fg = black, bg = self.StatusLine.bg }
	end,

	--[[ 4.2.2. Separators]]
	FloatBorder = { fg = gray },
	TabLine = function(self)
		return { fg = highlight_group_normal.fg, bg = gray_darker }
	end,
	TabLineFill = function(self)
		return { fg = self.TabLine.bg, bg = black }
	end,
	TabLineSel = function(self)
		return { fg = self.TabLine.fg, bg = highlight_group_normal.bg }
	end,
	Title = { style = "bold" },
	VertSplit = { fg = white },

	--[[ 4.2.3. Conditional Line Highlighting]]
	Conceal = "NonText",
	CursorLine = {},
	CursorLineNr = function(self)
		return { fg = pink, bg = self.LineNr.bg }
	end,
	debugBreakpoint = "ErrorMsg",
	debugPC = "ColorColumn",
	LineNr = { fg = gray_darker },
	QuickFixLine = function(self)
		return { bg = self.StatusLine.bg }
	end,
	Visual = { style = "inverse" },
	VisualNOS = { bg = gray_darker },

	--[[ 4.2.4. Popup Menu]]
	Pmenu = { fg = highlight_group_normal.fg, bg = gray_dark },
	PmenuSbar = { bg = gray_darker },
	PmenuSel = { fg = black, bg = gray_light },
	PmenuThumb = { bg = white },
	WildMenu = "PmenuSel",
	NormalFloat = { fg = blue },

	--[[ 4.2.5. Folds]]
	FoldColumn = { bg = gray_darker, style = "bold" },
	Folded = { fg = black, bg = purple_light, style = "italic" },

	--[[ 4.2.6. Diffs]]
	DiffAdd = { fg = black, bg = green },
	DiffChange = {},
	DiffDelete = function(self)
		return { fg = self.DiffAdd.fg, bg = red }
	end,
	DiffText = function(self)
		return { fg = self.DiffAdd.fg, bg = yellow }
	end,

	--[[ 4.2.7. Searching]]
	IncSearch = { fg = black, bg = green, style = { "underline" } },
	MatchParen = { fg = green, style = { "bold", "underline" } },
	Search = { fg = black, bg = orange, style = { "underline" } },

	--[[ 4.2.8. Spelling]]
	SpellBad = { style = { "undercurl", color = red } },
	SpellCap = { style = { "undercurl", color = yellow } },
	SpellLocal = { style = { "undercurl", color = green } },
	SpellRare = { style = { "undercurl", color = orange } },

	--[[ 4.2.9. Conditional Column Highlighting]]
	ColorColumn = { style = "inverse" },
	SignColumn = {},

	--[[ 4.2.10. Messages]]
	ErrorMsg = { fg = red },
	HintMsg = { fg = yellow, style = "italic" },
	InfoMsg = { fg = pink_light, style = "italic" },
	ModeMsg = { fg = yellow },
	WarningMsg = { fg = orange },
	Question = { fg = orange_light, style = "underline" },

	--[[ 4.2.11. LSP / Diagnostics ]]
	DiagnosticError = "Error",
	DiagnosticFloatingError = "ErrorMsg",
	DiagnosticSignError = "DiagnosticFloatingError",

	DiagnosticWarn = "Warning",
	DiagnosticFloatingWarn = "WarningMsg",
	DiagnosticSignWarn = "DiagnosticFloatingWarn",

	DiagnosticHint = "Hint",
	DiagnosticFloatingHint = "HintMsg",
	DiagnosticSignHint = "DiagnosticFloatingHint",

	DiagnosticInfo = "Info",
	DiagnosticFloatingInfo = "InfoMsg",
	DiagnosticSignInfo = "DiagnosticFloatingInfo",

	DiagnosticUnderlineError = { style = { "undercurl", color = red } },
	DiagnosticUnderlineHint = { style = { "undercurl", color = magenta } },
	DiagnosticUnderlineInfo = { style = { "undercurl", color = pink_light } },
	DiagnosticUnderlineWarn = { style = { "undercurl", color = orange } },

	LspDiagnosticsDefaultError = "DiagnosticError",
	LspDiagnosticsFloatingError = "DiagnosticFloatingError",
	LspDiagnosticsSignError = "DiagnosticSignError",

	LspDiagnosticsDefaultWarning = "DiagnosticWarn",
	LspDiagnosticsFloatingWarning = "DiagnosticFloatingWarn",
	LspDiagnosticsSignWarning = "DiagnosticSignWarn",

	LspDiagnosticsDefaultHint = "DiagnosticHint",
	LspDiagnosticsFloatingHint = "DiagnosticFloatingHint",
	LspDiagnosticsSignHint = "DiagnosticSignHint",

	LspDiagnosticsDefaultInformation = "DiagnosticInfo",
	LspDiagnosticsFloatingInformation = "DiagnosticFloatingInfo",
	LspDiagnosticsSignInformation = "DiagnosticSignInfo",

	LspDiagnosticsUnderlineError = "DiagnosticUnderlineError",
	LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint",
	LspDiagnosticsUnderlineInfo = "DiagnosticUnderlineInfo",
	LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarn",

	DiagnosticError = "Error",
	DiagnosticFloatingError = "ErrorMsg",
	DiagnosticSignError = "DiagnosticFloatingError",

	DiagnosticWarn = "Warning",
	DiagnosticFloatingWarn = "WarningMsg",
	DiagnosticSignWarn = "DiagnosticFloatingWarn",

	DiagnosticHint = "Hint",
	DiagnosticFloatingHint = "HintMsg",
	DiagnosticSignHint = "DiagnosticFloatingHint",

	DiagnosticInfo = "Info",
	DiagnosticFloatingInfo = "InfoMsg",
	DiagnosticSignInfo = "DiagnosticFloatingInfo",

	--[[ 4.2.12. Cursor ]]
	-- Cursor   = {style='inverse'},
	-- CursorIM = 'Cursor',
	CursorColumn = { bg = gray_dark },

	--[[ 4.2.13. Misc ]]
	Directory = { fg = ice, style = "bold" },

	--[[ 4.3. Programming Languages
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.3.1. C ]]
	cConstant = "Constant",
	cCustomClass = "Type",

	--[[ 4.3.2. C++ ]]
	cppSTLexception = "Exception",
	cppSTLnamespace = "String",

	--[[ 4.3.3 C# ]]
	csBraces = "Delimiter",
	csClass = "Structure",
	csClassType = "Type",
	csContextualStatement = "Conditional",
	csEndColon = "Delimiter",
	csGeneric = "Typedef",
	csInterpolation = "Include",
	csInterpolationDelimiter = "SpecialChar",
	csLogicSymbols = "Operator",
	csModifier = "Keyword",
	csNew = "Operator",
	csNewType = "Type",
	csParens = "Delimiter",
	csPreCondit = "PreProc",
	csQuote = "Delimiter",
	csRepeat = "Repeat",
	csStorage = "StorageClass",
	csUnspecifiedStatement = "Statement",
	csXmlTag = "Define",
	csXmlTagName = "Define",
	razorCode = "PreProc",
	razorcsLHSMemberAccessOperator = "Noise",
	razorcsRHSMemberAccessOperator = "razorcsLHSMemberAccessOperator",
	razorcsStringDelimiter = "razorhtmlValueDelimiter",
	razorcsTypeNullable = "Special",
	razorcsUnaryOperatorKeyword = "Operator",
	razorDelimiter = "Delimiter",
	razorEventAttribute = "PreCondit",
	razorFor = "razorIf",
	razorhtmlAttribute = "htmlArg",
	razorhtmlAttributeOperator = "Operator",
	razorhtmlTag = "htmlTag",
	razorhtmlValueDelimiter = "Delimiter",
	razorIf = "PreCondit",
	razorImplicitExpression = "PreProc",
	razorLine = "Constant",
	razorUsing = "Include",

	--[[ 4.3.4. CSS ]]
	cssAtRule = "PreCondit",
	cssAttr = "Keyword",
	cssAttrComma = "Noise",
	cssAttrRegion = "Keyword",
	cssBraces = "Delimiter",
	cssClassName = "Identifier",
	cssClassNameDot = "Noise",
	cssFlexibleBoxAttr = "cssAttr",
	cssFunctionComma = "Noise",
	cssImportant = "Exception",
	cssNoise = "Noise",
	cssProp = "Label",
	cssPseudoClass = "Special",
	cssPseudoClassId = "cssSelectorOp",
	cssSelectorOp = "Operator",
	cssTagName = "Structure",
	cssUnitDecorators = "Type",
	scssAmpersand = "Special",
	scssAttribute = "Noise",
	scssBoolean = "Boolean",
	scssDefault = "Keyword",
	scssElse = "scssIf",
	scssMixinName = function(self)
		local super = self.cssClassName
		return { bg = super.bg, fg = super.fg, style = "italic" }
	end,
	scssIf = "PreCondit",
	scssInclude = "Include",
	scssSelectorChar = "Delimiter",
	scssDefinition = "PreProc",
	scssSelectorName = "Identifier",
	scssVariable = "Define",
	scssVariableAssignment = "Operator",

	--[[ 4.3.5. Dart ]]
	dartLibrary = "Statement",

	--[[ 4.3.6. dot ]]
	dotKeyChar = "Character",
	dotType = "Type",

	--[[ 4.3.7. Go ]]
	goBlock = "Delimiter",
	goBoolean = "Boolean",
	goBuiltins = "Operator",
	goField = "Identifier",
	goFloat = "Float",
	goFormatSpecifier = "Character",
	goFunction = "Function",
	goFunctionCall = "goFunction",
	goFunctionReturn = {},
	goMethodCall = "goFunctionCall",
	goParamType = "goReceiverType",
	goPointerOperator = "SpecialChar",
	goPredefinedIdentifiers = "Constant",
	goReceiver = "goBlock",
	goReceiverType = "goTypeName",
	goSimpleParams = "goBlock",
	goType = "Type",
	goTypeConstructor = "goFunction",
	goTypeName = "Type",
	goVarAssign = "Identifier",
	goVarDefs = "goVarAssign",

	--[[ 4.3.8. HTML ]]
	htmlArg = "Label",
	htmlBold = { fg = gray_light, style = "bold" },
	htmlTitle = "htmlBold",
	htmlEndTag = "htmlTag",
	htmlH1 = "markdownH1",
	htmlH2 = "markdownH2",
	htmlH3 = "markdownH3",
	htmlH4 = "markdownH4",
	htmlH5 = "markdownH5",
	htmlH6 = "markdownH6",
	htmlItalic = { style = "italic" },
	htmlSpecialTagName = "Keyword",
	htmlTag = "Special",
	htmlTagN = "Typedef",
	htmlTagName = "Type",

	--[[ 4.3.9. Java ]]
	javaClassDecl = "Structure",

	--[[ 4.3.10. JavaScript ]]
	jsFuncBlock = "Function",
	jsObjectKey = "Type",
	jsReturn = "Keyword",
	jsVariableDef = "Identifier",

	--[[ 4.3.11. JSON ]]
	jsonBraces = "luaBraces",
	jsonEscape = "SpecialChar",
	jsonKeywordMatch = "Operator",
	jsonNull = "Constant",
	jsonQuote = "Delimiter",
	jsonString = "String",
	jsonStringSQError = "Exception",

	--[[ 4.3.12. Lua ]]
	luaBraces = "Structure",
	luaBrackets = "Delimiter",
	luaBuiltin = "Keyword",
	luaComma = "Delimiter",
	luaFuncArgName = "Identifier",
	luaFuncCall = "Function",
	luaFuncId = "luaNoise",
	luaFuncKeyword = "Type",
	luaFuncName = "Function",
	luaFuncParens = "Delimiter",
	luaFuncTable = "Structure",
	luaIn = "luaRepeat",
	luaLocal = "Type",
	luaNoise = "Delimiter",
	luaParens = "Delimiter",
	luaSpecialTable = "Structure",
	luaSpecialValue = "Function",
	luaStringLongTag = function(self)
		local delimiter = self.Delimiter
		return { bg = delimiter.bg, fg = delimiter.fg, style = "italic" }
	end,

	--[[ 4.3.12. Make ]]
	makeCommands = "Statment",
	makeSpecTarget = "Type",

	--[[ 4.3.13. Markdown ]]
	markdownCode = "mkdCode",
	markdownCodeDelimiter = "mkdCodeDelimiter",
	markdownH1 = { fg = red, style = "bold" },
	markdownH2 = { fg = orange, style = "bold" },
	markdownH3 = { fg = yellow, style = "bold" },
	markdownH4 = { fg = green_dark, style = "bold" },
	markdownH5 = { fg = cyan, style = "bold" },
	markdownH6 = { fg = purple_light, style = "bold" },
	markdownLinkDelimiter = "mkdDelimiter",
	markdownLinkText = "mkdLink",
	markdownLinkTextDelimiter = "markdownLinkDelimiter",
	markdownUrl = "mkdURL",
	mkdBold = "Ignore",
	mkdBoldItalic = "mkdBold",
	mkdCode = "Keyword",
	mkdCodeDelimiter = "mkdBold",
	mkdCodeEnd = "mkdCodeStart",
	mkdCodeStart = "mkdCodeDelimiter",
	mkdDelimiter = "Delimiter",
	mkdHeading = "Delimiter",
	mkdItalic = "mkdBold",
	mkdLineBreak = "NonText",
	mkdLink = "Underlined",
	mkdListItem = "Special",
	mkdRule = function(self)
		return { fg = self.Ignore.fg, style = { "underline", color = self.Delimiter.fg } }
	end,
	mkdURL = "htmlString",

	--[[ 4.3.20. Python ]]
	pythonBrackets = "Delimiter",
	pythonBuiltinFunc = "Operator",
	pythonBuiltinObj = "Type",
	pythonBuiltinType = "Type",
	pythonClass = "Structure",
	pythonClassParameters = "pythonParameters",
	pythonDecorator = "PreProc",
	pythonDottedName = "Identifier",
	pythonError = "Error",
	pythonException = "Exception",
	pythonInclude = "Include",
	pythonIndentError = "pythonError",
	pythonLambdaExpr = "pythonOperator",
	pythonOperator = "Operator",
	pythonParam = "Identifier",
	pythonParameters = "Delimiter",
	pythonSelf = "Statement",
	pythonSpaceError = "pythonError",
	pythonStatement = "Statement",

	--[[ 4.3.21. Ruby ]]
	rubyClass = "Structure",
	rubyDefine = "Define",
	rubyInterpolationDelimiter = "Delimiter",

	--[[ 4.3.23. Scala ]]
	scalaKeyword = "Keyword",
	scalaNameDefinition = "Identifier",

	--[[ 4.3.24. shell ]]
	shDerefSimple = "SpecialChar",
	shFunctionKey = "Function",
	shLoop = "Repeat",
	shParen = "Delimiter",
	shQuote = "Delimiter",
	shSet = "Statement",
	shTestOpr = "Debug",

	--[[ 4.3.25. Solidity ]]
	solBuiltinType = "Type",
	solContract = "Typedef",
	solContractName = "Function",

	--[[ 4.3.26. TOML ]]
	tomlComment = "Comment",
	tomlDate = "Special",
	tomlFloat = "Float",
	tomlKey = "Label",
	tomlTable = "Structure",

	--[[ 4.3.27. VimScript ]]
	vimCmdSep = "Delimiter",
	vimFunction = "Function",
	vimFgBgAttrib = "Constant",
	vimHiCterm = "Label",
	vimHiCtermFgBg = "vimHiCterm",
	vimHiGroup = "Typedef",
	vimHiGui = "vimHiCterm",
	vimHiGuiFgBg = "vimHiGui",
	vimHiKeyList = "Operator",
	vimIsCommand = "Identifier",
	vimOption = "Keyword",
	vimScriptDelim = "Ignore",
	vimSet = "String",
	vimSetEqual = "Operator",
	vimSetSep = "Delimiter",
	vimUserFunc = "vimFunction",

	--[[ 4.3.28. XML ]]
	xmlAttrib = "htmlArg",
	xmlEndTag = "xmlTag",
	xmlEqual = "Operator",
	xmlTag = "htmlTag",
	xmlTagName = "htmlTagName",

	--[[ 4.3.29. SQL ]]
	sqlKeyword = "Keyword",
	sqlParen = "Delimiter",
	sqlSpecial = "Constant",
	sqlStatement = "Statement",
	sqlParenFunc = "Function",

	--[[ 4.3.30. dos INI ]]
	dosiniHeader = "Title",
	dosiniLabel = "Label",

	--[[ 4.3.31. Crontab ]]
	crontabDay = "StorageClass",
	crontabDow = "String",
	crontabHr = "Number",
	crontabMin = "Float",
	crontabMnth = "Structure",

	--[[ 4.3.32. PlantUML ]]
	plantumlArrowLR = "Statement",
	plantumlColonLine = {},
	plantumlMindmap = "Label",
	plantumlMindmap2 = "Label",

	--[[ 4.3.33. YAML ]]
	yamlInline = "Delimiter",
	yamlKey = "Label",

	--[[ 4.3.34. Git ]]
	diffAdded = "DiffAdd",
	diffRemoved = "DiffDelete",
	gitcommitHeader = "SpecialComment",
	gitcommitDiscardedFile = "gitcommitSelectedFile",
	gitcommitOverFlow = "Error",
	gitcommitSelectedFile = "Directory",
	gitcommitSummary = "Title",
	gitcommitUntrackedFile = "gitcommitSelectedFile",
	gitconfigAssignment = "String",
	gitconfigEscape = "SpecialChar",
	gitconfigNone = "Operator",
	gitconfigSection = "Structure",
	gitconfigVariable = "Label",
	gitrebaseBreak = "Keyword",
	gitrebaseCommit = "Tag",
	gitrebaseDrop = "Exception",
	gitrebaseEdit = "Define",
	gitrebaseExec = "PreProc",
	gitrebaseFixup = "gitrebaseSquash",
	gitrebaseMerge = "PreProc",
	gitrebasePick = "Include",
	gitrebaseReset = "gitrebaseLabel",
	gitrebaseReword = "gitrebasePick",
	gitrebaseSquash = "Macro",
	gitrebaseSummary = "Title",

	--[[ 4.3.35. Vimtex ]]
	texMathRegion = "Number",
	texMathSub = "Number",
	texMathSuper = "Number",
	texMathRegionX = "Number",
	texMathRegionXX = "Number",

	--[[ 4.3.36. Coq ]]
	coqConstructor = "Constant",
	coqDefBinderType = "coqDefType",
	coqDefContents1 = "coqConstructor",
	coqDefType = "Typedef",
	coqIndBinderTerm = "coqDefBinderType",
	coqIndConstructor = "Delimiter",
	coqIndTerm = "Type",
	coqKwd = "Keyword",
	coqKwdParen = "Function",
	coqProofDelim = "coqVernacCmd",
	coqProofDot = "coqTermPunctuation",
	coqProofPunctuation = "coqTermPunctuation",
	coqRequire = "Include",
	coqTactic = "Operator",
	coqTermPunctuation = "Delimiter",
	coqVernacCmd = "Statement",
	coqVernacPunctuation = "coqTermPunctuation",

	--[[ 4.3.37 Help ]]
	helpHeader = "Label",
	helpOption = "Keyword",
	helpHeadline = "Title",
	helpSectionDelim = "Delimiter",
	helpHyperTextJump = "Underlined",

	--[[ 4.3.38 Man ]]
	-- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
	manOptionDesc = "Special",
	manReference = "Tag",
	manUnderline = "Label",

	--[[ 4.3.39 Rust ]]
	rustAssert = "Debug",
	rustCharacterDelimiter = "rustNoise",
	rustIdentifier = "Identifier",
	rustStaticLifetime = "rustStorage",
	rustStringDelimiter = "rustNoise",

	--[[ 4.3.40 XXD ]]
	xxdAddress = "Label",
	xxdAscii = "Character",
	xxdDot = "Ignore",
	xxdSep = "Delimiter",

	--[[ 4.4. Plugins
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.4.1. ALE ]]
	ALEErrorSign = "DiagnosticSignError",
	ALEWarningSign = "DiagnosticSignWarn",

	--[[ 4.4.2. coc.nvim ]]
	CocErrorHighlight = "DiagnosticUnderlineError",
	CocErrorSign = "DiagnosticSignError",
	CocHintHighlight = "DiagnosticUnderlineHint",
	CocHintSign = "DiagnosticSignHint",
	CocInfoHighlight = "DiagnosticUnderlineInfo",
	CocInfoSign = "DiagnosticSignInfo",
	CocWarningHighlight = "DiagnosticUnderlineWarn",
	CocWarningSign = "DiagnosticSignWarn",

	--[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
	EasyMotion = "IncSearch",
	JumpMotion = "EasyMotion",

	--[[ 4.4.4. vim-gitgutter / vim-signify / gitsigns.nvim ]]
	GitGutterAdd = { fg = green },
	GitGutterChange = { fg = yellow },
	GitGutterDelete = { fg = red },
	GitGutterChangeDelete = { fg = orange },

	SignifySignAdd = "GitGutterAdd",
	SignifySignChange = "GitGutterChange",
	SignifySignDelete = "GitGutterDelete",
	SignifySignChangeDelete = "GitGutterChangeDelete",

	GitSignsAdd = "GitGutterAdd",
	GitSignsChange = "GitGutterChange",
	GitSignsDelete = "GitGutterDelete",

	--[[ 4.4.5. vim-indent-guides ]]
	IndentGuidesOdd = { bg = gray_darker },
	IndentGuidesEven = { bg = gray },

	--[[ 4.4.7. NERDTree ]]
	NERDTreeCWD = "Label",
	NERDTreeUp = "Operator",
	NERDTreeDir = "Directory",
	NERDTreeDirSlash = "Delimiter",
	NERDTreeOpenable = "NERDTreeDir",
	NERDTreeClosable = "NERDTreeOpenable",
	NERDTreeExecFile = "Function",
	NERDTreeLinkTarget = "Tag",

	--[[ 4.4.8. nvim-treesitter ]]
	TSConstBuiltin = "TSConstant",
	TSConstructor = "TSFunction",
	TSDanger = "ErrorMsg",
	TSFuncBuiltin = "TSFunction",
	TSTag = "Tag",
	TSWarning = "WarningMsg",
	TSVariableBuiltin = "Identifier",
	TSVariable = "Identifier",

	--[[ 4.4.9. barbar.nvim ]]
	BufferCurrent = "TabLineSel",
	BufferCurrentIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferCurrent.bg }
	end,
	BufferCurrentMod = { fg = tan, bg = black, style = "bold" },
	BufferCurrentSign = "HintMsg",
	BufferCurrentTarget = "BufferCurrentSign",

	BufferInactive = "BufferVisible",
	BufferInactiveIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferInactive.bg }
	end,
	BufferInactiveMod = "BufferVisibleMod",
	BufferInactiveSign = "BufferVisibleSign",
	BufferInactiveTarget = "BufferVisibleTarget",

	BufferTabpages = { style = "bold" },
	BufferTabpageFill = "TabLineFill",

	BufferVisible = "TabLine",
	BufferVisibleIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferVisible.bg }
	end,
	BufferVisibleMod = function(self)
		return { fg = white, bg = self.BufferVisible.bg, style = "italic" }
	end,
	BufferVisibleSign = "BufferVisible",
	BufferVisibleTarget = function(self)
		local super = self.BufferVisibleMod
		return { fg = super.fg, bg = super.bg, style = "bold" }
	end,

	--[[ 4.4.10. vim-sandwhich ]]
	OperatorSandwichChange = "DiffText",

	--[[ 4.4.11. Fern ]]
	FernBranchText = "Directory",

	--[[ 4.4.12. LSPSaga ]]
	DefinitionCount = "Number",
	DefinitionIcon = "Special",
	ReferencesCount = "Number",
	ReferencesIcon = "DefinitionIcon",
	TargetFileName = "Directory",
	TargetWord = "Title",

	--[[ 4.4.13. indent-blankline.nvim ]]
	IndentBlanklineChar = function(self)
		return vim.tbl_extend("force", self.Whitespace, { style = "nocombine" })
	end,
	IndentBlanklineSpaceChar = "IndentBlanklineChar",

	--[[ 4.4.14. trouble.nvim ]]
	TroubleCount = function(self)
		return vim.tbl_extend("force", self.Number, { style = "underline" })
	end,

	--[[ 4.4.15. todo-comments.nvim ]]
	TodoFgFIX = function(self)
		return { fg = self.ErrorMsg.fg }
	end,
	TodoFgHACK = function(self)
		return { fg = self.Todo.fg }
	end,
	TodoFgNOTE = "HintMsg",
	TodoFgPERF = "InfoMsg",
	TodoFgTODO = { fg = cyan, style = "italic" },
	TodoFgWARN = function(self)
		return { fg = self.WarningMsg.fg }
	end,

	TodoBgFIX = function(self)
		return { fg = black, bg = self.ErrorMsg.fg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgHACK = function(self)
		return { fg = black, bg = self.Todo.fg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgNOTE = function(self)
		return { fg = black, bg = self.Hint.bg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgPERF = function(self)
		return { fg = black, bg = self.Info.bg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgTODO = { fg = black, bg = cyan, style = { "bold", "italic", "nocombine" } },
	TodoBgWARN = function(self)
		return { fg = black, bg = self.Warning.bg, style = { "bold", "italic", "nocombine" } }
	end,

	TodoSignFIX = "TodoFgFIX",
	TodoSignHACK = "TodoFgHACK",
	TodoSignNOTE = "TodoFgNOTE",
	TodoSignPERF = "TodoFgPERF",
	TodoSignTODO = "TodoFgTODO",
	TodoSignWARN = "TodoFgWARN",

	--[[ 4.4.16. nvim-cmp ]]
	CmpItemAbbrDefault = "Ignore",
	CmpItemAbbrMatchDefault = "Underlined",
	CmpItemAbbrMatchFuzzyDefault = { fg = highlight_group_normal.fg, style = { "nocombine", "underline" } },
	CmpItemKindClassDefault = "CmpItemKindStructDefault",
	CmpItemKindColorDefault = "Label",
	CmpItemKindConstantDefault = "Constant",
	CmpItemKindConstructorDefault = "CmpItemKindMethodDefault",
	CmpItemKindDefault = "Type",
	CmpItemKindEnumDefault = "CmpItemKindStructDefault",
	CmpItemKindEnumMemberDefault = "CmpItemKindConstantDefault",
	CmpItemKindEventDefault = "Repeat",
	CmpItemKindFieldDefault = "Identifier",
	CmpItemKindFileDefault = "Directory",
	CmpItemKindFolderDefault = "CmpItemKindFileDefault",
	CmpItemKindFunctionDefault = "Function",
	CmpItemKindInterfaceDefault = "Type",
	CmpItemKindKeywordDefault = "Keyword",
	CmpItemKindMethodDefault = "CmpItemKindFunctionDefault",
	CmpItemKindModuleDefault = "Include",
	CmpItemKindOperatorDefault = "Operator",
	CmpItemKindPropertyDefault = "CmpItemKindFieldDefault",
	CmpItemKindReferenceDefault = "StorageClass",
	CmpItemKindSnippetDefault = "Special",
	CmpItemKindStructDefault = "Structure",
	CmpItemKindTextDefault = "String",
	CmpItemKindTypeParameterDefault = "Typedef",
	CmpItemKindUnitDefault = "CmpItemKindStructDefault",
	CmpItemKindValueDefault = "CmpItemKindConstantDefault",
	CmpItemKindVariableDefault = "Identifier",

	--[[ 4.4.17. packer.nvim ]]
	packerFail = "ErrorMsg",
	packerHash = "Number",
	packerPackageNotLoaded = "Ignore",
	packerStatusFail = "Statement",
	packerStatusSuccess = "packerStatusFail",
	packerSuccess = function(self)
		return { fg = green, style = self.packerFail.style }
	end,

	--[[ 4.4.18. nvim-tree ]]
	NvimTreeGitDeleted = function(self)
		return { fg = self.DiffDelete.bg }
	end,
	NvimTreeGitDirty = { fg = orange },
	NvimTreeGitIgnored = "Ignore",
	NvimTreeGitMerge = "NvimTreeGitRenamed",
	NvimTreeGitNew = function(self)
		return { fg = self.DiffAdd.bg }
	end,
	NvimTreeGitRenamed = function(self)
		return { fg = self.DiffChange.bg }
	end,
	NvimTreeGitStaged = { fg = cyan },

	--[[ 4.4.19. symbols-outline.nvim ]]
	FocusedSymbol = {},

	--[[ 4.4.20. mini.nvim ]]
	MiniJump = "MiniJump2dSpot",

	--[[ CUSTOM ]]
	ExtraWhitespace = "Error",

	HopNextKey = { bg = white, fg = black },
	HopNextKey1 = "HopNextKey",
	HopNextKey2 = { bg = gray_light, fg = black },
}

--[[ Step 5: Terminal Colors
	Define the color palette used by :terminal when in GUI Vim
	or in TUI Vim when 'termguicolors' is enabled. If this list
	is empty or if it doesn't contain exactly 16 items, the corresponding
	Vim variable won't be set.

	The expected values are colors defined in step 3.

	Terminal emulators use a basic palette of 16 colors that can be
	addressed by CLI and TUI tools via their name or their index, from
	0 to 15. The list is not really standardized but it is generally
	assumed to look like this:

	 | Index  | Name          |
	 |:------:|:-------------:|
	 | 1      | black         |
	 | 2      | darkred       |
	 | 3      | darkgreen     |
	 | 4      | darkyellow    |
	 | 5      | darkblue      |
	 | 6      | darkmagenta   |
	 | 7      | darkcyan      |
	 | 8      | gray          |
	 | 9      | darkgray      |
	 | 10     | red           |
	 | 11     | green         |
	 | 12     | yellow        |
	 | 13     | blue          |
	 | 14     | magenta       |
	 | 15     | cyan          |
	 | 16     | white         |

	While you are certainly free to make colors 0 to 7 shades of blue,
	this will inevitably cause usability issues so… be careful.
]]

local terminal_colors = {
	[1] = black,
	[2] = red_dark,
	[3] = green_dark,
	[4] = orange,
	[5] = blue,
	[6] = magenta_dark,
	[7] = teal,
	[8] = gray,
	[9] = gray_dark,
	[10] = red,
	[11] = green,
	[12] = yellow,
	[13] = turqoise,
	[14] = purple,
	[15] = cyan,
	[16] = gray_light,
}

--[[ Step 5: Sourcing
	When you wish to load your colorscheme, simply add this folder with a plugin manager
	and then use `colorscheme <your colorscheme name>`. For example, in my configuration,
	I source sodium by using `colorscheme sodium`.

	These online resources can help you design your colorscheme:

	1. the xterm palette.
		* http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
	2. play with hexadecimal colors right in the address bar (currently down).
		* http://whatcolor.herokuapp.com/
	3. similar concept, fuzzier implementation.
		* http://color.hailpixel.com/
	4. similar concept, fancier implementation.
		* http://colourco.de/
	5. extract a palette from an image.
		* http://www.colr.org/
	6. search for 'word', get images and color palettes.
		* http://colores.manugarri.com/
	7. user-created palettes.
		* http://www.colourlovers.com/palettes
	8. a no-nonsense colorscheme generator.
		* http://www.pluaang.dk/color+scheme/
	9. Adobe's fancy colorscheme generator.
		* https://color.adobe.com/
	10. The classic 'Color Scheme Designer', rebranded.
		* http://paletton.com/
	11. A very smart palette generator.
		* http://vrl.cs.brown.edu/color
	12. 'I Made My Own Colour Scheme and You Can Too!'.
		* https://cmcenroe.me/2018/04/03/colour-scheme.html

	A few things to note:

	* The Windows console (`cmd`) is limited to the 16 so-called 'ANSI' colors but it used to
			have a few of them interverted which makes numbers impractical. Use color names
			instead of numbers: :help cterm-colors
		* The Windows console doesn't do italics, underlines or bolded text;
			it is limited to normal and reverse. Keep that in mind if you want
			your colorscheme to be usable in as many environments as possible by as many
			people as possible.
		* The Windows TERMINAL, however, is capable of more.
	* All of the terminal emulators in use these days allow their users to
		change the 16 so-called 'ANSI' colors. It is also possible on some platforms
		to change some or all of the 256 colors in the xterm palette. Don't take
		anything for granted.
	* When used against a light background, strong colors work better than muted
		ones. Light or dark doesn't really matters. Also, it is harder to discriminate
		between two similar colors on a light background.
	* Both strong and muted colors work well against a dark background. It is also
		easier to work with similar colors, but dark colors don't work at all.
	* Use as many text samples as possible. String-heavy languages may look completely
		different than keyword-heavy ones. This can have an impact on the usability
		of your colorscheme.
	* Most terminal emulators and terminal multiplexers currently in use on unix-like
		systems support 256 colors but they almost always default to a '$TERM' that tells
		Vim otherwise. Your users will need to make sure their terminal emulator/multiplexer
		is correctly set up if they want to enjoy the best possible experience.
]]

require(vim.g.colors_name)(highlight_group_normal, highlight_groups, terminal_colors)

-- Thanks to Romain Lafourcade (https://github.com/romainl) for the original template (romainl/vim-rnb).
