vim.opt.winborder = "rounded"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.wrap = false

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.mapleader = " "
local setKey = vim.keymap.set
setKey("n", "<leader>ct", ":tabnew | term<CR>")
setKey("n", "<leader>w", ":write<CR>")
setKey("n", "<leader>q", ":quit<CR>")
setKey("n", "<leader>U", ":redo<CR>")
setKey("v", "J", ":m '>+1<CR>gv=gv")
setKey("v", "K", ":m '<-2<CR>gv=gv")
setKey("n", "r", ":redo<CR>")
setKey("n", "<leader><S-tab>", ":tabprev<CR>")
setKey("n", "<leader><tab>", ":tabnext<CR>")
setKey("t", "<esc>", "<C-\\><C-n>")
setKey({ "n", "v" }, "Y", [["+y]])

vim.keymap.set("n", "F", function()
	local savedCursor = vim.api.nvim_win_get_cursor(0)
	vim.cmd("normal! gg")
	vim.cmd("normal! =G")
	vim.api.nvim_win_set_cursor(0, savedCursor)
end)
