vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'gra')

vim.bo.tabstop = 4 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 4 -- size of an indentation (sw).
vim.bo.expandtab = true -- always uses spaces instead of tab characters (et).
vim.bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

require("fisk.bootstraplazy")
require("fisk.lazy")
require("fisk.colorscheme")
require("fisk.fzf")
require("fisk.lsp")
require("fisk.floatterm")
require("fisk.unified")
require("fisk.gitsigns")
require("fisk.treesitter")
require("fisk.treesittercontext")

require("fisk.keymap")

require('lualine').setup()

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true

--undohistory
vim.opt.undofile = true
vim.opt.backupdir = os.getenv("HOME").."/.vimtmp//,."
vim.opt.undodir = os.getenv("HOME").."/.vimtmp//,."
vim.opt.directory = os.getenv("HOME").."/.vimtmp//"

require('mini.trailspace').setup()
MiniTrailspace.unhighlight()

--vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd({'WinEnter', 'VimEnter'}, {
  callback = function(ev)
    vim.cmd([[match ColorColumn /\%81v./]])
  end
})
