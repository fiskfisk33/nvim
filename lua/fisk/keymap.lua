--keep centered when moving around
vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>b", vim.cmd.BlameToggle, {virtual})
local function toggleRelative()
  vim.o.relativenumber = not(vim.o.relativenumber)
  vim.go.relativenumber = vim.o.relativenumber
end
vim.keymap.set("n", "<leader>n", toggleRelative)

vim.keymap.set("n", "<leader>dt", function()
  local new_config = not vim.diagnostic.is_enabled()
  vim.diagnostic.enable(new_config)
end)

vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>")
