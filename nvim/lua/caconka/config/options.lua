local opt = vim.opt

if vim.v.progname == "vi" then
	opt.loadplugins = false
end

opt.cursorline = true -- highlight current line
opt.number = true -- show line numbers in gutter
opt.relativenumber = true -- show relative numbers in gutter
opt.breakindent = true -- keep wrapped lines indented
opt.ignorecase = true -- ignore case in searches
opt.smartcase = true -- don't ignore case in searches if uppercase characters present
opt.scrolloff = 3 -- start scrolling 3 lines before edge of viewport
opt.sidescroll = 0 -- sidescroll in jumps because terminals are slow
opt.sidescrolloff = 3 -- same as scrolloff, but for columns

opt.diffopt = opt.diffopt + "vertical,foldcolumn:0" -- don't show fold column in diff view
opt.foldlevelstart = 99 -- start unfolded
opt.fillchars = {
	diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
	eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
	fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
	vert = "┃", -- BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
}

opt.conceallevel = 2 -- show conceals (like listchars and conceallevel)
opt.showbreak = "↳ " -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
opt.list = true -- show whitespace
opt.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	-- tab = "▷⋯", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
	tab = "⎸ ",
	trail = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
}


opt.synmaxcol = 200 -- don't bother syntax highlighting long lines
opt.updatetime = 2000 -- CursorHold interval
opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
opt.visualbell = true -- stop annoying beeping for non-error errors

opt.undofile = true -- actually use undo files

opt.splitbelow = true -- open new split windows below the current window
opt.splitright = true -- open new split windows to the right of the current window
