return {
    "rcarriga/nvim-dap-ui",
    event = "BufEnter",
    after = "nvim-dap",
    config = function()
      require("dapui").setup()
    end,
  }
