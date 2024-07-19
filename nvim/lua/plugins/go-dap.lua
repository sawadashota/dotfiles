return {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
        },
        "theHamsta/nvim-dap-virtual-text",
        {
            "mfussenegger/nvim-dap",
        }
    },
    config = function()
        require('dap-go').setup()
        require('dapui').setup()
        require("nvim-dap-virtual-text").setup()
    end
}

