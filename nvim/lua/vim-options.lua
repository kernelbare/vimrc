
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("inoremap jj <ESC>")
vim.g.mapleader = ","

vim.opt.listchars = {
  tab = '→ ',
  eol = '↲',
  nbsp = '␣',
  trail = '•',
  extends = '⟩',
  precedes = '⟨',
}
vim.keymap.set('n', '<leader><space>', ':set nu! cursorline! cursorcolumn! hlsearch!<CR>',{ silent = true})

-- Tabs
vim.keymap.set('n', '<TAB>', 'gt', { silent = true })
vim.keymap.set('n', '<S-TAB>', 'gT', { silent = true })
vim.keymap.set('n', '<S-t>', ':tabnew<CR>', { silent = true })
