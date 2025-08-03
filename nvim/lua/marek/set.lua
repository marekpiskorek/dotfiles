local opt = vim.opt
local tabLength = 2 -- avoid having different values for shiftwidth and tabstop

opt.backup = false -- creates a backup file
vim.g.have_nerd_font = true
vim.schedule(function()
	opt.clipboard = "unnamedplus" -- allow nvim to access system clipboard - we're doing this async to not increase the startup time.
end)
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.colorcolumn = "99999" -- fixes indentline for now
vim.o.inccommand = 'split'
opt.completeopt = { "menuone", "noselect" }
opt.cursorline = true -- highlight the current line
-- opt.expandtab = false -- don't convert tabs to spaces
opt.expandtab = true -- don't convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.number = true -- set numbered lines
opt.numberwidth = 2 -- set number column width to 2 {default 4}
opt.pumheight = 10 -- pop up menu height
opt.relativenumber = true -- set relative numbered lines
opt.scrolloff = 30 -- offset for smoother scrolling - if the value is bigger than half the screen then I believe it should always scroll
opt.shiftwidth = tabLength -- the number of spaces inserted for each indentation
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.spell = true -- spelling - treesitter by default disables spellchecks in code, allowing it in MD files and comments.
opt.spelllang = "en" -- ...in the kings language
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.tabstop = tabLength -- insert 2 spaces for a tab
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.title = true -- set the title of window to the value of the titlestring
opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
opt.undodir = vim.fn.stdpath "cache" .. "/undo"
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion
opt.wrap = true -- wrap them lines
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
opt.timeoutlen = 500 -- allow for longer timeout after pressing leader key

vim.g.mapleader = " " -- space is the leader now

vim.g.gitblame_date_format = '%r'

-- folding
-- opt.foldlevel = 20
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter folding expression
