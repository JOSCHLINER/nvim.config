vim.keymap.set('n', '<leader>d', function()
  vim.cmd 'Ex'
end, { desc = 'View [d]irectory files' })

vim.wo.relativenumber = true

-- use global clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- change tab size
vim.opt.tabstop = 5
vim.opt.softtabstop = 5
vim.opt.shiftwidth = 5
vim.opt.expandtab = true

-- View original directory
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    local startupdir = vim.fn.getcwd()

    vim.keymap.set('n', '<leader>r', function()
      vim.cmd(string.format('Ex %s', startupdir))
    end, { desc = 'View [r]oot directory' })
  end,
})

vim.o.undofile = true

-- Highlight yanked text
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.njk',
  callback = function()
    vim.opt.filetype = 'html'
  end,
})

-- Indent lines with H, L in visual mode(s)
vim.keymap.set({ 'v', 'x' }, '<C-h>', '<gv', { desc = 'Remove line indent' })
vim.keymap.set({ 'v', 'x' }, '<C-l>', '>gv', { desc = 'Indent line' })

-- Shift lines up and down
vim.keymap.set({ 'v', 'x' }, '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Shift line up' })
vim.keymap.set({ 'v', 'x' }, '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Shift line down' })

-- TODO: fix this for gopls
-- settings = { codelenses = { generate = false, gc_details = true, }
