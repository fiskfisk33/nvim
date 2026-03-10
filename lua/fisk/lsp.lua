local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup {
  sources = {
    {name = 'path'},
    { name = 'nvim_lsp' },
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<C-S-p>'] = cmp.mapping.scroll_docs(-4),
    ['<C-S-n>'] = cmp.mapping.scroll_docs(4),

    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() then
        cmp.confirm({select = false})
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

---
---vim.lsp.config('luals', {
---  cmd = {'lua-language-server'},
---  filetypes = {'lua'},
---  root_markers = {'.luarc.json', '.luarc.jsonc'},
---})

vim.lsp.enable({
	'luals',
	'elp',
	'basedpyright',
  'sonarlint',
})

--LSP keymappings--
local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
	  local opts = { buffer = args.buf, silent = true }
	  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
--	  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition({}) end, opts)
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', FzfLua.lsp_definitions, {}) --go definition
          vim.keymap.set('n', 'gt', FzfLua.lsp_typedefs, {}) --go definition
          vim.keymap.set('n', 'gi', FzfLua.lsp_implementations, {}) --go implementation
          vim.keymap.set('n', 'gr', FzfLua.lsp_references, {}) --go list refs
          vim.keymap.set('n', '<leader>fdd', FzfLua.diagnostics_document, {}) --go prev diagnostic
          vim.keymap.set('n', '<leader>fda', FzfLua.diagnostics_workspace, {}) --go prev diagnostic
	  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})
          --vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
	  --vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
	  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {}) --code actions

--          vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {}) --go prev diagnostic
--          vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {}) --go prev diagnostic

  end,

})

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	float = {
		border = 'rounded',
		focusable = false,
	}

})

