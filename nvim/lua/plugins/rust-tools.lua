return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local rt = require("rust-tools")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    rt.setup({
      server = {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          -- Rust-specific keymaps
          vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
              command = "clippy"
            },
            procMacro = {
                enable = true,
            }
          },
        },
      },
    })
  end,
}

