local nvim_lsp = require('lspconfig')
local lspsaga = require 'lspsaga'
local servers = { "sumneko_lua", "tsserver", "pyright", "jdtls", "html", "cssls", "emmet_ls", "cssmodules_ls" }

require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities
    }

    if lsp == 'emmet_ls' then
        nvim_lsp[lsp].setup {
            capabilities = capabilities,
            filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'htmldjango' },
            init_options = {
                html = {
                    options = {
                        ["bem.enabled"] = true,
                    },
                },
            }
        }
    end

    if lsp == 'html' then
        nvim_lsp[lsp].setup {
            capabilities = capabilities,
            filetypes = { 'html', 'htmldjango' }
        }
    end
end

lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    --code_action_icon = " ",
    code_action_prompt = {
        enable = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false,
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = false,
}

local rightAlignFormatFunction = function(diagnostic)
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("🐙 %s", diagnostic.message)
    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return string.format("🐥 %s", diagnostic.message)
    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return string.format("🐬 %s", diagnostic.message)
    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return string.format("🐨 %s", diagnostic.message)
    end
end


vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        format = rightAlignFormatFunction
    },
})
