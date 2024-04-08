local format = require("formatter")
format.setup()
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "FormatWrite"
})
