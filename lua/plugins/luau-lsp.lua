return {
    "lopi-py/luau-lsp.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("luau-lsp").setup {
        platform = {
          type = "roblox",
        },
        types = {
          roblox_security_level = "PluginSecurity",
        },
        sourcemap = {
          enabled = true,
          autogenerate = true, -- automatic generation when the server is attached
          rojo_project_file = "default.project.json",
        },
        plugin = {
          enabled = true,
          port = 3667,
        },
      }
    end,
    event = "BufEnter",
}
