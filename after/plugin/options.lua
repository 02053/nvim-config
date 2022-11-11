local opt = vim.opt
local global = vim.g
local api = vim.api
local exec = api.nvim_exec

global.loaded_matchparen = 1

-- Ignore compiled files
opt.wildignore = "__pycahe__"
opt.wildignore:append { "*.o", "*~", ".pyc", "*pycache*"}

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.incsearch = true
opt.showmatch = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.hidden = true
opt.equalalways = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 1000
opt.hlsearch = true
opt.scrolloff = 10

opt.mouse = 'i'

opt.termguicolors = true

-- Cursor line highlight control
opt.cursorline = true
local group = api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
	api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Tabs
opt.autoindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all"

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.formatoptions = opt.formatoptions
	- "a"
	- "t"
	+ "c"
	+ "q"
	- "o"
	+ "r"
	+ "n"
	+ "j"
	+ "2"

-- Set joinspaces
opt.joinspaces = false

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal"}

opt.undofile = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 20

exec([[
augroup AuBufWritePre
	autocmd!
	autocmd BufWritePre * let current_pos = getpos(".")
	autocmd BufWritePre * silent! undojoin | %s/\s\+$//e
	autocmd BufWritePre * silent! undojoin | %s/\n\+\%$//e
	autocmd BufWritePre * call setpos(".", current_pos)
	autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END
]], false)
