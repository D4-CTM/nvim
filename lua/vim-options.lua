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

-- sqls
function SetSqlsConnection(driver, connectionString)
  local clients = vim.lsp.get_active_clients({ name = "sqls" })
  if #clients == 0 then
    vim.notify("sqls is not running", vim.log.levels.ERROR)
    return
  end

  local client = clients[1]
  client.config.settings = {
    sqls = {
      connections = {
        {
          driver = driver,
          dataSourceName = connectionString
        }
      }
    }
  }

  -- Notify the LSP client of config change
  client.notify("workspace/didChangeConfiguration", {
    settings = client.config.settings
  })

  vim.notify("sqls connection updated: " .. driver)
end

vim.api.nvim_create_user_command("SqlsConnect", function(opts)
  local args = vim.split(opts.args, " ", { trimempty = true })
  if #args < 2 then
    print("Usage: :SqlsConnect <driver> <connection-string>")
    return
  end
  local driver = args[1]
  table.remove(args, 1)
  local conn = table.concat(args, " ")
  SetSqlsConnection(driver, conn)
end, {
  nargs = "+",
  complete = function()
    return { "sqlite3", "postgresql", "mysql" }
  end
})

