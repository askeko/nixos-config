local cfg = require("lspconfig")

cfg.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
	disable = { 'missing-fields' }
      }
    }
  }
})
