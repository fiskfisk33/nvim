vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>tt", ":FloatermToggle<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:FloatermToggle<CR>")

--vim.g.floaterm_wintype = 'split'
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'FloatermOpen',
  command = 'set nonumber',
})
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'FloatermOpen',
  command = 'set norelativenumber',
})
