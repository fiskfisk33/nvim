require("lazy").setup({
  spec = {
    'nvim-treesitter/nvim-treesitter-context',
    'axkirillov/unified.nvim',
    "voldikss/vim-floaterm",
      -- import your plugins
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {}
    },
    { 'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { 'nvim-mini/mini.trailspace', version = false },
    'rebelot/kanagawa.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
      "chentoast/marks.nvim",
      event = "VeryLazy",
      opts = {},
    },
    {
      "m4xshen/autoclose.nvim",
        config = function()
          require("autoclose").setup({
            options = {
              disable_when_touch = true,
            }
          })
        end
    },
    {
      "hiphish/rainbow-delimiters.nvim",
        config = function()
          require("rainbow-delimiters.setup").setup({})
        end
    },
    {
        "iamkarasik/sonarqube.nvim",
        config = function()
          require("sonarqube").setup({})
        end
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        config = function()
          require('blame').setup {}
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    'stevearc/dressing.nvim',
    { 'hrsh7th/cmp-nvim-lsp' },
	  { 'hrsh7th/nvim-cmp' },
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
      'lewis6991/gitsigns.nvim'
    }

    -- {
    --   'saghen/blink.cmp',
    --   dependencies = { 'rafamadriz/friendly-snippets' },
    --
    --   -- use a release tag to download pre-built binaries
    --   version = '1.*',
    --
    --   opts = {
    --     -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    --     -- 'super-tab' for mappings similar to vscode (tab to accept)
    --     -- 'enter' for enter to accept
    --     -- 'none' for no mappings
    --     --
    --     -- All presets have the following mappings:
    --     -- C-space: Open menu or open docs if already open
    --     -- C-n/C-p or Up/Down: Select next/previous item
    --     -- C-e: Hide menu
    --     -- C-k: Toggle signature help (if signature.enabled = true)
    --     --
    --     -- See :h blink-cmp-config-keymap for defining your own keymap
    --     keymap = {
    --       preset = 'default',
    --             ['<C-S-p>'] = { 'scroll_documentation_up', 'fallback' },
    --             ['<C-S-n>'] = { 'scroll_documentation_down', 'fallback' },
    --             ['<Esc>'] = { 'hide', 'fallback' },
    --     },
    --
    --     appearance = {
    --       nerd_font_variant = 'mono'
    --     },
    --
    --     -- (Default) Only show the documentation popup when manually triggered
    --     completion = { documentation = { auto_show = true,
    --                  window = {
    --                border = 'rounded',
    --              }
    --                   }
    --      },
    --     --signature = { enabled = true },
    --
    --   },
    --   opts_extend = { "sources.default" }
    -- }

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

