return {
    "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  -- keys = {
  --   {"n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts},
  --   {"n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts},
  -- },
  config = function()
    require("go").setup()
    local lspconfig = require('lspconfig')

    -- see https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      -- Mappings.
      local opts = { noremap=true, silent=true }
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

      -- -- Set autocommands conditional on server_capabilities
      -- if client.resolved_capabilities.document_highlight then
      --   require('lspconfig').util.nvim_multiline_command [[
      --     :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      --     :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      --     :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      --     augroup lsp_document_highlight
      --       autocmd!
      --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --     augroup END
      --   ]]
      -- end
    end

    lspconfig.gopls.setup{
      on_attach = on_attach,
    }
  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
