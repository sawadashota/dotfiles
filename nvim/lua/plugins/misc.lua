return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        default = true,
      }
    end,
  },
  {
    'github/copilot.vim',
  },
  {
    'numToStr/Comment.nvim',
  },
  {
    'williamboman/mason.nvim',
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
}

