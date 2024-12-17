return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      local opts = require('telescope.themes').get_ivy({
        cwd = vim.fn.stdpath("config")
      })
      vim.keymap.set('n', '<leader>ff', function() builtin.find_files(opts) end, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(opts) end, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', function() builtin.buffers(opts) end, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', function() builtin.help_tags(opts) end, { desc = 'Telescope help tags' })

      vim.keymap.set('n', '<leader>fn', function()
        require('telescope.builtin').find_files(require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath("config")
        }))
      end, { desc = 'Telescope find files in nvim configs' })
    end
  }
}
