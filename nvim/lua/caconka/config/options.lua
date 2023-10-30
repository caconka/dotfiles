local home = vim.env.HOME
local config = home .. "/.config/nvim"
local root = vim.env.USER == "root"
local vi = vim.v.progname == "vi"
local opt = vim.opt

vim.wo.colorcolumn = "+1"

opt.autoindent = true -- maintain indent of current line
opt.backspace = "indent,start,eol" -- allow unrestricted backspacing in insert mode
opt.backup = false -- don"t make backups before writing
opt.backupcopy = "yes" -- overwrite files to update, instead of renaming + rewriting
opt.backupdir = config .. "/backup//" -- keep backup files out of the way (ie. if "backup" is ever set)
opt.backupdir = opt.backupdir + "." -- fallback
opt.backupskip = opt.backupskip + "*.re,*.rei" -- prevent bsb"s watch mode from getting confused (if "backup" is ever set)
opt.belloff = "all" -- never ring the bell for any reason
opt.cursorline = true -- highlight current line
opt.diffopt = opt.diffopt + "foldcolumn:0" -- don"t show fold column in diff view
opt.directory = config .. "/nvim/swap//" -- keep swap files out of the way
opt.directory = opt.directory + "." -- fallback
opt.emoji = false -- don"t assume all emoji are double width
opt.fillchars = {
	diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
	eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
	fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
	vert = "┃", -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
}
opt.foldlevelstart = 99 -- start unfolded
opt.formatoptions = opt.formatoptions + "j" -- remove comment leader when joining comment lines
opt.formatoptions = opt.formatoptions + "n" -- smart auto-indenting inside numbered lists
opt.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
opt.inccommand = "split" -- live preview of :s results
opt.ignorecase = true -- ignore case in searches
opt.joinspaces = false -- don"t autoinsert two spaces after ".", "?", "!" for join command
opt.laststatus = 2 -- always show status line
opt.lazyredraw = true -- don"t bother updating screen during macro playback
opt.linebreak = true -- wrap long lines at characters in "breakat"
opt.list = true -- show whitespace
opt.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	tab = "▷⋯", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
	trail = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
}

if vi then
	opt.loadplugins = false
end

opt.modelines = 5 -- scan this many lines looking for modeline
opt.number = true -- show line numbers in gutter
opt.pumblend = 10 -- pseudo-transparency for popup-menu
opt.relativenumber = true -- show relative numbers in gutter
opt.scrolloff = 3 -- start scrolling 3 lines before edge of viewport

if root then
	opt.shada = "" -- Don"t create root-owned files.
	opt.shadafile = "NONE"
else
	-- Defaults:
	--   Neovim: !,"100,<50,s10,h
	--
	-- - ! save/restore global variables (only all-uppercase variables)
	-- - "100 save/restore marks from last 100 files
	-- - <50 save/restore 50 lines from each register
	-- - s10 max item size 10KB
	-- - h do not save/restore "hlsearch" setting
	--
	-- Our overrides:
	-- - "0 store marks for 0 files
	-- - <0 don"t save registers
	-- - f0 don"t store file marks
	-- - n: store in ~/.config/nvim/
	--
	opt.shada = "'0,<0,f0,n~/.config/nvim/shada"
end

opt.shell = "sh" -- shell to use for `!`, `:!`, `system()` etc.
opt.shiftround = false -- don"t always indent by multiple of shiftwidth
opt.shiftwidth = 2 -- spaces per tab (when shifting)
opt.shortmess = opt.shortmess + "A" -- ignore annoying swapfile messages
opt.shortmess = opt.shortmess + "I" -- no splash screen
opt.shortmess = opt.shortmess + "O" -- file-read message overwrites previous
opt.shortmess = opt.shortmess + "T" -- truncate non-file messages in middle
opt.shortmess = opt.shortmess + "W" -- don"t echo "[w]"/"[written]" when writing
opt.shortmess = opt.shortmess + "a" -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
opt.shortmess = opt.shortmess + "c" -- completion messages
opt.shortmess = opt.shortmess + "o" -- overwrite file-written messages
opt.shortmess = opt.shortmess + "t" -- truncate file messages at start
opt.showbreak = "↳ " -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
opt.showcmd = false -- don"t show extra info at end of command line
opt.sidescroll = 0 -- sidescroll in jumps because terminals are slow
opt.sidescrolloff = 3 -- same as scrolloff, but for columns
opt.smartcase = true -- don"t ignore case in searches if uppercase characters present
opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace

if not vi then
	opt.softtabstop = -1 -- use "shiftwidth" for tab/bs at end of line
end

opt.spellcapcheck = "" -- don"t check for capital letters at start of sentence
opt.splitbelow = true -- open horizontal splits below current window
opt.splitright = true -- open vertical splits to the right of the current window
opt.suffixes = opt.suffixes - ".h" -- don"t sort header files at lower priority
opt.swapfile = false -- don"t create swap files
opt.switchbuf = "usetab" -- try to reuse windows/tabs when switching buffers
opt.synmaxcol = 200 -- don"t bother syntax highlighting long lines
opt.tabstop = 2 -- spaces per tab
opt.termguicolors = true -- use guifg/guibg instead of ctermfg/ctermbg in terminal

if root then
	opt.undofile = false -- don"t create root-owned files
else
	opt.undodir = config .. "/undo//" -- keep undo files out of the way
	opt.undodir = opt.undodir + "." -- fallback
	opt.undofile = true -- actually use undo files
end

opt.updatetime = 2000 -- CursorHold interval
opt.updatecount = 0 -- update swapfiles every 80 typed chars
opt.viewdir = config .. "/view" -- where to store files for :mkview
opt.viewoptions = "cursor,folds" -- save/restore just these (with `:{mk,load}view`)
opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
opt.visualbell = true -- stop annoying beeping for non-error errors
opt.whichwrap = "b,h,l,s,<,>,[,],~" -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
opt.wildcharm = 26 -- ("<C-z>") substitute for "wildchar" (<Tab>) in macros
opt.wildignore = opt.wildignore + "*.o,*.rej,*.so" -- patterns to ignore during file-navigation
opt.wildmenu = true -- show options as list when switching buffers etc
opt.wildmode = "longest:full,full" -- shell-like autocomplete to unambiguous portion
opt.winblend = 10 -- psuedo-transparency for floating windows
opt.writebackup = false -- don"t keep backups after writing
