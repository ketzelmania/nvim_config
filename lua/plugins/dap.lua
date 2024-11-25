return  {
    "mfussenegger/nvim-dap",
    event = "BufEnter",
    after = "coq_nvim",
    config = function()
      require "config.dap"
    end,
    requires = {
      "Pocco81/DAPInstall.nvim",
      --"mfussenegger/nvim-dap-python", can be used instead of a config file for the Python adapter by requiring it where your config would be.
    },
  }
