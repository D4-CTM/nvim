vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.colorcolumn = "90"
vim.opt.termguicolors = true
vim.opt.number = true
vim.g.mapleader = " "

-- Color scheme --
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- Color scheme --

vim.keymap.set("n", "<leader>gb", vim.cmd.Ex)

vim.opt.guicursor = ""
vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "Y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>h", function()
    vim.cmd([[:%s/\(\s*\n\)\{2,}/\r\r/g]])
    vim.fn.setreg("/", "")
    vim.cmd("nohlsearch")
end, {})

vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>fe", function()
    vim.cmd.w()
    vim.cmd.Ex()
end, {})
