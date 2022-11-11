local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end


require('nvim-autopairs').setup()

local m = require'markid'
configs.setup({
	ensure_installed = {
        "lua",
        "python",
        "json",
        "javascript",
        "html",
        "toml",
        "markdown",
        "css",
        "comment"
    }, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    markid = {
        enable = true,
        colors = m.colors.medium,
        queries = m.queries,
        is_supported = function(lang)
            local queries = configs.get_module("markid").queries
            return pcall(vim.treesitter.parse_query, lang, queries[lang] or queries['default'])
        end
    }
})
