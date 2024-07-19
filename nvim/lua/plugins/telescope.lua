return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-ghq.nvim',
  },
  config = function()
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup {
      defaults = {
        -- file_ignore_patterns = {
        --   'node_modules',
        --   '.git',
        --   '.idea',
        --   '.DS_Store',
        -- },
      },
      extensions = {
        file_browser = {
          theme = 'dropdown',
        },
        frecency = {
          matcher = "fuzzy",
          default_workspace = 'CMD',
        },
      }
    }

    telescope.load_extension("file_browser")
    telescope.load_extension("frecency")
    telescope.load_extension("ghq")


    vim.keymap.set("n", ";f", function()
    	builtin.find_files({
    		hidden = true,
    	})
    end)
    vim.keymap.set("n", ";g", function()
    	builtin.live_grep()
    end)
    vim.keymap.set("n", ";r", function()
    	builtin.oldfiles()
    end)
    vim.keymap.set("n", ";b", function()
    	builtin.buffers()
    end)
    vim.keymap.set("n", ";t", function()
    	builtin.help_tags()
    end)
    vim.keymap.set("n", ";;", function()
    	builtin.resume()
    end)
    vim.keymap.set("n", ";e", function()
    	builtin.diagnostics()
    end)
    vim.keymap.set("n", ";c", function()
    	builtin.git_commits()
    end)
    vim.keymap.set("n", "<Leader>g", function()
      telescope.extensions.ghq.ghq({
        hidden = true,
      })
    end)
    vim.keymap.set("n", "<Leader>f", function()
	    telescope.extensions.file_browser.file_browser({
		    path = "%:p:h",
		    cwd = vim.fn.expand("%:p:h"),
		    respect_gitignore = false,
		    hidden = true,
		    grouped = true,
		    previewer = false,
		    initial_mode = "normal",
		    layout_config = { height = 40 },
	    })
    end)
    vim.keymap.set("n", ";h", function()
      telescope.extensions.frecency.frecency()
    end)
  end,
}

