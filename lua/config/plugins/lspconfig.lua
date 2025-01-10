return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.csharp_ls.setup{}
    end,
  }
}
