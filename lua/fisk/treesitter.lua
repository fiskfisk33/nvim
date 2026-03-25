vim.api.nvim_create_autocmd("FileType", {
  pattern = "*/ncs.conf",
  callback = function()
    vim.cmd([[setfiletype xml]])
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function() pcall(vim.treesitter.start) end,
})

