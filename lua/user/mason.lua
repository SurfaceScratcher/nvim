
-- Mason Setup
require("mason").setup()

-- .scad -> openscad
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.scad",
  callback = function()
    vim.bo.filetype = "openscad"
  end,
})

-- .ts -> typescript 
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ts",
  callback = function()
    vim.bo.filetype = "typescript"
  end,
})



vim.lsp.enable({ "openscad_ls" })
vim.lsp.enable({ "typescript_ls"})

-- nvim-cmp Setup
local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),   -- Completion manuell triggern
    ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Auswahl übernehmen
    ["<C-e>"]     = cmp.mapping.abort(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP Keymaps bei Attach setzen
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)



    -- Info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  end,
})
