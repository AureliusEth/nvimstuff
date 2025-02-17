local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

lsp.preset("recommended")
lsp.ensure_installed({
  'rust_analyzer',
  'solidity',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- Move LSP Config
configs.move_analyzer = {
  default_config = {
    cmd = { 'sui-move-analyzer' },
    filetypes = { 'move' },
    root_dir = lspconfig.util.find_git_ancestor,
  }
}

configs.solidity = {
  default_config = {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

vim.api.nvim_set_keymap('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  
  -- Enhanced diagnostics for Move
  if client.name == "move_analyzer" then
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
        virtual_text = true,
        signs = true,
        underline = true,
      }
    )
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
lspconfig.solidity.setup {}
lspconfig.move_analyzer.setup {}

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    severity_sort = true
})

-- Add Move filetype detection
vim.filetype.add({
  extension = {
    move = "move",
  },
})

-- Return the complete configuration including plugins
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Your LSP configuration here
    end
  },
  {
    "yanganto/move.vim",
    branch = "sui-move",
  }
}
