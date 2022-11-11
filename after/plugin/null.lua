local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.eslint_d,
    actions.eslint_d,
    diagnostics.eslint_d,
    diagnostics.djlint,
    formatting.autopep8
}

null_ls.setup({
    sources = sources
})
