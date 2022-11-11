require('indent_blankline').setup {
    char = "¦",
    --space_char_blankline = " ",
    show_first_indent_level = true,
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {
        'help',
        'git',
        'markdown',
        'text',
        'terminal',
        'lspinfo',
        'packer'
    },
    buftype_exclude = {
        'terminal',
        'nofile'
    },
}
