-- Funcion para crear atajos de teclado en el estado normal
local nmap = function(tbl)
    -- Opciones por defecto de los atajos de teclado
    local default_opts = { noremap = true, silent = true }
    vim.keymap.set("n", tbl["key"], tbl["action"], default_opts)
end

local cmd_run = function(action)
    return "<cmd>" .. action .. "<CR>"
end

local leader_mix_keys = function(key)
    return "<Space>" .. key
end

local control_mix_keys = function(key)
    return "<C-" .. key .. ">"
end

local telescope_actions = function(action)
    return "lua require('telescope.builtin')." .. action .. "()"
end

local hop_actions = function(action, hint)
    return "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection." ..
        action .. ", current_line_only = true, " .. hint .. "})"
end

local lspsaga_actions = function(action)
    return "Lspsaga " .. action
end

-- Tabla de los atajos de teclado en el estado normal de neovim
local keys_normals = {
    quit = { key = leader_mix_keys("q"), action = cmd_run("q") },
    quit_absolute = { key = leader_mix_keys("Q"), action = cmd_run("q!") },

    -- Tab keys
    new_tab = { key = leader_mix_keys("t"), action = cmd_run("tabe") },
    delete_tab = { key = leader_mix_keys("d"), action = cmd_run("bd") },
    delete_tab_absolte = { key = leader_mix_keys("D"), action = cmd_run("bd!") },
    next_tab = { key = leader_mix_keys("n"), action = cmd_run("bn") },
    previous_tab = { key = leader_mix_keys("p"), action = cmd_run("bp") },

    -- Split resize
    horizontal_resize_split_add      = { key = control_mix_keys("Down"), action = cmd_run("resize +2") },
    horizontal_resize_split_subtract = { key = control_mix_keys("Up"), action = cmd_run("resize -2") },
    vertical_resize_split_add        = { key = control_mix_keys("Left"), action = cmd_run("vertical resize +2") },
    vertical_resize_split_subtract   = { key = control_mix_keys("Right"), action = cmd_run("vertical resize -2") },

    no_highlight_search = { key = leader_mix_keys("c"), action = cmd_run("nohl") },

    -- Neotree
    toggle_neotree = { key = control_mix_keys("n"), action = cmd_run("Neotree toggle") },

    -- Treesitter
    view_highlight_class = { key = leader_mix_keys("T"), action = cmd_run("TSHighlightCapturesUnderCursor") },

    -- Telescope
    telecope_buffers = { key = leader_mix_keys("fb"), action = cmd_run(telescope_actions("buffers")) },
    telecope_commands = { key = leader_mix_keys("fc"), action = cmd_run(telescope_actions("commands")) },
    telecope_diagnostics = { key = leader_mix_keys("fd"), action = cmd_run(telescope_actions("diagnostics")) },
    telecope_find_files = { key = leader_mix_keys("ff"), action = cmd_run(telescope_actions("find_files")) },
    telecope_live_grep = { key = leader_mix_keys("fg"), action = cmd_run(telescope_actions("live_grep")) },
    telecope_git_branches = { key = leader_mix_keys("fgb"), action = cmd_run(telescope_actions("git_branches")) },
    telecope_git_commits = { key = leader_mix_keys("fgc"), action = cmd_run(telescope_actions("git_commits")) },
    telecope_git_status = { key = leader_mix_keys("fgs"), action = cmd_run(telescope_actions("git_status")) },
    telecope_keymaps = { key = leader_mix_keys("fk"), action = cmd_run(telescope_actions("keymaps")) },
    telecope_help_tags = { key = leader_mix_keys("fh"), action = cmd_run(telescope_actions("help_tags")) },

    -- Hop
    hop_hint_after = { key = "f", action = cmd_run(hop_actions("AFTER_CURSOR", "")) },
    hop_hint_before = { key = "F", action = cmd_run(hop_actions("BEFORE_CURSOR", "")) },
    hop_hint_after_char = { key = "t", action = cmd_run(hop_actions("AFTER_CURSOR", "hint_offset = -1")) },
    hop_hint_before_char = { key = "T", action = cmd_run(hop_actions("BEFORE_CURSOR", "hint_offset = -1")) },

    -- Lspsaga
    lspsaga_rename = { key = "gr", action = cmd_run(lspsaga_actions("rename")) },
    lspsaga_code_action = { key = "gx", action = cmd_run(lspsaga_actions("code_action")) },
    lspsaga_range_code_action = { key = "gX", action = cmd_run(lspsaga_actions("range_code_action")) },
    lspsaga_hover_doc = { key = "K", action = cmd_run(lspsaga_actions("hover_doc")) },
    lspsaga_show_line_diagnostics = { key = "go", action = cmd_run(lspsaga_actions("show_line_diagnostics")) },
    lspsaga_diagnostics_next = { key = "gj", action = cmd_run(lspsaga_actions("diagnostic_jump_next")) },
    lspsaga_diagnostics_preview = { key = "gk", action = cmd_run(lspsaga_actions("diagnostic_jump_prev")) },

    -- Lsp
    lsp_format = { key = leader_mix_keys("lf"), action = cmd_run("lua vim.lsp.buf.format()") },
    lsp_format_new = { key = leader_mix_keys("lff"), action = cmd_run("lua vim.lsp.buf.formatting()") },

    -- Auto-save
    toggle_auto_save = { key = leader_mix_keys("na"), action = cmd_run("ASToggle") }

}

-- Seteando los atajos de teclado normales
for _, table_key in pairs(keys_normals) do
    nmap(table_key)
end
