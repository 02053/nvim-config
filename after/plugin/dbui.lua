local global = vim.g

global.db_ui_use_nerd_fonts = 1
global.db_ui_show_database_icon = 1
global.db_ui_force_echo_notifications = 1
global.db_ui_win_position = "left"
global.db_ui_winwidth = 80

-- global.db_ui_table_helpers = {}

global.db_ui_icons = {
	expanded = {
		db = "▾ ",
		buffers = "▾ ",
		saved_queries = "▾ ",
		schemas = "▾ ",
		schema = "▾ פּ",
		tables = "▾ 藺",
		table = "▾ ",
	},
	collapsed = {
		db = "▸ ",
		buffers = "▸ ",
		saved_queries = "▸ ",
		schemas = "▸ ",
		schema = "▸ פּ",
		tables = "▸ 藺",
		table = "▸ ",
	},
	saved_query = "",
	new_query = "璘",
	tables = "離",
	buffers = "﬘",
	add_connection = "",
	connection_ok = "✓",
	connection_error = "✕",
}
