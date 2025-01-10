return {
  {
    'nvim-telescope/telescope.nvim',
    enabled = true,
    --tag = "0.1.8",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key"
            },
          },
        },
        pickers = {
          buffers = {
            theme = "ivy"
          },
          --find_files = {
          --  theme = 'ivy'
          --},
          help_tags = {
            theme = "ivy"
          },
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files {
          cwd = vim.fn.stdpath('config')
        }
      end, { desc = 'Telescope find files in nvim configs' })
    end
  }
}
