vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.title = true

vim.opt.shortmess = vim.opt.shortmess + "c"

vim.opt.updatetime = 50

vim.opt.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- show completion menu when there is only one option and don't autoselect options
vim.opt.completeopt = 'menuone,noselect'

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
