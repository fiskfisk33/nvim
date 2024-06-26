vim.opt.termguicolors = true
--vim.g.codedark_italics = 1
--vim.g.codedark_transparent = 1

--vim.cmd [[ colorscheme codedark ]]


--require("catppuccin").setup({
--    flavour = "mocha", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--        light = "latte",
--        dark = "mocha",
--    },
--    transparent_background = true, -- disables setting the background color.
--    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
--    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--    dim_inactive = {
--        enabled = false, -- dims the background color of inactive window
--        shade = "dark",
--        percentage = 0.15, -- percentage of the shade to apply to the inactive window
--    },
--    no_italic = false, -- Force no italic
--    no_bold = false, -- Force no bold
--    no_underline = false, -- Force no underline
--    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--        comments = { "italic" }, -- Change the style of comments
--        conditionals = { "italic" },
--        loops = {},
--        functions = {},
--        keywords = {},
--        strings = {},
--        variables = {},
--        numbers = {},
--        booleans = {},
--        properties = {},
--        types = {},
--        operators = {},
--    },
--    color_overrides = {},
--    custom_highlights = {},
--    integrations = {
--        cmp = true,
--        gitsigns = true,
--        nvimtree = true,
--        treesitter = true,
--        notify = false,
--        mini = {
--            enabled = true,
--            indentscope_color = "",
--        },
--        -- For more plugins integrations please scroll down (https:--github.com/catppuccin/nvim#integrations)
--    },
--})
--
---- setup must be called before loading
--vim.cmd.colorscheme "catppuccin"
--

--vim.cmd.colorscheme "tender"
--vim.cmd('highlight Normal guibg=none ctermbg=none')
--vim.cmd('highlight SignColumn guibg=none ctermbg=none')
--
--

-- Default options:
require('kanagawa').setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none"
				}
			}
		}
	},
	overrides = function(colors)
		local theme = colors.theme
		return {
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus"
	},

})


require("kanagawa").load("dragon")
