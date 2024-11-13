return {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "Exafunction/codeium.vim",
    --event = "BufEnter",
  },

  {
    "3rd/image.nvim",
    event = "BufEnter",
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },

  {
    "vim-scripts/ReplaceWithRegister",
    event = "BufEnter",
  },

  {
    "junegunn/vim-peekaboo",
    event = "BufEnter",
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "hrsh7th/nvim-compe",
    event = "BufEnter",
  },

  {
    "nvim-lua/plenary.nvim",
  },

  {
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
  },

  { "rafamadriz/friendly-snippets" },

  {
    "garymjr/nvim-snippets",
    keys = {
      {
        "<Tab>",
        function()
          if vim.snippet.active { direction = 1 } then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return
          end
          return "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<Tab>",
        function()
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        end,
        expr = true,
        silent = true,
        mode = "s",
      },
      {
        "<S-Tab>",
        function()
          if vim.snippet.active { direction = -1 } then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
            return
          end
          return "<S-Tab>"
        end,
        expr = true,
        silent = true,
        mode = { "i", "s" },
      },
    },
  },

  {
    "kkoomen/vim-doge",
    event = "BufEnter",
  },

  {
    "unblevable/quick-scope",
    event = "BufEnter",
  },

  {
    "ggandor/leap.nvim",
    event = "BufEnter",
  },

  {
    "tpope/vim-repeat",
    event = "BufEnter",
  },

  { "mfussenegger/nvim-dap-python" },
  { "nvim-neotest/nvim-nio" },

  {
    "mfussenegger/nvim-dap",
    event = "BufEnter",
    after = "coq_nvim",
    config = function()
      require "custom.plugins.dap"
    end,
    requires = {
      "Pocco81/DAPInstall.nvim",
      --"mfussenegger/nvim-dap-python", can be used instead of a config file for the Python adapter by requiring it where your config would be.
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "BufEnter",
    after = "nvim-dap",
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup {
        -- the rest of your telescope config goes here
        extensions = {
          undo = {
            -- telescope-undo.nvim config, see below
            use_delta = true,
            side_by_side = true,
          },
          -- other extensions:
          -- file_browser = { ... }
        },
      }
      require("telescope").load_extension "undo"
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
    event = "BufEnter",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "java",
      },
    },
  },
}
