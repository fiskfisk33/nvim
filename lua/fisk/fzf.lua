require("fzf-lua").setup {
  winopts = {
    preview = {
      horizontal = "right:82",
      vertica = "up:45%",
      flip_columns = 135,
    },
  },
  defaults = {
    actions = {
      ["ctrl-i"] = FzfLua.actions.toggle_ignore,
    },
  }
}

FzfLua.register_ui_select()

vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'FzfLua find files' })
vim.keymap.set('n', '<leader>fg', FzfLua.git_files, { desc = 'FzfLua find files git' })
vim.keymap.set('n', '<leader>gg', FzfLua.live_grep_native, { desc = 'FzfLua live grep' })
vim.keymap.set('n', '<leader>fb', FzfLua.buffers, { desc = 'FzfLua buffers' })
vim.keymap.set('n', '<leader>fh', FzfLua.helptags, { desc = 'FzfLua help tags' })
vim.keymap.set('n', '<leader>fc', FzfLua.command_history, { desc = 'FzfLua command history' })
vim.keymap.set('n', '<leader>fs', FzfLua.spell_suggest, { desc = 'FzfLua spell suggest' })
vim.keymap.set('n', '<leader>fr', FzfLua.registers, { desc = 'FzfLua registers'})

