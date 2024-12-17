return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      require 'nvim-treesitter.install'.prefer_git = false
      require 'nvim-treesitter.install'.compilers = { "zig" }
    end,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "javascript", "typescript", "c_sharp", "angular", "dockerfile", "helm", "html", "json", "jsdoc", "powershell", "sql", "yaml", "vim", "vimdoc", "markdown" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false
        }
      }
    end
  }
}
