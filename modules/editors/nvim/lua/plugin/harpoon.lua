local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local terminal = require('harpoon.term')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-s>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-q>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-l>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-h>', function() ui.nav_file(4) end)
vim.keymap.set('t', '<C-s>', function() ui.nav_file(1) end)
vim.keymap.set('t', '<C-q>', function() ui.nav_file(2) end)
vim.keymap.set('t', '<C-l>', function() ui.nav_file(3) end)
vim.keymap.set('t', '<C-h>', function() ui.nav_file(4) end)

vim.keymap.set('n', '<C-t>', function() terminal.gotoTerminal(1) end)
