-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup()

      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon [A]dd file' })
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Harpoon view marked files' })

      vim.keymap.set('n', '<C-h>', function()
        ui.nav_file(1)
      end, { desc = 'Harpoon navigate to file 1' })
      vim.keymap.set('n', '<C-j>', function()
        ui.nav_file(2)
      end, { desc = 'Harpoon navigate to file 2' })
      vim.keymap.set('n', '<C-k>', function()
        ui.nav_file(3)
      end, { desc = 'Harpoon navigate to file 3' })
      vim.keymap.set('n', '<C-l>', function()
        ui.nav_file(4)
      end, { desc = 'Harpoon navigate to file 4' })

      vim.keymap.set('n', '<C-p>', ui.nav_prev, { desc = 'Harpoon navigate to [p]rev file' })
      vim.keymap.set('n', '<C-n>', ui.nav_prev, { desc = 'Harpoon navigate to [n]ext file' })
    end,
  },
  -- DAP
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui', -- Optional: for a UI
      'theHamsta/nvim-dap-virtual-text', -- Optional: for virtual text
    },
    config = function()
      local dap = require 'dap'

      -- Configure DAP for Go
      dap.adapters.go = {
        type = 'server',
        port = 38697, -- Can be any port
        executable = {
          command = 'dlv',
          args = { 'dap', '--accept-multiclient', '--headless', '-l', '127.0.0.1:38697' },
        },
      }

      dap.configurations.go = {
        {
          type = 'go',
          name = 'Debug',
          request = 'launch',
          mode = 'auto',
          program = '${file}', -- This will debug the current file
        },
      }

      -- Keybindings for DAP
      vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', { desc = 'continue debug', noremap = true })
      vim.api.nvim_set_keymap('n', '<F10>', ':lua require"dap".step_over()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<F11>', ':lua require"dap".step_into()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<F12>', ':lua require"dap".step_out()<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
    end,
  },

  -- Undotree
  {
    'mbbill/undotree',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', { noremap = true })
    end,
  },
}
